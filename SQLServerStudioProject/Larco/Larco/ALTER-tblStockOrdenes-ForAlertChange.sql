USE Larco
Go

ALTER TABLE tblStockOrdenes
Add [Alerta] bit NULL

ALTER TABLE tblStockOrdenes
Add [AlertaMsg] nvarchar(50) NULL

ALTER TABLE tblStockOrdenes
ADD [Instrucciones] nvarchar(1000) NULL

UPDATE tblStockOrdenes SET Alerta = 0