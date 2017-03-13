USE Larco
GO

DELETE FROM tblStockOrdenes WHERE LEFT(ITE_Nombre,2) = '06'
DELETE FROM tblStockOrdenes WHERE LEFT(ITE_Nombre,2) = '07'

GO

UPDATE tblOrdenes SET Producto = I.Pro_Nombre
FROM tblOrdenes O
INNER JOIN tblItems I ON I.ITE_ID = O.ITE_ID
where O.Producto not in (select Nombre from tblProductos)
GO

ALTER TABLE tblOrdenes
ADD OrdenId INT IDENTITY(1, 1)

ALTER TABLE tblOrdenes
ADD CONSTRAINT pk_OrdenId PRIMARY KEY (OrdenId)
GO

ALTER TABLE tblOrdenes
ADD ProductId INT NULL

ALTER TABLE tblOrdenes
ADD EmployeeId INT NULL
GO

ALTER TABLE tblOrdenes
ADD	[Stock] [bit] NULL,
[Programado] [bit] NULL,
[Cantidad] [int] NULL,
[FileName] [varchar](50) NULL,
[AddBy] [varchar](50) NULL,
[AddDate] [datetime] NULL,
[Mezclado] [bit] NULL
GO

ALTER TABLE tblStockOrdenes
ADD	[StockParcial] [bit] NULL,
[StockParcialCantidad] [int] NULL,
ProductId [int] NULL,
EmployeeId [int] NULL
GO

ALTER TABLE tblStockOrdenes
ALTER COLUMN [ITE_Nombre] [varchar](50) NOT NULL
GO

ALTER TABLE [tblStockOrdenes]
ADD CONSTRAINT pk_StockOrdersId PRIMARY KEY (ITE_ID)
GO

ALTER TABLE [tblStockOrdenes]
ADD CONSTRAINT uc_StockOrdersITENombre UNIQUE ([ITE_Nombre])
GO

UPDATE tblOrdenes SET ProductId = P.Id
FROM tblOrdenes O
INNER JOIN tblProductos P ON O.Producto = P.Nombre
GO

UPDATE [tblStockOrdenes] SET ProductId = P.Id
FROM [tblStockOrdenes] O
INNER JOIN tblProductos P ON O.Producto = P.Nombre
GO

UPDATE tblOrdenes SET Nombre = 'Daria P ' where Nombre not in (select nombre from tblEmpleados)
UPDATE tblStockOrdenes SET Nombre = 'Daria P '  where Nombre not in (select nombre from tblEmpleados)


UPDATE tblOrdenes SET EmployeeId = E.Id
FROM tblOrdenes O
INNER JOIN tblEmpleados E ON O.Nombre = E.Nombre
GO

UPDATE [tblStockOrdenes] SET EmployeeId = E.Id
FROM [tblStockOrdenes] O
INNER JOIN tblEmpleados E ON O.Nombre = E.Nombre
GO

ALTER TABLE [tblOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProductos] ([Id])
GO

ALTER TABLE [dbo].[tblOrdenes] CHECK CONSTRAINT [FK_Ordenes_ProductId]
GO

ALTER TABLE [tblOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmpleados] ([Id])
GO

ALTER TABLE [dbo].[tblOrdenes] CHECK CONSTRAINT [FK_Ordenes_EmployeeId]
GO

ALTER TABLE [tblStockOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_StockOrdenes_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProductos] ([Id])
GO

ALTER TABLE [dbo].[tblStockOrdenes] CHECK CONSTRAINT [FK_StockOrdenes_ProductId]
GO

ALTER TABLE [tblStockOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_StockOrdenes_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmpleados] ([Id])
GO

ALTER TABLE [dbo].[tblStockOrdenes] CHECK CONSTRAINT [FK_StockOrdenes_EmployeeId]
GO

ALTER TABLE [dbo].[tblOrdenes] ADD  CONSTRAINT [DF_Ordenes_Stock]  DEFAULT (0) FOR [Stock]
GO

ALTER TABLE [dbo].[tblOrdenes] ADD  CONSTRAINT [DF_Ordenes_Programado]  DEFAULT (0) FOR [Programado]
GO

update [tblOrdenes] SET Mezclado = 0, Stock = 0 WHERE Stock is null
GO

update [tblOrdenes] SET Mezclado = 0, Stock = 0 WHERE Stock is null
GO

update [tblOrdenes] SET StockParcial = 0 where StockParcial is null
update [tblstockOrdenes] SET StockParcial = 0 where StockParcial is null
GO

update [tblOrdenes] SET Programado = 0 where Programado is null
update [tblstockOrdenes] SET Programado = 0 where Programado is null
GO

DELETE FROM tblItemTasks WHERE ITE_Id = 50370
DELETE FROM tblItems WHERE ITE_ID = 50370
DELETE FROM tblOrdenes WHERE ITE_ID = 50370

INSERT INTO tblClientes(Clave,Nombre,Update_Date,Update_User)
SELECT DISTINCT SUBSTRING(ITE_Nombre,4,3),'Desconocido',GETDATE(),999 
FROM tblOrdenes 
WHERE SUBSTRING(ITE_Nombre,4,3) NOT IN (SELECT Clave FROM tblClientes)

ALTER TABLE tblOrdenes
ADD	[ClientId] varchar(5) NULL

ALTER TABLE tblStockOrdenes
ADD	[ClientId] varchar(5) NULL

UPDATE tblOrdenes SET ClientId = SUBSTRING(ITE_Nombre,4,3)
GO

