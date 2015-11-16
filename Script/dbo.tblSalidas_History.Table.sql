USE [Larco]
GO
/****** Object:  Table [dbo].[tblSalidas_History]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidas_History]') AND type in (N'U'))
DROP TABLE [dbo].[tblSalidas_History]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidas_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblSalidas_History](
	[SAL_ID] [int] NULL,
	[SAL_Fecha] [datetime] NULL,
	[SAL_Orden] [varchar](50) NULL,
	[SAL_Solicitado] [int] NULL,
	[USE_ID] [int] NULL,
	[SALTH_Type] [varchar](50) NULL,
	[SALH_Fecha] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
