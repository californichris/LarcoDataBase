USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAggregateValue](
	[Product_ID] [int] NULL,
	[Task_ID] [int] NULL,
	[Value] [decimal](18, 2) NULL,
	[BeforeDays] [int] NULL CONSTRAINT [DF__tblAggreg__Befor__320C68B7]  DEFAULT ((0)),
	[ProdTaskId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AggregateValue] PRIMARY KEY CLUSTERED 
(
	[ProdTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
