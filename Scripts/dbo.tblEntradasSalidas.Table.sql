USE [Larco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEntradasSalidas](
	[ES_ID] [int] IDENTITY(1,1) NOT NULL,
	[ED_ID] [int] NULL,
	[ED_Cantidad] [decimal](18, 2) NULL,
	[SD_ID] [int] NULL,
	[ES_Costo] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
