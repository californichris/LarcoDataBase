USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScreens](
	[SCR_ID] [int] IDENTITY(1,1) NOT NULL,
	[SCR_Name] [varchar](50) NOT NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[tblScreens] ADD [SCR_FormName] [varchar](50) NULL
ALTER TABLE [dbo].[tblScreens] ADD [SCR_Description] [varchar](150) NULL
ALTER TABLE [dbo].[tblScreens] ADD [SCR_Year] [varchar](4) NULL
ALTER TABLE [dbo].[tblScreens] ADD [URL] [nvarchar](100) NULL
ALTER TABLE [dbo].[tblScreens] ADD [ModuleOrder] [int] NULL
ALTER TABLE [dbo].[tblScreens] ADD [ParentModule] [int] NULL
 CONSTRAINT [pk_ScreenId] PRIMARY KEY CLUSTERED 
(
	[SCR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
