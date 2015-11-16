USE [Larco]
GO
/****** Object:  Table [dbo].[tblEmpleados]    Script Date: 11/16/2015 14:43:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEmpleados]') AND type in (N'U'))
DROP TABLE [dbo].[tblEmpleados]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEmpleados]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
