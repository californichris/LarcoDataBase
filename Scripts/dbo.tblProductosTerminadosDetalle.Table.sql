USE [Larco]
GO
/****** Object:  Table [dbo].[tblProductosTerminadosDetalle]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductosTerminadosDetalle](
	[PTD_ID] [int] IDENTITY(1,1) NOT NULL,
	[PT_ID] [int] NULL,
	[MAT_ID] [int] NULL,
	[PTD_Cantidad] [int] NULL
) ON [PRIMARY]
GO
