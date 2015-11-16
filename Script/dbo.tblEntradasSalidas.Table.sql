USE [Larco]
GO
/****** Object:  Table [dbo].[tblEntradasSalidas]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasSalidas]') AND type in (N'U'))
DROP TABLE [dbo].[tblEntradasSalidas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasSalidas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblEntradasSalidas](
	[ES_ID] [int] IDENTITY(1,1) NOT NULL,
	[ED_ID] [int] NULL,
	[ED_Cantidad] [decimal](18, 2) NULL,
	[SD_ID] [int] NULL,
	[ES_Costo] [decimal](18, 2) NULL
) ON [PRIMARY]
END
GO