UPDATE tblStockOrdenes SET ClientId = SUBSTRING(ITE_Nombre,4,3)
GO

ALTER TABLE tblOrdenes
ALTER COLUMN [ClientId] varchar(5) NOT NULL

ALTER TABLE tblStockOrdenes
ALTER COLUMN [ClientId] varchar(5) NOT NULL

ALTER TABLE [tblOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[tblClientes] ([Clave])
GO

ALTER TABLE [dbo].[tblOrdenes] CHECK CONSTRAINT [FK_Ordenes_ClientId]
GO

ALTER TABLE [tblStockOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_StockOrdenes_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[tblClientes] ([Clave])
GO

ALTER TABLE [dbo].[tblStockOrdenes] CHECK CONSTRAINT [FK_StockOrdenes_ClientId]
GO


IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblOrdenes]'))
DROP TRIGGER [dbo].[TD_tblOrdenes]
GO

-----------------------------------------------------------------------------------------
-- INSERT tblStockOrders INTO tblOrdenes
-----------------------------------------------------------------------------------------
SELECT * INTO tmpStockOrdenes FROM tblStockOrdenes WHERE ITE_Nombre IN (SELECT ITE_Nombre FROM tblOrdenes)

INSERT INTO [tblOrdenes]([ITE_ID],[ITE_Nombre],[TipoProceso],[Requerida],[Ordenada],[Producto],[Numero],[Terminal],[OrdenCompra],[Recibido],[Entrega],[Interna],[Nombre],[Aprobacion],[Observaciones],[Otras],[Unitario],[Total],[Dolares],[FAC_Id],[PN_Id],[Update_Date],[Update_User],[StockParcial],[StockParcialCantidad],[ST_ID],[Requisicion],[Urgente],[Alerta],[AlertaMsg],[Instrucciones],[ProductId],[EmployeeId],[Stock],[Programado],[Cantidad],[FileName],[AddBy],[AddDate],[Mezclado],[ClientId])
SELECT	NULL,[ITE_Nombre],[TipoProceso],[Requerida],[Ordenada],[Producto],[Numero],[Terminal],[OrdenCompra],[Recibido],[Entrega],[Interna],[Nombre],[Aprobacion],[Observaciones],[Otras],[Unitario],[Total],[Dolares],[FAC_Id],[PN_Id],[Update_Date],[Update_User],[StockParcial],[StockParcialCantidad],[ST_ID],[Requisicion],[Urgente],[Alerta],[AlertaMsg],[Instrucciones],[ProductId],[EmployeeId],[Stock],[Programado],[Cantidad],[FileName],[AddBy],[AddDate],[Mezclado],[ClientId]
FROM tblStockOrdenes WHERE ITE_Nombre NOT IN (SELECT ITE_Nombre FROM tblOrdenes)


-- TODO 

--UPDATE tblStockOrdenes SET ST_ID = NULL WHERE  ST_ID NOT IN (SELECT ST_ID FROM tblStock)
UPDATE tblOrdenes SET ST_ID = NULL WHERE ST_ID not in (SELECT ST_ID FROM tblStock)
GO

ALTER TABLE [tblOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_StockId] FOREIGN KEY([ST_ID])
REFERENCES [dbo].[tblStock] ([ST_ID])
GO

ALTER TABLE [dbo].[tblOrdenes] CHECK CONSTRAINT [FK_Ordenes_StockId]
GO



/*
ALTER TABLE [tblStockOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_StockOrdenes_StockId] FOREIGN KEY([ST_ID])
REFERENCES [dbo].[tblStock] ([ST_ID])
GO

ALTER TABLE [dbo].[tblStockOrdenes] CHECK CONSTRAINT [FK_StockOrdenes_StockId]
GO
*/
-- TODO: add logic Ventas screen to insert record in banners in orden to removed the triggers TI_tblOrdenes y TU_tblOrdenes

-- RUN THIS Separate
/*

--NO LONGER NECESARY
CREATE VIEW [OrdenesVW] AS
SELECT [OrdenId],[ITE_ID],[ITE_Nombre],[TipoProceso],[Requerida],[Ordenada],[Producto],
[Numero],[Terminal],[OrdenCompra],[Recibido],[Entrega],[Interna],[Nombre],
[Aprobacion],[Observaciones],[Otras],[Unitario],[Total],[Dolares],[FAC_Id],
[PN_Id],[Update_Date],[Update_User],[StockParcial],[StockParcialCantidad],
[ST_ID],[Requisicion],[Urgente],[Alerta],[AlertaMsg],[Instrucciones],
[ProductId],[EmployeeId],[Stock],[Programado],[Cantidad],[FileName],[AddBy],
[AddDate],[Mezclado],ClientId
FROM [tblOrdenes]
UNION
SELECT [ITE_ID] AS [OrdenId], 0 AS [ITE_ID],[ITE_Nombre],[TipoProceso],[Requerida],[Ordenada],[Producto],
[Numero],[Terminal],[OrdenCompra],[Recibido],[Entrega],[Interna],[Nombre],
[Aprobacion],[Observaciones],[Otras],[Unitario],[Total],[Dolares],[FAC_Id],
[PN_Id],[Update_Date],[Update_User],[StockParcial],[StockParcialCantidad],
[ST_ID],[Requisicion],[Urgente],[Alerta],[AlertaMsg],[Instrucciones],
[ProductId],[EmployeeId],[Stock],[Programado],[Cantidad],[FileName],[AddBy],
[AddDate],[Mezclado],ClientId
FROM tblStockOrdenes
*/

