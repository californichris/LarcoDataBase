USE [Larco]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banners](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](500) NULL,
	[IP] [varchar](15) NOT NULL,
	[SessionId] [varchar](100) NOT NULL,
	[DisplayTime] [int] NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Banners__32E86AD14242D080] PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
