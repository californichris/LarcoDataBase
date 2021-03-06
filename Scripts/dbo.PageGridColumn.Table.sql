USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PageGridColumn](
	[FieldId] [int] NOT NULL,
	[PageId] [int] NOT NULL,
	[Visible] [bit] NOT NULL CONSTRAINT [DF_PageGridColumn_Visible]  DEFAULT ((1)),
	[Searchable] [bit] NOT NULL CONSTRAINT [DF_PageGridColumn_Searchable]  DEFAULT ((1)),
	[Width] [int] NOT NULL CONSTRAINT [DF_PageGridColumn_Width]  DEFAULT ((0)),
	[ColumnLabel] [varchar](100) NULL,
	[ColumnOrder] [int] NOT NULL CONSTRAINT [DF_PageGridColumn_ColumnOrder]  DEFAULT ((1)),
	[UpdatedBy] [varchar](50) NOT NULL,
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_PageGridColumn_UpdatedDate]  DEFAULT (getdate()),
	[ColumnId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnName] [varchar](100) NULL,
 CONSTRAINT [pk_PageGridColumnId] PRIMARY KEY CLUSTERED 
(
	[ColumnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_PageId_FieldId] UNIQUE NONCLUSTERED 
(
	[PageId] ASC,
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PageGridColumn]  WITH CHECK ADD  CONSTRAINT [fk_ColsField] FOREIGN KEY([FieldId])
REFERENCES [dbo].[PageField] ([FieldId])
GO
ALTER TABLE [dbo].[PageGridColumn] CHECK CONSTRAINT [fk_ColsField]
GO
ALTER TABLE [dbo].[PageGridColumn]  WITH CHECK ADD  CONSTRAINT [fk_ColsPage] FOREIGN KEY([PageId])
REFERENCES [dbo].[Page] ([PageId])
GO
ALTER TABLE [dbo].[PageGridColumn] CHECK CONSTRAINT [fk_ColsPage]
GO
