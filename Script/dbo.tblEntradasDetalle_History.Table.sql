USE [Larco]
GO
/****** Object:  Table [dbo].[tblEntradasDetalle_History]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasDetalle_History]') AND type in (N'U'))
DROP TABLE [dbo].[tblEntradasDetalle_History]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasDetalle_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblEntradasDetalle_History](
	[ED_ID] [int] NULL,
	[ENT_ID] [int] NULL,
	[MAT_ID] [int] NULL,
	[ED_Cantidad] [decimal](18, 2) NULL,
	[ED_Costo] [decimal](18, 2) NULL,
	[ED_Restante] [decimal](18, 2) NULL,
	[SL_Desp] [int] NULL
) ON [PRIMARY]
END
GO
