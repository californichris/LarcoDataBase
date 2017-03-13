USE Larco
GO

-----------------------------------------------------------------------------------------

CREATE TABLE [dbo].[Page](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[TableName] [varchar](100) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [pk_PageId] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [uc_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


----------------------------------------------------------------------------------------

CREATE TABLE [dbo].[PageTab](
	[TabId] [int] IDENTITY(1,1) NOT NULL,
	[PageId] [int] NULL,
	[TabName] [varchar](100) NOT NULL,
	[URL] [varchar](100) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[TabOrder] [int] NOT NULL,
	[Cols] [int] NOT NULL,
 CONSTRAINT [pk_PageTabId] PRIMARY KEY CLUSTERED 
(
	[TabId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [uc_PageTabName] UNIQUE NONCLUSTERED 
(
	[PageId] ASC,
	[TabName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PageTab]  WITH CHECK ADD  CONSTRAINT [FK_PageTab_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Page] ([PageId])
GO

ALTER TABLE [dbo].[PageTab] CHECK CONSTRAINT [FK_PageTab_PageId]
GO

ALTER TABLE [dbo].[PageTab] ADD  CONSTRAINT [DF_PageTabs_Cols]  DEFAULT ((1)) FOR [Cols]
GO




-----------------------------------------------------------------------------------------

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
	[IsId] [bit] NULL,
	[JoinInfo] [varchar](1000) NULL,
	[DBFieldName] [varchar](100) NULL,
	[Insertable] [bit] NULL,
	[Updatable] [bit] NULL,
	[ControlProps] [varchar](1000) NULL,
 CONSTRAINT [pk_PageFieldId] PRIMARY KEY CLUSTERED 
(
	[FieldId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [uc_TabFieldName] UNIQUE NONCLUSTERED 
(
	[TabId] ASC,
	[FieldName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[PageField]  WITH CHECK ADD  CONSTRAINT [FK_PageField_TabId] FOREIGN KEY([TabId])
REFERENCES [dbo].[PageTab] ([TabId])
GO

ALTER TABLE [dbo].[PageField] CHECK CONSTRAINT [FK_PageField_TabId]
GO

ALTER TABLE [dbo].[PageField] ADD  CONSTRAINT [DF_PageField_IsId]  DEFAULT ((0)) FOR [IsId]
GO

ALTER TABLE [dbo].[PageField] ADD  CONSTRAINT [DF_PageField_Insertable]  DEFAULT ((1)) FOR [Insertable]
GO

ALTER TABLE [dbo].[PageField] ADD  CONSTRAINT [DF_PageField_Updatable]  DEFAULT ((1)) FOR [Updatable]
GO




-----------------------------------------------------------------------------------------

CREATE TABLE [dbo].[PageGridColumn](
	[FieldId] [int] NOT NULL,
	[PageId] [int] NOT NULL,
	[Visible] [bit] NOT NULL,
	[Searchable] [bit] NOT NULL,
	[Width] [int] NOT NULL,
	[ColumnLabel] [varchar](100) NULL,
	[ColumnOrder] [int] NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[ColumnId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnName] [varchar](100) NULL,
 CONSTRAINT [pk_PageGridColumnId] PRIMARY KEY CLUSTERED 
(
	[ColumnId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_PageId_FieldId] UNIQUE NONCLUSTERED 
(
	[PageId] ASC,
	[FieldId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

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

ALTER TABLE [dbo].[PageGridColumn] ADD  CONSTRAINT [DF_PageGridColumn_Visible]  DEFAULT ((1)) FOR [Visible]
GO

ALTER TABLE [dbo].[PageGridColumn] ADD  CONSTRAINT [DF_PageGridColumn_Searchable]  DEFAULT ((1)) FOR [Searchable]
GO

ALTER TABLE [dbo].[PageGridColumn] ADD  CONSTRAINT [DF_PageGridColumn_Width]  DEFAULT ((0)) FOR [Width]
GO

ALTER TABLE [dbo].[PageGridColumn] ADD  CONSTRAINT [DF_PageGridColumn_ColumnOrder]  DEFAULT ((1)) FOR [ColumnOrder]
GO

ALTER TABLE [dbo].[PageGridColumn] ADD  CONSTRAINT [DF_PageGridColumn_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO



-----------------------------------------------------------------------------------------
/* This table is optional, is not required for the framework to work, but if you want to make used of 
   the built-in methods to populate dropdowns you need to create the table.
 */

CREATE TABLE [dbo].[PageListItem](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [varchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[Text] [nvarchar](500) NOT NULL,
	[ShortText] [nchar](10) NULL,
	[Enable] [bit] NOT NULL,
	[Selected] [bit] NOT NULL,
 CONSTRAINT [PK_PageListItem] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_PageListItem_FieldNameValue] UNIQUE NONCLUSTERED 
(
	[FieldName] ASC,
	[Value] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PageListItem] ADD  CONSTRAINT [DF_PageListItem_Enable]  DEFAULT ((1)) FOR [Enable]
GO

ALTER TABLE [dbo].[PageListItem] ADD  CONSTRAINT [DF_PageListItem_Selected]  DEFAULT ((0)) FOR [Selected]
GO

-----------------------------------------------------------------------------------------

/* This table is required for Framework V.1.2  */

CREATE TABLE [dbo].[PageFilter](
	[FilterId] [int] IDENTITY(1,1) NOT NULL,
	[PageId] [int] NOT NULL,
	[FilterCols] [int] NOT NULL,
	[FilterText] [varchar](100) NULL,
	[ShowClear] [bit] NOT NULL,
	[FilterProps] [varchar](1000) NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [pk_PageFilterId] PRIMARY KEY CLUSTERED 
(
	[FilterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[PageFilter]  WITH CHECK ADD  CONSTRAINT [FK_PageFilter_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Page] ([PageId])
GO

ALTER TABLE [dbo].[PageFilter] CHECK CONSTRAINT [FK_PageFilter_PageId]
GO

ALTER TABLE [dbo].[PageFilter] ADD  CONSTRAINT [DF_PageFilter_Cols]  DEFAULT ((1)) FOR [FilterCols]
GO

ALTER TABLE [dbo].[PageFilter] ADD  CONSTRAINT [DF_PageFilter_ShowClear]  DEFAULT ((1)) FOR [ShowClear]
GO

-----------------------------------------------------------------------------------------
/* This table is required for Framework V.1.2  */

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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [uc_FilterField] UNIQUE NONCLUSTERED 
(
	[FilterId] ASC,
	[FieldId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

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

-----------------------------------------------------------------------------------------
/* This table is only for demo purposes is not required for the framework */

CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(50) NULL,
	MiddleName nvarchar(50) NULL,
	LastName nvarchar(75) NULL,
	Title nvarchar(100) NULL,
	HireDate datetime NULL,
	VacationHours int NULL,
	Salary decimal(19,4) NULL
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY], 
) ON [PRIMARY]

GO