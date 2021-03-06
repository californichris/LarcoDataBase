USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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

GO
SET ANSI_PADDING OFF
GO
