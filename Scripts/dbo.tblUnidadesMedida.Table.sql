USE [Larco]
GO
/****** Object:  Table [dbo].[tblUnidadesMedida]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUnidadesMedida](
	[UNI_ID] [int] IDENTITY(1,1) NOT NULL,
	[UNI_Medida] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
