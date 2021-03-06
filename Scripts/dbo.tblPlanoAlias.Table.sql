USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPlanoAlias](
	[PA_Id] [int] IDENTITY(1,1) NOT NULL,
	[PN_Id] [int] NOT NULL,
	[PA_Alias] [varchar](50) NOT NULL,
	[PA_Tipo] [varchar](50) NOT NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL,
 CONSTRAINT [PK_tblPlanoAlias] PRIMARY KEY CLUSTERED 
(
	[PA_Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
