USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMergeOrdenes](
	[MO_ID] [int] IDENTITY(1,1) NOT NULL,
	[ITE_Nombre] [varchar](50) NOT NULL,
	[MO_ITE_Nombre] [varchar](50) NOT NULL,
	[MO_Cantidad] [int] NOT NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
