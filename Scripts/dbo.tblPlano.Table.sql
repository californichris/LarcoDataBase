USE [Larco]
GO
/****** Object:  Table [dbo].[tblPlano]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
