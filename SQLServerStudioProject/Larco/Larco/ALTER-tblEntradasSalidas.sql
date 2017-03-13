USE LarcoOld

ALTER TABLE tblEntradasSalidas
ADD CONSTRAINT pk_EntradasSalidasId PRIMARY KEY (ES_ID)

SELECT * FROM tblEntradasSalidas
WHERE ED_ID NOT IN (select ED_ID from tblEntradasDetalle)

SELECT * FROM tblEntradasSalidas
WHERE SD_ID NOT IN (select SD_ID from tblSalidasDetalle)

DELETE FROM tblEntradasSalidas
WHERE SD_ID NOT IN (select SD_ID from tblEntradasDetalle)

DELETE FROM tblEntradasSalidas
WHERE SD_ID NOT IN (select SD_ID from tblSalidasDetalle)


ALTER TABLE tblEntradasSalidas  WITH CHECK ADD  CONSTRAINT [FK_EntradasSalidas_EntradasDetalle] FOREIGN KEY(ED_ID)
REFERENCES tblEntradasDetalle (ED_ID)
GO

ALTER TABLE tblEntradasSalidas CHECK CONSTRAINT [FK_EntradasSalidas_EntradasDetalle]
GO

ALTER TABLE tblEntradasSalidas  WITH CHECK ADD  CONSTRAINT [FK_EntradasSalidas_SalidasDetalle] FOREIGN KEY(SD_ID)
REFERENCES tblSalidasDetalle (SD_ID)
GO

ALTER TABLE tblEntradasSalidas CHECK CONSTRAINT [FK_EntradasSalidas_SalidasDetalle]
GO