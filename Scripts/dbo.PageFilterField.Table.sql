USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PageFilterField](
	[FilterFieldId] [int] IDENTITY(1,1) NOT NULL,
	[FilterId] [int] NOT NULL,
	[FieldId] [int] NOT NULL,
	[FilterOrder] [int] NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [pk_PageFilterFieldId] PRIMARY KEY CLUSTERED 
(
	[FilterFieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uc_FilterField] UNIQUE NONCLUSTERED 
(
	[FilterId] ASC,
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PageFilterField]  WITH CHECK ADD  CONSTRAINT [FK_PageFilterField_FieldId] FOREIGN KEY([FieldId])
REFERENCES [dbo].[PageField] ([FieldId])
GO
ALTER TABLE [dbo].[PageFilterField] CHECK CONSTRAINT [FK_PageFilterField_FieldId]
GO
ALTER TABLE [dbo].[PageFilterField]  WITH CHECK ADD  CONSTRAINT [FK_PageFilterField_FilterId] FOREIGN KEY([FilterId])
REFERENCES [dbo].[PageFilter] ([FilterId])
GO
ALTER TABLE [dbo].[PageFilterField] CHECK CONSTRAINT [FK_PageFilterField_FilterId]
GO
