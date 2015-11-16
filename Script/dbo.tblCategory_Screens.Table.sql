USE [Larco]
GO
/****** Object:  Table [dbo].[tblCategory_Screens]    Script Date: 11/16/2015 14:43:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCategory_Screens]') AND type in (N'U'))
DROP TABLE [dbo].[tblCategory_Screens]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCategory_Screens]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCategory_Screens](
	[Category_ID] [int] NULL,
	[SCR_ID] [int] NULL,
	[SCR_Order] [int] NULL
) ON [PRIMARY]
END
GO
