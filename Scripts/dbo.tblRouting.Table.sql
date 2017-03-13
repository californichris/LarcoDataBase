USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRouting](
	[Rou_Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Rou_From] [int] NULL,
	[Rou_Code] [varchar](50) NULL,
	[Rou_To] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
