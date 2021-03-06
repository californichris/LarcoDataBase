USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       PROCEDURE [dbo].[Carga_Trabajo]
    @ROWNAME AS VARCHAR(100),
    @COLUMNNAME AS VARCHAR(100),
    @WHERE AS VARCHAR(8000),
    @PIEZAS AS BIT
AS

DECLARE @SQL AS VARCHAR(8000)
DECLARE @COUNT AS INTEGER

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id = OBJECT_ID(N'tempdb..#tmpCarga'))
DROP TABLE #tmpCarga

CREATE TABLE [#tmpCarga] (
	[Columna] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Amount] int,
	[ColumnName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]


SET @SQL = 'INSERT INTO #tmpCarga SELECT ' + @ROWNAME + ','

IF(@PIEZAS = 0) BEGIN
	SET @SQL = @SQL + ' COUNT(*) AS Cantidad,'
END
ELSE BEGIN
	SET @SQL = @SQL + ' SUM(O.Ordenada) AS Cantidad,'
END

DECLARE @COLUMNNEW AS VARCHAR(100)
DECLARE @COLUMNORDER AS VARCHAR(100)


SET @COLUMNNEW = @COLUMNNAME

if (@COLUMNNAME = 'T.Nombre') begin
	SET @COLUMNNEW = 'RIGHT(''000'' + CAST(TAS_Order AS VARCHAR(100)),2) + T.Nombre'	
end

SET @COLUMNORDER = @COLUMNNAME
if (@COLUMNNAME = 'T.Nombre') begin
	SET @COLUMNORDER = 'TAS_Order,T.Nombre'	
end

SET @SQL = @SQL + @COLUMNNEW + ' FROM tblItemTasks I
           INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
	   INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre
	   WHERE '

PRINT(@SQL + @WHERE + ' GROUP BY ' + @ROWNAME + ', ' + @COLUMNORDER)
EXECUTE(@SQL + @WHERE + ' GROUP BY ' + @ROWNAME + ', ' + @COLUMNORDER)

--SELECT * FROM #tmpCarga

INSERT INTO #tmpCarga
SELECT 'Total', SUM(Amount), ColumnName 
FROM #tmpCarga
GROUP BY ColumnName


INSERT INTO #tmpCarga
SELECT Columna, SUM(Amount), 'Total' 
FROM #tmpCarga
GROUP BY Columna

SELECT @COUNT = COUNT(AMOUNT) FROM #tmpCarga

IF(@COUNT <> 0) BEGIN
 EXEC CROSSTAB_ORIGINAL 'SELECT Columna FROM #tmpCarga GROUP BY Columna ORDER BY Columna','SUM(Amount)','ColumnName','#tmpCarga',' ORDER BY ColumnName'
END
ELSE BEGIN
	SELECT 'No hay Ordenes, para el filtro que selecciono.' AS Mensaje
END

DROP TABLE #tmpCarga


GO
