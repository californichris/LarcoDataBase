USE [Larco]
GO
/****** Object:  Table [dbo].[tblProvedores]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
