USE [Larco]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 11/16/2015 14:43:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCategories]') AND type in (N'U'))
DROP TABLE [dbo].[tblCategories]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCategories](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](50) NULL,
	[Category_Order] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
