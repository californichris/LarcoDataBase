USE [Larco]
GO
/****** Object:  Table [dbo].[tblClientes]    Script Date: 11/16/2015 14:43:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblClientes]') AND type in (N'U'))
DROP TABLE [dbo].[tblClientes]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblClientes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblClientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](5) NULL,
	[Nombre] [varchar](150) NULL,
	[Contacto] [varchar](150) NULL,
	[RFC] [varchar](50) NULL,
	[Calle] [varchar](150) NULL,
	[Numero] [varchar](50) NULL,
	[Colonia] [varchar](75) NULL,
	[CP] [varchar](10) NULL,
	[Ciudad] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
	[Recordar] [varchar](5) NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
