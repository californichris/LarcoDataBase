USE [Larco]
GO
/****** Object:  Table [dbo].[tblNonWorkingDay]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblNonWorkingDay]') AND type in (N'U'))
DROP TABLE [dbo].[tblNonWorkingDay]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblNonWorkingDay]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblNonWorkingDay](
	[NonWorkingDay] [datetime] NULL
) ON [PRIMARY]
END
GO
