USE [Larco]
GO
/****** Object:  Table [dbo].[tblOrdenes]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblOrdenes_Aprobacion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblOrdenes] DROP CONSTRAINT [DF_tblOrdenes_Aprobacion]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblOrdenes_Dolares]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblOrdenes] DROP CONSTRAINT [DF_tblOrdenes_Dolares]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tblOrdene__Urgen__30242045]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblOrdenes] DROP CONSTRAINT [DF__tblOrdene__Urgen__30242045]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblOrdenes]') AND type in (N'U'))
DROP TABLE [dbo].[tblOrdenes]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblOrdenes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblOrdenes](
	[ITE_ID] [int] NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[TipoProceso] [varchar](50) NULL,
	[Requerida] [int] NULL,
	[Ordenada] [int] NULL,
	[Producto] [varchar](50) NULL,
	[Numero] [varchar](50) NULL,
	[Terminal] [varchar](50) NULL,
	[OrdenCompra] [varchar](50) NULL,
	[Recibido] [datetime] NULL,
	[Entrega] [datetime] NULL,
	[Interna] [datetime] NULL,
	[Nombre] [varchar](150) NULL,
	[Aprobacion] [bit] NULL CONSTRAINT [DF_tblOrdenes_Aprobacion]  DEFAULT (0),
	[Observaciones] [varchar](1000) NULL,
	[Otras] [varchar](500) NULL,
	[Unitario] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[Dolares] [bit] NULL CONSTRAINT [DF_tblOrdenes_Dolares]  DEFAULT (0),
	[FAC_Id] [int] NULL,
	[PN_Id] [int] NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL,
	[StockParcial] [bit] NULL,
	[StockParcialCantidad] [int] NULL,
	[ST_ID] [int] NULL,
	[Requisicion] [varchar](50) NULL,
	[Urgente] [bit] NULL DEFAULT ((0)),
 CONSTRAINT [uc_ITENombre] UNIQUE NONCLUSTERED 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblOrdenes]') AND name = N'INX_ITE_Nombre')
CREATE NONCLUSTERED INDEX [INX_ITE_Nombre] ON [dbo].[tblOrdenes] 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
