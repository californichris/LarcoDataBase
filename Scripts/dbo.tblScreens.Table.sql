USE [Larco]
GO
/****** Object:  Table [dbo].[tblScreens]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblScreens](
	[SCR_ID] [int] IDENTITY(1,1) NOT NULL,
	[SCR_Name] [varchar](50) NULL,
	[SCR_FormName] [varchar](50) NULL,
	[SCR_Description] [varchar](150) NULL,
	[SCR_Year] [varchar](4) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
