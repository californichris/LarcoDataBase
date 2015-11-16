USE [Larco]
GO
/****** Object:  Table [dbo].[tblItems]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblItems_ITE_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblItems] DROP CONSTRAINT [DF_tblItems_ITE_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND type in (N'U'))
DROP TABLE [dbo].[tblItems]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblItems](
	[ITE_ID] [int] IDENTITY(1,1) NOT NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[PRO_Nombre] [varchar](50) NULL,
	[CLI_Clave] [varchar](50) NULL,
	[ITE_Fecha] [datetime] NULL,
	[ITE_Priority] [decimal](18, 4) NULL,
	[ITE_Status] [bit] NULL CONSTRAINT [DF_tblItems_ITE_Status]  DEFAULT (0),
 CONSTRAINT [PK_ITE_ID] PRIMARY KEY CLUSTERED 
(
	[ITE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_Items_ITE_Nombre] UNIQUE NONCLUSTERED 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND name = N'INX_ITE_ID')
CREATE NONCLUSTERED INDEX [INX_ITE_ID] ON [dbo].[tblItems] 
(
	[ITE_ID] ASC
)
INCLUDE ( [ITE_Priority],
[ITE_Status]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND name = N'INX_ITE_Nombre')
CREATE NONCLUSTERED INDEX [INX_ITE_Nombre] ON [dbo].[tblItems] 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
