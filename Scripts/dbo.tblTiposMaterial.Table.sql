USE [Larco]
GO
/****** Object:  Table [dbo].[tblTiposMaterial]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTiposMaterial](
	[TIP_ID] [int] IDENTITY(1,1) NOT NULL,
	[TIP_Tipo] [varchar](50) NULL,
	[TIP_Descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
