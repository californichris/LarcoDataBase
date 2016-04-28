USE [Larco]
GO
/****** Object:  Table [dbo].[tblTareas]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTareas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TAS_Order] [smallint] NULL,
	[Grupo] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Tiempo] [decimal](18, 2) NULL,
	[Interno] [decimal](18, 2) NULL,
	[IsPutOnly] [bit] NULL,
	[IsConjuncion] [bit] NULL,
	[IsLast] [bit] NULL,
	[ConjuncionGrupo] [varchar](50) NULL,
 CONSTRAINT [PK_Tareas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [INX_Nombre] ON [dbo].[tblTareas] 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTareas] ADD  CONSTRAINT [DF_tblTareas_IsPutOnly]  DEFAULT (0) FOR [IsPutOnly]
GO
ALTER TABLE [dbo].[tblTareas] ADD  CONSTRAINT [DF_tblTareas_IsConjuncion]  DEFAULT (0) FOR [IsConjuncion]
GO
ALTER TABLE [dbo].[tblTareas] ADD  CONSTRAINT [DF_tblTareas_IsLast]  DEFAULT (0) FOR [IsLast]
GO
