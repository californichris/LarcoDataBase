USE [Larco]
GO
/****** Object:  Table [dbo].[tblTareas]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblTareas_IsPutOnly]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblTareas] DROP CONSTRAINT [DF_tblTareas_IsPutOnly]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblTareas_IsConjuncion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblTareas] DROP CONSTRAINT [DF_tblTareas_IsConjuncion]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblTareas_IsLast]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblTareas] DROP CONSTRAINT [DF_tblTareas_IsLast]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTareas]') AND type in (N'U'))
DROP TABLE [dbo].[tblTareas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTareas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblTareas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TAS_Order] [smallint] NULL,
	[Grupo] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Tiempo] [decimal](18, 2) NULL,
	[Interno] [decimal](18, 2) NULL,
	[IsPutOnly] [bit] NULL CONSTRAINT [DF_tblTareas_IsPutOnly]  DEFAULT (0),
	[IsConjuncion] [bit] NULL CONSTRAINT [DF_tblTareas_IsConjuncion]  DEFAULT (0),
	[IsLast] [bit] NULL CONSTRAINT [DF_tblTareas_IsLast]  DEFAULT (0),
	[ConjuncionGrupo] [varchar](50) NULL,
 CONSTRAINT [PK_Tareas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblTareas]') AND name = N'INX_Nombre')
CREATE NONCLUSTERED INDEX [INX_Nombre] ON [dbo].[tblTareas] 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
