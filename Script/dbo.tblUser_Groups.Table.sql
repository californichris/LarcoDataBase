USE [Larco]
GO
/****** Object:  Table [dbo].[tblUser_Groups]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUser_Groups]') AND type in (N'U'))
DROP TABLE [dbo].[tblUser_Groups]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUser_Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblUser_Groups](
	[USE_ID] [int] NULL,
	[Group_ID] [int] NULL
) ON [PRIMARY]
END
GO
