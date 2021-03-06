USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Productividad_Empleado_Dinero]
    @WHERE AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)
DECLARE @COUNT AS INTEGER

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id = OBJECT_ID(N'tempdb..#tmpProdEmp'))
DROP TABLE #tmpProdEmp

CREATE TABLE [#tmpProdEmp] (
	[Empleado] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Amount] DECIMAL(18,2),
	[ColumnName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

SET @SQL = 'INSERT INTO #tmpProdEmp ' + 
	   'SELECT E.Nombre, COUNT(I.ITE_ID) AS Ordenes, DBO.FormatZeros(T.TAS_Order, 2) + ''Ord.'' + T.Nombre  AS Tarea ' + 
	   'FROM tblItemTasks I ' +
           'INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] ' + 
           'INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre ' +
	   'LEFT OUTER JOIN tblEmpleados E ON I.USE_Login = E.[ID] ' + 
	   'WHERE '


PRINT(@SQL + @WHERE + ' GROUP BY E.Nombre, T.Nombre, T.TAS_Order')
EXECUTE(@SQL + @WHERE + ' GROUP BY E.Nombre, T.Nombre, T.TAS_Order')


SET @SQL = 'INSERT INTO #tmpProdEmp ' + 
	   'SELECT E.Nombre, SUM(O.Requerida) AS Piezas, DBO.FormatZeros(T.TAS_Order, 2) + ''Pie.'' + T.Nombre AS Tarea ' + 
	   'FROM tblItemTasks I ' +
           'INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] ' + 
           'INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre ' +
	   'LEFT OUTER JOIN tblEmpleados E ON I.USE_Login = E.[ID] ' + 
	   'WHERE '


PRINT(@SQL + @WHERE + ' GROUP BY E.Nombre, T.Nombre, T.TAS_Order')
EXECUTE(@SQL + @WHERE + ' GROUP BY E.Nombre, T.Nombre, T.TAS_Order')


SET @SQL = 'INSERT INTO #tmpProdEmp ' + 
	   'SELECT E.Nombre, SUM(O.Requerida * O.Unitario * dbo.GetAggregateValue(P.Id, T.TAS_Order)) AS Piezas, DBO.FormatZeros(T.TAS_Order, 2) + ''Din.'' + T.Nombre AS Tarea ' + 
	   'FROM tblItemTasks I ' +
           'INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] ' + 
           'INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre ' +
	   'INNER JOIN tblProductos P ON O.Producto = P.Nombre ' +
	   'LEFT OUTER JOIN tblEmpleados E ON I.USE_Login = E.[ID] ' + 
	   'WHERE '


PRINT(@SQL + @WHERE + ' GROUP BY E.Nombre, T.Nombre, T.TAS_Order')
EXECUTE(@SQL + @WHERE + ' GROUP BY E.Nombre, T.Nombre, T.TAS_Order')


INSERT INTO #tmpProdEmp
SELECT 'Total', SUM(Amount), ColumnName 
FROM #tmpProdEmp
GROUP BY ColumnName


INSERT INTO #tmpProdEmp
SELECT Empleado, SUM(Amount), '97Total Ord.' 
FROM #tmpProdEmp
WHERE SUBSTRING(ColumnName,3,4) = 'Ord.'
GROUP BY Empleado

INSERT INTO #tmpProdEmp
SELECT Empleado, SUM(Amount), '98Total Pie.' 
FROM #tmpProdEmp
WHERE SUBSTRING(ColumnName,3,4) = 'Pie.'
GROUP BY Empleado

INSERT INTO #tmpProdEmp
SELECT Empleado, SUM(Amount), '99Total Din.' 
FROM #tmpProdEmp
WHERE SUBSTRING(ColumnName,3,4) = 'Din.'
GROUP BY Empleado

--SELECT * FROM #tmpProdEmp

SELECT @COUNT = COUNT(AMOUNT) FROM #tmpProdEmp

IF(@COUNT <> 0) BEGIN
	EXEC CROSSTAB_ORIGINAL 'SELECT Empleado FROM #tmpProdEmp GROUP BY Empleado ORDER BY Empleado','SUM(Amount)','ColumnName','#tmpProdEmp',' ORDER BY ColumnName'
END
ELSE BEGIN
	SELECT 'No hay Ordenes, para el filtro que selecciono.' AS Mensaje
END

DROP TABLE #tmpProdEmp

GO
