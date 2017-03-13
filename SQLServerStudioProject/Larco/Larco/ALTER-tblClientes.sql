USE Larco
GO

ALTER TABLE [tblClientes]
ADD CONSTRAINT pk_ClientId PRIMARY KEY (Id)
GO

ALTER TABLE [tblClientes]
ALTER COLUMN [Clave] [varchar](5) NOT NULL

ALTER TABLE [tblClientes]
ALTER COLUMN [Nombre] [varchar](150) NOT NULL
GO

select clave, COUNT(*) from tblClientes group by clave
select * from tblClientes where Clave = '775'

delete from tblClientes where ID = (select top 1 Id From tblClientes where Clave = '775' order by Id desc)

ALTER TABLE [tblClientes]
ADD CONSTRAINT uc_ClientClave UNIQUE ([Clave])
GO

