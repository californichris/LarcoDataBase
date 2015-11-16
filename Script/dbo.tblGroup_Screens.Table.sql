USE [Larco]
GO
/****** Object:  Table [dbo].[tblGroup_Screens]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblGroup_Screens]') AND type in (N'U'))
DROP TABLE [dbo].[tblGroup_Screens]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblGroup_Screens]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblGroup_Screens](
	[Group_Id] [int] NULL,
	[SCR_ID] [int] NULL,
	[Nuevo] [bit] NULL,
	[Editar] [bit] NULL,
	[Borrar] [bit] NULL,
	[Buscar] [bit] NULL
) ON [PRIMARY]
END
GO
