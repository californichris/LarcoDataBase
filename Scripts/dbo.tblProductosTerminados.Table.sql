USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProductosTerminados](
	[PT_ID] [int] IDENTITY(1,1) NOT NULL,
	[PT_Fraccion] [varchar](50) NULL,
	[PT_Descripcion] [varchar](150) NULL,
	[PT_Unidad] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
