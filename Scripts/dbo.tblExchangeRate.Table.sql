USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExchangeRate](
	[Rate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Rate_Date] [datetime] NULL,
	[Rate_Amount] [decimal](18, 5) NULL
) ON [PRIMARY]

GO
