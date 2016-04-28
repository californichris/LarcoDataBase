USE [Larco]
GO
/****** Object:  Table [dbo].[tblDescriptions]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDescriptions](
	[DES_GROUP] [varchar](50) NOT NULL,
	[DES_CODE] [int] NOT NULL,
	[DEC_NOTE] [varchar](128) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
