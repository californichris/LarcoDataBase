-- 1- First check if tblentradasdetalle has the correct data types decimal(18,2) for Cantidad and Costo

ALTER TABLE tblEntradasDetalle
ALTER COLUMN ED_CANTIDAD decimal(18,2) NOT NULL

GO

ALTER TABLE tblEntradasDetalle
ALTER COLUMN ED_COSTO decimal(18,2) NOT NULL

GO

-- if the data types are not correct try to restore data
-- 17566
select count(*) from LarcoOld.dbo.tblEntradasDetalle 

select ED1.ED_ID, ED1.ED_Cantidad, ED2.ED_Cantidad, ED1.ED_Costo, ED2.ED_Costo
from LarcoOld.dbo.tblEntradasDetalle ED1
inner join LarcoPrev.dbo.tblEntradasDetalle ED2 ON ED1.ED_ID = ED2.ED_ID


select ED1.ED_ID, ED1.ED_Cantidad, ED2.ED_Cantidad, ED1.ED_Costo, ED2.ES_Costo, (ED2.ES_Costo - ED1.ED_Costo)
from LarcoOld.dbo.tblEntradasDetalle ED1
inner join LarcoOld.dbo.tblEntradasSalidas ED2 ON ED1.ED_ID = ED2.ED_ID
where (ED2.ES_Costo - ED1.ED_Costo) > 1 --<=1

/*
update LarcoOld.dbo.tblEntradasDetalle set ED_Costo = ED2.ES_Costo
from LarcoOld.dbo.tblEntradasDetalle ED1
inner join LarcoOld.dbo.tblEntradasSalidas ED2 ON ED1.ED_ID = ED2.ED_ID
where (ED2.ES_Costo - ED1.ED_Costo) <= 1
*/

go

-- 2- Create Templates Table and copy data

CREATE TABLE [dbo].[Templates](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateType] [int] NOT NULL,
	[TemplateName] [nvarchar](50) NOT NULL,
	[Template] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TemplateId] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_TemplateNameType] UNIQUE NONCLUSTERED 
