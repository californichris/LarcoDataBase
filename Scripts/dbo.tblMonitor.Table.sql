USE [Larco]
GO
/****** Object:  Table [dbo].[tblMonitor]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMonitor](
	[MType] [varchar](50) NULL,
	[MName] [varchar](50) NULL,
	[MValue] [varchar](4096) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
