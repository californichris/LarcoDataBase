USE [Larco]
GO
/****** Object:  Table [dbo].[tblSalidas]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSalidas](
	[SAL_ID] [int] IDENTITY(1,1) NOT NULL,
	[SAL_Fecha] [datetime] NULL,
	[SAL_Orden] [varchar](50) NULL,
	[SAL_Solicitado] [int] NULL,
	[USE_ID] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
