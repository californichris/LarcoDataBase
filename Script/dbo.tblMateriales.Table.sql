USE [Larco]
GO
/****** Object:  Table [dbo].[tblMateriales]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblMateriales_MAT_Kilos]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblMateriales] DROP CONSTRAINT [DF_tblMateriales_MAT_Kilos]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMateriales]') AND type in (N'U'))
DROP TABLE [dbo].[tblMateriales]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMateriales]') AND type in (N'U'))
BEGIN
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
	[MAT_Densidad] [decimal](18, 2) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
