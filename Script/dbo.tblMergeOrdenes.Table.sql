USE [Larco]
GO
/****** Object:  Table [dbo].[tblMergeOrdenes]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMergeOrdenes]') AND type in (N'U'))
DROP TABLE [dbo].[tblMergeOrdenes]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMergeOrdenes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblMergeOrdenes](
	[MO_ID] [int] IDENTITY(1,1) NOT NULL,
	[ITE_Nombre] [varchar](50) NOT NULL,
	[MO_ITE_Nombre] [varchar](50) NOT NULL,
	[MO_Cantidad] [int] NOT NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
