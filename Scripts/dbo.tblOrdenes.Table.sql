USE [Larco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
	[Aprobacion] [bit] NULL,
	[Observaciones] [varchar](1000) NULL,
	[Otras] [varchar](500) NULL,
	[Unitario] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[Dolares] [bit] NULL,
	[FAC_Id] [int] NULL,
	[PN_Id] [int] NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL,
	[StockParcial] [bit] NULL,
	[StockParcialCantidad] [int] NULL,
	[ST_ID] [int] NULL,
	[Requisicion] [varchar](50) NULL,
	[Urgente] [bit] NULL,
	[Alerta] [bit] NULL,
	[AlertaMsg] [nvarchar](50) NULL,
	[Instrucciones] [nvarchar](1000) NULL,
 CONSTRAINT [uc_ITENombre] UNIQUE NONCLUSTERED 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [INX_ITE_Nombre] ON [dbo].[tblOrdenes] 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrdenes] ADD  CONSTRAINT [DF_tblOrdenes_Aprobacion]  DEFAULT (0) FOR [Aprobacion]
GO
ALTER TABLE [dbo].[tblOrdenes] ADD  CONSTRAINT [DF_tblOrdenes_Dolares]  DEFAULT (0) FOR [Dolares]
GO
ALTER TABLE [dbo].[tblOrdenes] ADD  CONSTRAINT [DF__tblOrdene__Urgen__30242045]  DEFAULT ((0)) FOR [Urgente]
GO
