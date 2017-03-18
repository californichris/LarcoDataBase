USE LarcoOld
GO

ALTER TABLE tblUnidadesMedida
ADD CONSTRAINT pk_UnidadesMedidaId PRIMARY KEY (UNI_ID)

GO

ALTER TABLE tblUnidadesMedida
ALTER COLUMN UNI_Medida varchar(50) not null
GO

ALTER TABLE tblUnidadesMedida
ADD CONSTRAINT uc_UnidadMedida UNIQUE ([UNI_Medida])
GO


