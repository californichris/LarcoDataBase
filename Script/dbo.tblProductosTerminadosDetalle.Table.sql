USE [Larco]
GO
/****** Object:  Table [dbo].[tblProductosTerminadosDetalle]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductosTerminadosDetalle]') AND type in (N'U'))
DROP TABLE [dbo].[tblProductosTerminadosDetalle]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductosTerminadosDetalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblProductosTerminadosDetalle](
	[PTD_ID] [int] IDENTITY(1,1) NOT NULL,
	[PT_ID] [int] NULL,
	[MAT_ID] [int] NULL,
	[PTD_Cantidad] [int] NULL
) ON [PRIMARY]
END
GO
