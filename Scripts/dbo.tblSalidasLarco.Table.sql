USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSalidasLarco](
	[SL_ID] [int] IDENTITY(1,1) NOT NULL,
	[SL_Orden] [varchar](50) NULL,
	[SL_Fecha] [datetime] NULL,
	[USE_ID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
