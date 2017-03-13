USE Larco
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblPlano]') AND name = N'PK_tblPlano')
ALTER TABLE [dbo].[tblPlano] DROP CONSTRAINT [PK_tblPlano]
GO

ALTER TABLE tblPlano
ADD CONSTRAINT pk_PlanoId PRIMARY KEY (PN_ID)
GO

ALTER TABLE tblPlano
ADD CONSTRAINT uc_PlanoNumero UNIQUE (PN_Numero)
GO


ALTER TABLE tblPlano
ALTER COLUMN [PN_Descripcion] [varchar](100) NOT NULL
GO