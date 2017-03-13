USE Larco
GO

ALTER TABLE [tblTareas]
ALTER COLUMN [TAS_Order] [smallint] NOT NULL
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblTareas]') AND name = N'INX_Nombre')
DROP INDEX [INX_Nombre] ON [dbo].[tblTareas] WITH ( ONLINE = OFF )
GO

ALTER TABLE [tblTareas]
ALTER COLUMN [Nombre] [varchar](50) NOT NULL
GO

ALTER TABLE [tblTareas]
ADD CONSTRAINT uc_TareasNombre UNIQUE ([Nombre])
GO



