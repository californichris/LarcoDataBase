USE LarcoOld
GO

ALTER TABLE tblTiposMaterial
ADD CONSTRAINT pk_TiposMaterialId PRIMARY KEY (TIP_ID)

GO

ALTER TABLE tblTiposMaterial
ALTER COLUMN TIP_Tipo varchar(50) not null
GO

ALTER TABLE tblTiposMaterial
ALTER COLUMN TIP_Descripcion varchar(50) not null
GO

ALTER TABLE tblTiposMaterial
ADD CONSTRAINT uc_TipoMaterial UNIQUE (TIP_Tipo, TIP_Descripcion)
GO
