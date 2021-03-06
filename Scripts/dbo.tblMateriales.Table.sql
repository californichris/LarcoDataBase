USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMateriales](
	[MAT_ID] [int] IDENTITY(1,1) NOT NULL,
	[MAT_Fraccion] [varchar](50) NULL,
	[MAT_Numero] [varchar](50) NULL,
	[MAT_Descripcion] [varchar](150) NULL,
	[MAT_Unidad] [int] NULL,
	[MAT_Tipo] [int] NULL,
	[MAT_Cantidad] [decimal](18, 2) NULL,
	[MAT_Costo] [decimal](18, 2) NULL,
	[MAT_UltimoCosto] [decimal](18, 2) NULL,
	[MAT_CostoPromedio] [decimal](18, 2) NULL,
	[MAT_Minimo] [decimal](18, 2) NULL,
	[MAT_Maximo] [decimal](18, 2) NULL,
	[MAT_Stock] [decimal](18, 2) NULL,
	[MAT_UltimoProvedor] [int] NULL,
	[MAT_Usuario] [int] NULL,
	[MAT_Fecha] [datetime] NULL,
	[MAT_Ubicacion] [varchar](50) NULL,
	[MAT_Total] [decimal](18, 2) NULL,
	[MAT_ProvNumero] [varchar](50) NULL,
	[MAT_Kilos] [bit] NULL CONSTRAINT [DF_tblMateriales_MAT_Kilos]  DEFAULT (0),
	[MAT_Densidad] [decimal](18, 2) NULL,
 CONSTRAINT [pk_MaterialesId] PRIMARY KEY CLUSTERED 
(
	[MAT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uc_MaterialDescripcion] UNIQUE NONCLUSTERED 
(
	[MAT_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  TRIGGER [dbo].[TI_tblMateriales] ON [dbo].[tblMateriales]
FOR INSERT
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE 
	@ENT_ID			INT,
	@MAT_CANTIDAD		DECIMAL(18,2),
	@MAT_ID			INT

    SELECT @ENT_ID = ENT_ID FROM tblEntradas WHERE ENT_Pedimento = 'N/A'

    IF (@ENT_ID IS NULL) BEGIN
	INSERT INTO 
	tblEntradas(ENT_Pedimento, ENT_ClavePedimento, ENT_Fecha, ENT_PaisOrigen,
	ENT_Nacional, ENT_TipoImp, ENT_Factura, ENT_OrdenCompra, PROV_ID, ENT_IVA,
	USE_ID, ENT_Dolares, ENT_TipoCambio, ENT_Desp)
	SELECT 'N/A','N/A',GETDATE(),2,'Nacional','','N/A','N/A',3,0,14,0,1.00,NULL 
    END

    SELECT @ENT_ID = ENT_ID FROM tblEntradas WHERE ENT_Pedimento = 'N/A'
    --select * from tblMateriales
    SELECT @MAT_CANTIDAD = MAT_CANTIDAD, @MAT_ID = MAT_ID FROM INSERTED 

    INSERT INTO tblEntradasDetalle(ENT_ID, MAT_ID, ED_Cantidad, ED_Costo, ED_Restante, SL_Desp)
    SELECT @ENT_ID, @MAT_ID, @MAT_CANTIDAD, 0.0, @MAT_CANTIDAD,NULL 
END


GO
