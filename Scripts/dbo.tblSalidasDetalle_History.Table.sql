USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSalidasDetalle_History](
	[SD_ID] [int] NOT NULL,
	[SAL_ID] [int] NULL,
	[MAT_ID] [int] NULL,
	[SD_Cantidad] [decimal](18, 2) NULL,
	[SL_Cantidad] [int] NULL,
	[SL_Pedimento] [varchar](50) NULL,
	[ED_ID] [int] NULL,
	[IS_SL] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
