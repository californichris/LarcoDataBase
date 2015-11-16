USE [Larco]
GO
/****** Object:  Table [dbo].[tblEntradasDetalle]    Script Date: 11/16/2015 14:43:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasDetalle]') AND type in (N'U'))
DROP TABLE [dbo].[tblEntradasDetalle]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasDetalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblEntradasDetalle](
	[ED_ID] [int] IDENTITY(1,1) NOT NULL,
	[ENT_ID] [int] NULL,
	[MAT_ID] [int] NULL,
	[ED_Cantidad] [decimal](18, 2) NULL,
	[ED_Costo] [decimal](18, 2) NULL,
	[ED_Restante] [decimal](18, 2) NULL,
	[SL_Desp] [int] NULL
) ON [PRIMARY]
END
GO
