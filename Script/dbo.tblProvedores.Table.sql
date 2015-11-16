USE [Larco]
GO
/****** Object:  Table [dbo].[tblProvedores]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProvedores]') AND type in (N'U'))
DROP TABLE [dbo].[tblProvedores]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProvedores]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblProvedores](
	[PROV_ID] [int] IDENTITY(1,1) NOT NULL,
	[PROV_Nombre] [varchar](150) NULL,
	[PROV_Contacto] [varchar](150) NULL,
	[PROV_RFC] [varchar](50) NULL,
	[PROV_Calle] [varchar](150) NULL,
	[PROV_Numero] [varchar](50) NULL,
	[PROV_Colonia] [varchar](75) NULL,
	[PROV_CP] [varchar](10) NULL,
	[PROV_Ciudad] [varchar](50) NULL,
	[PROV_Estado] [varchar](50) NULL,
	[PROV_Telefono] [varchar](50) NULL,
	[PROV_Celular] [varchar](50) NULL,
	[PROV_Fax] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
