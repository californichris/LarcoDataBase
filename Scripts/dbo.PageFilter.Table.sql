USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PageFilter](
	[FilterId] [int] IDENTITY(1,1) NOT NULL,
	[PageId] [int] NOT NULL,
	[FilterCols] [int] NOT NULL CONSTRAINT [DF_PageFilter_Cols]  DEFAULT ((1)),
	[FilterText] [varchar](100) NULL,
	[ShowClear] [bit] NOT NULL CONSTRAINT [DF_PageFilter_ShowClear]  DEFAULT ((1)),
	[FilterProps] [varchar](1000) NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [pk_PageFilterId] PRIMARY KEY CLUSTERED 
(
	[FilterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PageFilter]  WITH CHECK ADD  CONSTRAINT [FK_PageFilter_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Page] ([PageId])
GO
ALTER TABLE [dbo].[PageFilter] CHECK CONSTRAINT [FK_PageFilter_PageId]
GO
