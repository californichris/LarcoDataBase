USE [Larco]
GO
/****** Object:  Table [dbo].[tblStock]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblStock]') AND type in (N'U'))
DROP TABLE [dbo].[tblStock]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblStock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblStock](
	[ST_ID] [int] IDENTITY(1,1) NOT NULL,
	[PN_Id] [int] NOT NULL,
	[ITE_Nombre] [varchar](50) NOT NULL,
	[ST_Cantidad] [int] NOT NULL,
	[ST_Fecha] [datetime] NOT NULL,
	[ST_Tipo] [varchar](50) NOT NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
