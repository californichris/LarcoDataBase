USE [Larco]
GO
/****** Object:  Table [dbo].[tblScreens]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblScreens]') AND type in (N'U'))
DROP TABLE [dbo].[tblScreens]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblScreens]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblScreens](
	[SCR_ID] [int] IDENTITY(1,1) NOT NULL,
	[SCR_Name] [varchar](50) NULL,
	[SCR_FormName] [varchar](50) NULL,
	[SCR_Description] [varchar](150) NULL,
	[SCR_Year] [varchar](4) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
