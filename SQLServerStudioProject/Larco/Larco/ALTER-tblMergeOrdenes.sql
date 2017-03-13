USE Larco
GO


ALTER TABLE tblMergeOrdenes
ADD CONSTRAINT pk_MergeOrdenesId PRIMARY KEY (MO_ID)
GO

ALTER TABLE tblMergeOrdenes
ADD CONSTRAINT UC_MergeOrdenes_ITE_Nombre_MO_ITE_Nombre UNIQUE (ITE_Nombre, MO_ITE_Nombre)
GO