(
	[TemplateName] ASC,
	[TemplateType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

-- Create view [EntradasSalidas_VW]

USE [LarcoOld]
GO


CREATE view [dbo].[EntradasSalidas_VW]
AS
SELECT ED.[ED_ID],ED.[ENT_ID],ED.[MAT_ID],ED.[ED_Restante],ED.[SL_Desp],ED.[ED_Cantidad],ED.[ED_Costo],

E.[ENT_Pedimento],E.[ENT_ClavePedimento],E.[ENT_Fecha],E.[ENT_PaisOrigen],E.[ENT_Nacional],E.[ENT_TipoImp],
E.[ENT_Factura],E.[ENT_OrdenCompra],E.[PROV_ID],E.[ENT_IVA],E.[USE_ID] AS [ENT_USE_ID],E.[ENT_Dolares],E.[ENT_TipoCambio],E.[ENT_Desp],

ES.ES_ID,ES.[ED_Cantidad] AS [ES_Cantidad], ES.ES_Costo, 

CAST(ED.ED_Costo * ED.ED_Cantidad AS decimal(18,2)) AS [Total],
CAST(ES.ES_Costo * SD.SD_Cantidad AS decimal(18,2)) AS [TotalSalida], 
CAST(ED.ED_Restante * ED.ED_Costo AS decimal(18,2)) AS [SaldoAlmacenDinero],

SD.SD_ID,/*SD.MAT_ID,*/SD.SD_Cantidad,SD.SL_Cantidad,SD.SL_Pedimento,SD.IS_SL,

S.SAL_ID,S.SAL_Fecha,S.SAL_Orden,S.SAL_Solicitado,S.USE_ID AS [SAL_USE_ID],

M.[MAT_Fraccion],M.[MAT_Numero],M.[MAT_Descripcion],M.[MAT_Unidad],M.[MAT_Tipo],M.[MAT_Cantidad],
M.[MAT_Costo],M.[MAT_UltimoCosto],M.[MAT_CostoPromedio],M.[MAT_Minimo],M.[MAT_Maximo],M.[MAT_Stock],
M.[MAT_UltimoProvedor],M.[MAT_Usuario],M.[MAT_Fecha],M.[MAT_Ubicacion],M.[MAT_Total],M.[MAT_ProvNumero],
M.[MAT_Kilos],M.[MAT_Densidad],

P.PROV_Nombre,T.TIP_Descripcion
FROM tblEntradasDetalle ED
INNER JOIN tblEntradas E ON ED.ENT_ID = E.ENT_ID
LEFT OUTER JOIN tblEntradasSalidas ES ON ED.ED_ID = ES.ED_ID
LEFT OUTER JOIN tblSalidasDetalle SD ON ES.SD_ID = SD.SD_ID
LEFT OUTER JOIN tblSalidas S ON SD.SAL_ID = S.SAL_ID
INNER JOIN tblMateriales M ON ED.MAT_ID = M.MAT_ID
LEFT OUTER JOIN tblProvedores P ON E.PROV_ID = P.PROV_ID
LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID
GO



--- 3 export configuration

select * from LarcoOld.dbo.[Page] order by UpdatedDate desc

-- 'Templates','RoleModuleMapping','EntradasContraSalidas','Salidas','Entradas'


-- 4 add missing constraind

USE [LarcoOld]
GO

ALTER TABLE [dbo].[tblSalidas]  WITH CHECK ADD  CONSTRAINT [FK_Salidas_Users] FOREIGN KEY([USE_ID])
REFERENCES [dbo].[tblUsers] ([USE_ID])
GO

ALTER TABLE [dbo].[tblSalidas] CHECK CONSTRAINT [FK_Salidas_Users]
GO

/*
ALTER TABLE [dbo].[tblSalidas]  WITH CHECK ADD  CONSTRAINT [FK_Salidas_Empleados] FOREIGN KEY(SAL_Solicitado)
REFERENCES [dbo].[tblEmpleados] ([Id])
GO

ALTER TABLE [dbo].[tblSalidas] CHECK CONSTRAINT [FK_Salidas_Empleados]
GO

select * from tblSalidas where SAL_Solicitado is null
select * from tblSalidas where SAL_Solicitado is null

*/

USE [LarcoOld]
GO

ALTER Table [dbo].[tblSalidasDetalle]
ALTER COLUMN MAT_ID int not null
GO


ALTER TABLE [dbo].[tblSalidasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SalidasDetalle_Materiales] FOREIGN KEY([MAT_ID])
REFERENCES [dbo].[tblMateriales] ([MAT_ID])
GO

ALTER TABLE [dbo].[tblSalidasDetalle] CHECK CONSTRAINT [FK_SalidasDetalle_Materiales]
GO

ALTER Table [dbo].[tblSalidasDetalle]
ALTER COLUMN SAL_ID int not null
GO

ALTER Table [dbo].[tblSalidasDetalle]
ALTER COLUMN SD_Cantidad decimal(18,2) not null
GO

select * from tblSalidasDetalle where ED_ID is null

-- update new pages Templates and entradas contra salidas


-- update table Page
ALTER Table [Page]
ADD ConnName varchar(50)


--------------------------------------
-- all above is done


-- need to calculate saldo use the following examples

  select * from tblEntradas where ent_id = 2936


  select 
  MAT_ID, ED_Cantidad,ENT_Fecha
  from tblEntradasDetalle ED  
  inner join tblEntradas E on ED.ENT_ID = E.ENT_ID
  where ED.MAT_ID = 337 
    union
  select 
  MAT_ID, (SD_Cantidad * -1),SAL_Fecha
  from tblSalidasDetalle ED  
  inner join tblSalidas E on ED.SAL_ID = E.SAL_ID
  where ED.MAT_ID = 337 
  order by 3 asc 

  select * from tblEntradasSalidas where MAT_ID = 337
