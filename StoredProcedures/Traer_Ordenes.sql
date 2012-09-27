USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Traer_Ordenes]    Script Date: 09/06/2012 22:26:52 ******/
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
	Entrega,Interna,Recibido,Unitario,Observaciones,Otras,Total,Nombre,Producto,Aprobacion,Dolares,OrdenCompra,0 AS Stock,PN_Id
	INTO #tmpOrdenes
	FROM tblOrdenes
	WHERE Left(ITE_Nombre,2) = @ANIO 
	ORDER BY ITE_ID
	
	
	INSERT INTO #tmpOrdenes
	SELECT ITE_Id,ITE_Nombre,TipoProceso,Requerida,Ordenada,Numero,Terminal,
	Entrega,Interna,Recibido,Unitario,Observaciones,Otras,Total,Nombre,Producto,Aprobacion,Dolares,OrdenCompra,1  AS Stock,PN_Id
	FROM tblStockOrdenes
	WHERE Left(ITE_Nombre,2) = @ANIO AND Stock = 1
	ORDER BY ITE_ID
	
	SELECT ITE_Id,ITE_Nombre,TipoProceso,Requerida,Ordenada,Numero,Terminal,
	Entrega,Interna,Recibido,Unitario,Observaciones,Otras,Total,Nombre,Producto,Aprobacion,Dolares,OrdenCompra,Stock,PN_Id
	FROM  #tmpOrdenes ORDER BY ITE_Nombre
