USE LarcoOld
GO

ALTER TABLE tblSalidasDetalle
ADD CONSTRAINT pk_SalidasDetalleId PRIMARY KEY (SD_ID)


ALTER TABLE tblSalidasDetalle  WITH CHECK ADD  CONSTRAINT [FK_SalidasDetalle_Salidas] FOREIGN KEY([SAL_ID])
REFERENCES tblSalidas ([SAL_ID])
GO

ALTER TABLE tblSalidasDetalle CHECK CONSTRAINT [FK_SalidasDetalle_Salidas]
GO