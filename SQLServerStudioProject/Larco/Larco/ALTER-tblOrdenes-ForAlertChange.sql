USE Larco
Go


ALTER TABLE tblOrdenes
Add [Alerta] bit NULL

ALTER TABLE tblOrdenes
Add [AlertaMsg] nvarchar(50) NULL

ALTER TABLE tblOrdenes
ADD [Instrucciones] nvarchar(1000) NULL


UPDATE tblOrdenes SET Alerta = 0