USE [Larco]
GO
/****** Object:  Table [dbo].[tblEmpleados]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmpleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NULL,
	[Departamento] [varchar](150) NULL,
	[Puesto] [varchar](150) NULL,
	[Turno] [char](1) NULL,
	[Percepciones] [decimal](18, 2) NULL,
	[CostoHora] [decimal](18, 2) NULL,
	[FechaNac] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
