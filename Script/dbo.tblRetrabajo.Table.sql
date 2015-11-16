USE [Larco]
GO
/****** Object:  Table [dbo].[tblRetrabajo]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblRetrabajo]') AND type in (N'U'))
DROP TABLE [dbo].[tblRetrabajo]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblRetrabajo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblRetrabajo](
	[RET_ID] [int] IDENTITY(1,1) NOT NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[RET_Motivo] [varchar](50) NULL,
	[RET_Area] [varchar](50) NULL,
	[RET_Empleado] [varchar](50) NULL,
	[RET_Start] [datetime] NULL,
	[RET_Stop] [datetime] NULL,
	[RET_Detectado] [varchar](50) NULL,
	[RET_EmpleadoDetectado] [int] NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
