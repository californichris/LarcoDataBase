USE [Larco]
GO
/****** Object:  Table [dbo].[tblContribuyente]    Script Date: 11/16/2015 14:43:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblContribuyente]') AND type in (N'U'))
DROP TABLE [dbo].[tblContribuyente]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblContribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblContribuyente](
	[CON_ID] [int] IDENTITY(1,1) NOT NULL,
	[CON_RazonSocial] [varchar](250) NULL,
	[CON_RFC] [char](13) NULL,
	[CON_Registro] [varchar](50) NULL,
	[CON_Calle] [varchar](150) NULL,
	[CON_Numero] [varchar](50) NULL,
	[CON_CP] [varchar](10) NULL,
	[CON_Colonia] [varchar](100) NULL,
	[CON_Entidad] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
