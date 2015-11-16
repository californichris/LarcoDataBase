USE [Larco]
GO
/****** Object:  Table [dbo].[tblEntradas]    Script Date: 11/16/2015 14:43:39 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblEntradas_Dolares]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblEntradas] DROP CONSTRAINT [DF_tblEntradas_Dolares]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradas]') AND type in (N'U'))
DROP TABLE [dbo].[tblEntradas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblEntradas](
	[ENT_ID] [int] IDENTITY(1,1) NOT NULL,
	[ENT_Pedimento] [varchar](50) NULL,
	[ENT_ClavePedimento] [varchar](50) NULL,
	[ENT_Fecha] [datetime] NULL,
	[ENT_PaisOrigen] [int] NULL,
	[ENT_Nacional] [varchar](50) NULL,
	[ENT_TipoImp] [varchar](50) NULL,
	[ENT_Factura] [varchar](50) NULL,
	[ENT_OrdenCompra] [varchar](50) NULL,
	[PROV_ID] [int] NULL,
	[ENT_IVA] [int] NULL,
	[USE_ID] [int] NULL,
	[ENT_Dolares] [bit] NULL CONSTRAINT [DF_tblEntradas_Dolares]  DEFAULT (0),
	[ENT_TipoCambio] [decimal](18, 2) NULL,
	[ENT_Desp] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
