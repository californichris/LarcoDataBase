USE [Larco]
GO
/****** Object:  Table [dbo].[tblSalidasLarco]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidasLarco]') AND type in (N'U'))
DROP TABLE [dbo].[tblSalidasLarco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidasLarco]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblSalidasLarco](
	[SL_ID] [int] IDENTITY(1,1) NOT NULL,
	[SL_Orden] [varchar](50) NULL,
	[SL_Fecha] [datetime] NULL,
	[USE_ID] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
