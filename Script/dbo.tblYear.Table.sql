USE [Larco]
GO
/****** Object:  Table [dbo].[tblYear]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblYear]') AND type in (N'U'))
DROP TABLE [dbo].[tblYear]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblYear]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblYear](
	[Anio] [int] NULL
) ON [PRIMARY]
END
GO
