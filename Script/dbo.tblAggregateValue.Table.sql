USE [Larco]
GO
/****** Object:  Table [dbo].[tblAggregateValue]    Script Date: 11/16/2015 14:43:39 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tblAggreg__Befor__320C68B7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblAggregateValue] DROP CONSTRAINT [DF__tblAggreg__Befor__320C68B7]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAggregateValue]') AND type in (N'U'))
DROP TABLE [dbo].[tblAggregateValue]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAggregateValue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblAggregateValue](
	[Product_ID] [int] NULL,
	[Task_ID] [int] NULL,
	[Value] [decimal](18, 2) NULL,
	[BeforeDays] [int] NULL DEFAULT ((0)),
	[ProdTaskId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AggregateValue] PRIMARY KEY CLUSTERED 
(
	[ProdTaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
