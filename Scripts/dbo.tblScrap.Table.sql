USE [Larco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScrap](
	[SCR_ID] [int] IDENTITY(1,1) NOT NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[SCR_Motivo] [varchar](50) NULL,
	[SCR_Tarea] [varchar](50) NULL,
	[SCR_EmpleadoRes] [varchar](50) NULL,
	[SCR_Cantidad] [int] NULL,
	[SCR_Parcial] [bit] NULL,
	[SCR_Repro] [int] NULL,
	[USE_Login] [varchar](50) NULL,
	[SCR_Fecha] [datetime] NULL,
	[SCR_NewItem] [varchar](50) NULL,
	[SCR_Impreso] [bit] NULL,
	[SCR_Activo] [bit] NULL,
	[SCR_Detectado] [varchar](50) NULL,
	[SCR_EmpleadoDetectado] [int] NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL,
 CONSTRAINT [PK_SCR_ID] PRIMARY KEY CLUSTERED 
(
	[SCR_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_Scrap_ITE_Nombre] UNIQUE NONCLUSTERED 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [INX_ITE_Nombre] ON [dbo].[tblScrap] 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
