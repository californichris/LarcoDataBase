USE LarcoOld
GO

ALTER TABLE tblEntradasDetalle
ADD CONSTRAINT pk_EntradasDetalleId PRIMARY KEY (ED_ID)


ALTER TABLE tblEntradasDetalle  WITH CHECK ADD  CONSTRAINT [FK_EntradasDetalle_Entradas] FOREIGN KEY([ENT_ID])
REFERENCES tblEntradas ([ENT_ID])
GO

ALTER TABLE tblEntradasDetalle CHECK CONSTRAINT [FK_EntradasDetalle_Entradas]
GO

ALTER TABLE tblEntradasDetalle
ALTER COLUMN ENT_ID INT NOT NULL

ALTER TABLE tblEntradasDetalle
ALTER COLUMN MAT_ID INT NOT NULL

ALTER TABLE tblEntradasDetalle
ALTER COLUMN ED_CANTIDAD INT NOT NULL

ALTER TABLE tblEntradasDetalle
ALTER COLUMN ED_COSTO INT NOT NULL

---------------------------------------------
--check this orders with rocio

/*
SET IDENTITY_INSERT tblMateriales ON

INSERT tblMateriales ([MAT_ID]
      ,[MAT_Fraccion]
      ,[MAT_Numero]
      ,[MAT_Descripcion]
      ,[MAT_Unidad]
      ,[MAT_Tipo]
      ,[MAT_Cantidad]
      ,[MAT_Costo]
      ,[MAT_UltimoCosto]
      ,[MAT_CostoPromedio]
      ,[MAT_Minimo]
      ,[MAT_Maximo]
      ,[MAT_Stock]
      ,[MAT_UltimoProvedor]
      ,[MAT_Usuario]
      ,[MAT_Fecha]
      ,[MAT_Ubicacion]
      ,[MAT_Total]
      ,[MAT_ProvNumero]
      ,[MAT_Kilos]
      ,[MAT_Densidad])
VALUES (4, '', '0001-01-1-07-02', 'Pastillas para fresado / TNEA 2.522 VC5',10,8,78,0.00,61.18,44.68,30,100,60,6,1,'2008-01-12 00:00:00.000','D1',4772.04,null,0,0.00)

INSERT tblMateriales ([MAT_ID]
      ,[MAT_Fraccion]
      ,[MAT_Numero]
      ,[MAT_Descripcion]
      ,[MAT_Unidad]
      ,[MAT_Tipo]
      ,[MAT_Cantidad]
      ,[MAT_Costo]
      ,[MAT_UltimoCosto]
      ,[MAT_CostoPromedio]
      ,[MAT_Minimo]
      ,[MAT_Maximo]
      ,[MAT_Stock]
      ,[MAT_UltimoProvedor]
      ,[MAT_Usuario]
      ,[MAT_Fecha]
      ,[MAT_Ubicacion]
      ,[MAT_Total]
      ,[MAT_ProvNumero]
      ,[MAT_Kilos]
      ,[MAT_Densidad])
VALUES (1109, '', '1099-62-2-06-06', 'Inserto para Desbaste Kennametal CNMG432RP   KCU10',10,21,30,0.00,8.00,7.00,25,40,50,30,15,'2013-08-22 00:00:00.000','Gabeta Gris',240.00,4050689,0,0.00)

SET IDENTITY_INSERT tblMateriales OFF


UPDATE tblEntradasDetalle set MAT_ID = huerfanos_id
where mat_id in (161,1844,1775,1046,156,1776,185,245,186,701,1279)

UPDATE tblSalidasDetalle set MAT_ID = huerfanos_id
where mat_id in (161,1844,1775,1046,156,1776,185,245,186,701,1279)

*/


select * from tblEntradas where ent_id in (

select * from tblMateriales where MAT_Descripcion = ''



select * from tbltiposmaterial

select * from tblMateriales

select * from tblEntradasDetalle 
where mat_id in (161,1844,1775,1046,1109,156,1776,4,185,245,186,701,1279)

select * from tblSalidasDetalle 
where mat_id in (161,1844,1775,1046,1109,156,1776,4,185,245,186,701,1279)

select distinct(mat_id) from tblSalidasDetalle where MAT_ID not in (select mat_id from tblMateriales)

select * from tblEntradasDetalle where mat_id in (161,
1844,
1775,
1046,
1109,
156,
1776,
4,
185,
245,
186,
701,
1279)



select distinct ent_id from tblEntradasDetalle where mat_id in (161,
1844,
1775,
1046,
1109,
156,
1776,
4,
185,
245,
186,
701,
1279)
)


-- then execute this constrain

ALTER TABLE tblEntradasDetalle  WITH CHECK ADD  CONSTRAINT [FK_EntradasDetalle_Materiales] FOREIGN KEY([MAT_ID])
REFERENCES tblMateriales ([MAT_ID])
GO

ALTER TABLE tblEntradasDetalle CHECK CONSTRAINT [FK_EntradasDetalle_Materiales]
GO

select * from tblprovedores
select * from tblTiposMaterial where tip_id = 25
select * from tblMateriales where MAT_Kilos = 1

select * from tblentradas where ent_id = 1
select * from tblentradasdetalle  where ent_id = 1

SELECT E.ED_ID, E.MAT_ID, E.ED_Cantidad, E.ED_Costo, M.MAT_Descripcion,
E.ED_Restante, M.MAT_Numero, M.MAT_ProvNumero
FROM tblEntradasDetalle E 
INNER JOIN tblMateriales M ON E.MAT_ID = M.MAT_ID 
WHERE E.ENT_ID = 6249;