USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStockOrdenes](
	[ITE_ID] [int] IDENTITY(1,1) NOT NULL,
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
	[Aprobacion] [bit] NULL CONSTRAINT [DF_tblStockOrdenes_Aprobacion]  DEFAULT (0),
	[Observaciones] [varchar](1000) NULL,
	[Otras] [varchar](500) NULL,
	[Unitario] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[Dolares] [bit] NULL CONSTRAINT [DF_tblStockOrdenes_Dolares]  DEFAULT (0),
	[Stock] [bit] NULL CONSTRAINT [DF_tblStockOrdenes_Stock]  DEFAULT (0),
	[Programado] [bit] NULL CONSTRAINT [DF_tblStockOrdenes_Programado]  DEFAULT (0),
	[Cantidad] [int] NULL,
	[FileName] [varchar](50) NULL,
	[AddBy] [varchar](50) NULL,
	[AddDate] [datetime] NULL,
	[FAC_Id] [int] NULL,
	[PN_Id] [int] NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL,
	[ST_ID] [int] NULL,
	[Mezclado] [bit] NULL,
	[Requisicion] [varchar](50) NULL,
	[Urgente] [bit] NULL CONSTRAINT [DF__tblStockO__Urgen__3118447E]  DEFAULT ((0)),
	[Alerta] [bit] NULL,
	[AlertaMsg] [nvarchar](50) NULL,
	[Instrucciones] [nvarchar](1000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
