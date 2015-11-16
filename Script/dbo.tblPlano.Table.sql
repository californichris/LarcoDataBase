USE [Larco]
GO
/****** Object:  Table [dbo].[tblPlano]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPlano]') AND type in (N'U'))
DROP TABLE [dbo].[tblPlano]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPlano]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblPlano](
	[PN_Id] [int] IDENTITY(1,1) NOT NULL,
	[PN_Numero] [varchar](50) NOT NULL,
	[PN_Descripcion] [varchar](100) NULL,
	[PN_Imagen] [varchar](100) NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL,
 CONSTRAINT [PK_tblPlano] PRIMARY KEY CLUSTERED 
(
	[PN_Numero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
