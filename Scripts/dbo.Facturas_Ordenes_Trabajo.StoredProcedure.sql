USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- Facturas_Ordenes_Trabajo '07','067','021',''
CREATE       PROCEDURE [dbo].[Facturas_Ordenes_Trabajo]
    @ANIO AS VARCHAR(2),
    @CLIENTE AS VARCHAR(3),
    @ORDENES_TRABAJO AS VARCHAR(8000),
    @ORDENES AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id = OBJECT_ID(N'tempdb..#tmpOrdenesTrabajo'))
DROP TABLE #tmpOrdenesTrabajo

CREATE TABLE [#tmpOrdenesTrabajo] (
	[ITE_Nombre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FD_Cantidad] [int] NULL ,
	[FD_Desc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FD_Numero] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DllText] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Unitario] [decimal](18, 2) NULL,
	[Stock] [bit] NULL
) ON [PRIMARY]

SET @SQL = 'INSERT INTO #tmpOrdenesTrabajo ' +
	   'SELECT O.ITE_Nombre, O.Requerida, O.Otras,O.Numero,  ' +
           'CASE WHEN O.Dolares = 0 THEN ''N'' ELSE ''Y'' END AS DllText,O.Unitario,0  ' +
	   'FROM tblItemTasks I ' +
	   'INNER JOIN tblTareas T ON I.TAS_ID = T.ID ' +
	   'INNER JOIN tblOrdenes O ON O.ITE_Nombre = I.ITE_Nombre ' +
	   'WHERE T.Nombre = ''VentasFinal'' AND I.ITS_STATUS = 2 AND LEFT(O.ITE_Nombre,2) = ' + @ANIO + ' ' +
	   'AND O.FAC_Id IS NULL AND SUBSTRING(O.ITE_NOMBRE,5,2) = ' + RIGHT(@CLIENTE,2) + ' '

IF('' <> @ORDENES_TRABAJO AND 'Todos' <> @ORDENES_TRABAJO)BEGIN
	SET @SQL = @SQL + ' AND SUBSTRING(O.ITE_NOMBRE,8,3) IN (''' + REPLACE(@ORDENES_TRABAJO,',',''',''') + ''') ' 
END

IF('' <> @ORDENES)BEGIN
	SET @SQL = @SQL + ' AND O.ITE_Nombre NOT IN (''' + REPLACE(@ORDENES,',',''',''') + ''') ' 
END

PRINT(@SQL)
EXEC(@SQL)

SET @SQL = 'INSERT INTO #tmpOrdenesTrabajo ' +
	   'SELECT O.ITE_Nombre, O.Requerida, O.Otras,O.Numero,  ' +
           'CASE WHEN O.Dolares = 0 THEN ''N'' ELSE ''Y'' END AS DllText,O.Unitario,1  ' +
	   'FROM tblStockOrdenes O ' +
	   'WHERE LEFT(O.ITE_Nombre,2) = ' + @ANIO + ' ' +
	   'AND O.FAC_Id IS NULL AND O.Programado = 0 AND SUBSTRING(O.ITE_NOMBRE,5,2) = ' + RIGHT(@CLIENTE,2) + ' '

IF('' <> @ORDENES_TRABAJO AND 'Todos' <> @ORDENES_TRABAJO)BEGIN
	SET @SQL = @SQL + ' AND SUBSTRING(O.ITE_NOMBRE,8,3) IN (''' + REPLACE(@ORDENES_TRABAJO,',',''',''') + ''') ' 
END

IF('' <> @ORDENES)BEGIN
	SET @SQL = @SQL + ' AND O.ITE_Nombre NOT IN (''' + REPLACE(@ORDENES,',',''',''') + ''') ' 
END

PRINT(@SQL)
EXEC(@SQL)

SELECT * FROM #tmpOrdenesTrabajo ORDER BY ITE_Nombre






GO
