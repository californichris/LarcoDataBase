USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Traer_Ordenes]    Script Date: 11/16/2015 15:08:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Traer_Ordenes '07'
ALTER	PROCEDURE [dbo].[Traer_Ordenes]
(
	@ANIO	VARCHAR(2)
)
AS

	SELECT ITE_Id,ITE_Nombre,TipoProceso,Requerida,Ordenada,Numero,Terminal,
	Entrega,Interna,Recibido,Unitario,Observaciones,Otras,Total,Nombre,Producto,
	Aprobacion,Dolares,OrdenCompra,0 AS Stock,PN_Id,StockParcial,StockParcialCantidad,
	0 AS Mezclado, Requisicion, Urgente, Alerta, AlertaMsg, Instrucciones
	INTO #tmpOrdenes
	FROM tblOrdenes
	WHERE Left(ITE_Nombre,2) = @ANIO 
	ORDER BY ITE_ID
	
	
	INSERT INTO #tmpOrdenes
	SELECT ITE_Id,ITE_Nombre,TipoProceso,Requerida,Ordenada,Numero,Terminal,
	Entrega,Interna,Recibido,Unitario,Observaciones,Otras,Total,Nombre,Producto,
	Aprobacion,Dolares,OrdenCompra,Stock,PN_Id,0 AS StockParcial,NULL AS StockParcialCantidad,
	Mezclado, Requisicion, Urgente, Alerta, AlertaMsg, Instrucciones
	FROM tblStockOrdenes
	WHERE Left(ITE_Nombre,2) = @ANIO AND (Stock = 1 OR Mezclado = 1)
	ORDER BY ITE_ID
	
	SELECT ITE_Id,ITE_Nombre,TipoProceso,Requerida,Ordenada,Numero,Terminal,
	Entrega,Interna,Recibido,Unitario,Observaciones,Otras,Total,Nombre,Producto,
	Aprobacion,Dolares,OrdenCompra,Stock,PN_Id,StockParcial,StockParcialCantidad,
	Mezclado, Requisicion, Urgente, Alerta, AlertaMsg, Instrucciones
	FROM  #tmpOrdenes ORDER BY ITE_Nombre
