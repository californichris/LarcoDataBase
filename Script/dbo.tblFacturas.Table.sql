USE [Larco]
GO
/****** Object:  Table [dbo].[tblFacturas]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblFacturas]') AND type in (N'U'))
DROP TABLE [dbo].[tblFacturas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblFacturas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblFacturas](
	[FAC_Id] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_Id] [int] NULL,
	[FAC_Folio] [int] NULL,
	[FAC_Fecha] [datetime] NULL,
	[FAC_Expedicion] [varchar](100) NULL,
	[FAC_Pedimento] [varchar](100) NULL,
	[FAC_Dolares] [bit] NULL,
	[FAC_TipoCambio] [decimal](18, 2) NULL,
	[FAC_IVA] [int] NULL,
	[FAC_Req] [varchar](100) NULL,
	[FAC_OrdenCompra] [varchar](25) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
