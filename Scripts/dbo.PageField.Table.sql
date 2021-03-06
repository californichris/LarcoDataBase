USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PageField](
	[FieldId] [int] IDENTITY(1,1) NOT NULL,
	[TabId] [int] NULL,
	[FieldName] [varchar](100) NOT NULL,
	[Label] [varchar](100) NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[Required] [bit] NOT NULL,
	[DropDownInfo] [varchar](1000) NULL,
	[Exportable] [bit] NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[FieldOrder] [int] NOT NULL,
	[ControlType] [varchar](50) NULL,
	[IsId] [bit] NULL CONSTRAINT [DF_PageField_IsId]  DEFAULT ((0)),
	[JoinInfo] [varchar](1000) NULL,
	[DBFieldName] [varchar](100) NULL,
	[Insertable] [bit] NULL CONSTRAINT [DF_PageField_Insertable]  DEFAULT ((1)),
	[Updatable] [bit] NULL CONSTRAINT [DF_PageField_Updatable]  DEFAULT ((1)),
	[ControlProps] [varchar](1000) NULL,
 CONSTRAINT [pk_PageFieldId] PRIMARY KEY CLUSTERED 
(
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uc_TabFieldName] UNIQUE NONCLUSTERED 
(
	[TabId] ASC,
	[FieldName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PageField]  WITH CHECK ADD  CONSTRAINT [FK_PageField_TabId] FOREIGN KEY([TabId])
REFERENCES [dbo].[PageTab] ([TabId])
GO
ALTER TABLE [dbo].[PageField] CHECK CONSTRAINT [FK_PageField_TabId]
GO
