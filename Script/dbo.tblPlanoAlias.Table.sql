USE [Larco]
GO
/****** Object:  Table [dbo].[tblPlanoAlias]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPlanoAlias]') AND type in (N'U'))
DROP TABLE [dbo].[tblPlanoAlias]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPlanoAlias]') AND type in (N'U'))
BEGIN
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
