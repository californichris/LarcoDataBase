USE LarcoOld
GO

ALTER TABLE tblEntradas
ADD CONSTRAINT pk_EntradasId PRIMARY KEY (ENT_ID)

ALTER TABLE tblEntradas  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Provedores] FOREIGN KEY([PROV_ID])
REFERENCES tblProvedores ([PROV_ID])
GO

ALTER TABLE tblEntradas CHECK CONSTRAINT [FK_Entradas_Provedores]
GO

ALTER TABLE tblEntradas  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Users] FOREIGN KEY([USE_ID])
REFERENCES tblUsers ([USE_ID])
GO

ALTER TABLE tblEntradas CHECK CONSTRAINT [FK_Entradas_Users]
GO

ALTER TABLE tblEntradas  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Pais] FOREIGN KEY([ENT_PaisOrigen])
REFERENCES tblPaises ([PAIS_ID])
GO

ALTER TABLE tblEntradas CHECK CONSTRAINT [FK_Entradas_Pais]
GO