USE [Larco]
GO
/****** Object:  Table [dbo].[tblDescriptions]    Script Date: 11/16/2015 14:43:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblDescriptions]') AND type in (N'U'))
DROP TABLE [dbo].[tblDescriptions]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblDescriptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblDescriptions](
	[DES_GROUP] [varchar](50) NOT NULL,
	[DES_CODE] [int] NOT NULL,
	[DEC_NOTE] [varchar](128) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
