USE Larco
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblProductos]') AND name = N'UQ__tblProdu__75E3EFCF4BCC3ABA')
ALTER TABLE [dbo].[tblProductos] DROP CONSTRAINT [UQ__tblProdu__75E3EFCF4BCC3ABA]
GO

ALTER TABLE [tblProductos]
ALTER COLUMN [Nombre] [varchar](50) NOT NULL
GO

ALTER TABLE [tblProductos]
ADD CONSTRAINT uc_ProductosNombre UNIQUE ([Nombre])
GO


IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblproductos]'))
DROP TRIGGER [dbo].[TI_tblproductos]
GO

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblproductos]'))
DROP TRIGGER [dbo].[TD_tblproductos]
GO


