USE [Larco]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUsers]') AND type in (N'U'))
DROP TABLE [dbo].[tblUsers]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblUsers](
	[USE_ID] [int] IDENTITY(1,1) NOT NULL,
	[USE_Login] [varchar](50) NULL,
	[USE_Password] [varchar](50) NULL,
	[USE_Name] [varchar](150) NULL,
	[USE_Role] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
