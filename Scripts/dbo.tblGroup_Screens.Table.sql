USE [Larco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGroup_Screens](
	[Group_Id] [int] NULL,
	[SCR_ID] [int] NULL,
	[Nuevo] [bit] NULL,
	[Editar] [bit] NULL,
	[Borrar] [bit] NULL,
	[Buscar] [bit] NULL
) ON [PRIMARY]
GO
