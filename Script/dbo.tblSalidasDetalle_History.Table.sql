USE [Larco]
GO
/****** Object:  Table [dbo].[tblSalidasDetalle_History]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidasDetalle_History]') AND type in (N'U'))
DROP TABLE [dbo].[tblSalidasDetalle_History]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidasDetalle_History]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
