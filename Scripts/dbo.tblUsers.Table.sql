USE [Larco]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[USE_ID] [int] IDENTITY(1,1) NOT NULL,
	[USE_Login] [varchar](50) NULL,
	[USE_Password] [varchar](50) NULL,
	[USE_Name] [varchar](150) NULL,
	[USE_Role] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
