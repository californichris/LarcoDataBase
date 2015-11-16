USE [Larco]
GO
/****** Object:  Table [dbo].[tblMonitor]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMonitor]') AND type in (N'U'))
DROP TABLE [dbo].[tblMonitor]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMonitor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblMonitor](
	[MType] [varchar](50) NULL,
	[MName] [varchar](50) NULL,
	[MValue] [varchar](4096) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
