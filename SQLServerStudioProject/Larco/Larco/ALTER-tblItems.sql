USE Larco
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND name = N'UC_Items_ITE_Nombre')
ALTER TABLE [dbo].[tblItems] DROP CONSTRAINT [UC_Items_ITE_Nombre]
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND name = N'INX_ITE_Nombre')
DROP INDEX [INX_ITE_Nombre] ON [dbo].[tblItems] WITH ( ONLINE = OFF )
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND name = N'INX_ITE_ID')
DROP INDEX [INX_ITE_ID] ON [dbo].[tblItems] WITH ( ONLINE = OFF )
GO

ALTER TABLE [tblItems]
ALTER COLUMN [ITE_Nombre] [varchar](50) NOT NULL
GO

ALTER TABLE [tblItems]
ALTER COLUMN [PRO_NOMBRE] [varchar](50) NOT NULL
GO

ALTER TABLE [dbo].[tblItems] ADD  CONSTRAINT [UC_Items_ITE_Nombre] UNIQUE NONCLUSTERED 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

ALTER TABLE [tblItems]
ADD ProductId [int] NULL
GO

UPDATE [tblItems] SET ProductId = P.Id
FROM [tblItems] R
INNER JOIN tblProductos P ON R.PRO_Nombre = P.Nombre
GO

ALTER TABLE [tblItems]
ALTER COLUMN ProductId [int] NOT NULL
GO

ALTER TABLE [tblItems]  WITH CHECK ADD  CONSTRAINT [FK_Items_Product] FOREIGN KEY([PRO_Nombre])
REFERENCES [tblProductos] ([Nombre])
GO

ALTER TABLE [tblItems] CHECK CONSTRAINT [FK_Items_Product]
GO

ALTER TABLE [tblItems]  WITH CHECK ADD  CONSTRAINT [FK_Items_ProductId] FOREIGN KEY([ProductId])
REFERENCES [tblProductos] ([Id])
GO

ALTER TABLE [tblItems] CHECK CONSTRAINT [FK_Items_ProductId]
GO

ALTER TABLE [dbo].[tblItems] 
ADD  CONSTRAINT [DF_tblItems_ITE_Priority]  DEFAULT (0.0) FOR [ITE_Priority]
GO

ALTER TABLE [dbo].[tblItems] 
ADD  CONSTRAINT [DF_tblItems_ITE_Fecha]  DEFAULT (GETDATE()) FOR [ITE_Fecha]
GO

/*
ALTER TABLE [dbo].[tblItems] 
DROP COLUMN CLI_Clave
*/

