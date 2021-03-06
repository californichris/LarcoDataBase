USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEntradasDetalle_History](
	[ED_ID] [int] NULL,
	[ENT_ID] [int] NULL,
	[MAT_ID] [int] NULL,
	[ED_Cantidad] [decimal](18, 2) NULL,
	[ED_Costo] [decimal](18, 2) NULL,
	[ED_Restante] [decimal](18, 2) NULL,
	[SL_Desp] [int] NULL
) ON [PRIMARY]

GO
