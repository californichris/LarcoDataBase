USE [Larco]
GO
/****** Object:  Table [dbo].[tblTiposMaterial]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTiposMaterial]') AND type in (N'U'))
DROP TABLE [dbo].[tblTiposMaterial]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTiposMaterial]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblTiposMaterial](
	[TIP_ID] [int] IDENTITY(1,1) NOT NULL,
	[TIP_Tipo] [varchar](50) NULL,
	[TIP_Descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
