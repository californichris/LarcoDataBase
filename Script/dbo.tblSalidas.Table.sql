USE [Larco]
GO
/****** Object:  Table [dbo].[tblSalidas]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidas]') AND type in (N'U'))
DROP TABLE [dbo].[tblSalidas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblSalidas](
	[SAL_ID] [int] IDENTITY(1,1) NOT NULL,
	[SAL_Fecha] [datetime] NULL,
	[SAL_Orden] [varchar](50) NULL,
	[SAL_Solicitado] [int] NULL,
	[USE_ID] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
