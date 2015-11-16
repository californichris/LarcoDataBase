USE [Larco]
GO
/****** Object:  Table [dbo].[tblExchangeRate]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblExchangeRate]') AND type in (N'U'))
DROP TABLE [dbo].[tblExchangeRate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblExchangeRate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblExchangeRate](
	[Rate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Rate_Date] [datetime] NULL,
	[Rate_Amount] [decimal](18, 5) NULL
) ON [PRIMARY]
END
GO
