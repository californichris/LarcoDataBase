USE [Larco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
	[ENT_Dolares] [bit] NULL,
	[ENT_TipoCambio] [decimal](18, 2) NULL,
	[ENT_Desp] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblEntradas] ADD  CONSTRAINT [DF_tblEntradas_Dolares]  DEFAULT (0) FOR [ENT_Dolares]
GO
