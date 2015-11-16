USE [Larco]
GO
/****** Object:  Table [dbo].[tblProductosTerminados]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductosTerminados]') AND type in (N'U'))
DROP TABLE [dbo].[tblProductosTerminados]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductosTerminados]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblProductosTerminados](
	[PT_ID] [int] IDENTITY(1,1) NOT NULL,
	[PT_Fraccion] [varchar](50) NULL,
	[PT_Descripcion] [varchar](150) NULL,
	[PT_Unidad] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
