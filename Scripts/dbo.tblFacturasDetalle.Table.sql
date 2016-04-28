USE [Larco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFacturasDetalle](
	[FC_ID] [int] IDENTITY(1,1) NOT NULL,
	[FAC_ID] [int] NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[FD_Cantidad] [int] NULL,
	[FD_Desc] [varchar](150) NULL,
	[FD_Numero] [varchar](50) NULL,
	[FD_Stock] [int] NULL,
	[FD_Dolares] [char](1) NULL,
	[FD_Unitario] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
