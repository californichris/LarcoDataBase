USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PastDueOrdersInTask]
(
	@TASK_ID	INT,
	@START INT,
	@END INT
)
AS

	SELECT RIGHT(IT.ITE_Nombre,10) AS 'Order', O.Ordenada AS Quantity, 
	LEFT(O.Producto,20) AS Product, CONVERT(VARCHAR, O.Interna, 101) AS DueDate, 
	LEFT(CONVERT(VARCHAR, IT.ITS_DTStart,120),16) AS StartDate, LEFT(T.Nombre,12) AS Task,O.Ordenada AS Pieces,
	O.Interna,A.BEFOREDAYS,O.Producto
	INTO #tmpPastDueOrdersInTask
	FROM PendingOrders_VW IT
	INNER JOIN tblTareas T ON IT.TAS_Id = T.Id AND T.Id = @TASK_ID 
	INNER JOIN tblOrdenes O ON O.ITE_Nombre = IT.ITE_Nombre
	INNER JOIN tblProductos P ON O.Producto = P.Nombre 
	INNER JOIN tblAggregateValue A ON A.Task_ID = @TASK_ID AND A.Product_ID = P.ID 

	SELECT *,ROW_NUMBER() OVER (ORDER BY Interna) AS RowNumber 
	INTO #tmpPastDueOrdersInTaskWithRowNumber
	FROM #tmpPastDueOrdersInTask
	WHERE dbo.GetDueDate(BEFOREDAYS, Interna) <= GETDATE()

	SELECT RowNumber,[Order],Quantity,Product,DueDate,StartDate,Task
	FROM #tmpPastDueOrdersInTaskWithRowNumber 
	WHERE RowNumber BETWEEN @START AND @END
	UNION
	SELECT COUNT(*),'Total',CASE WHEN SUM(Pieces) IS NULL THEN 0 ELSE SUM(Pieces) END,'','','',''
	FROM #tmpPastDueOrdersInTaskWithRowNumber
	ORDER BY 1

GO
