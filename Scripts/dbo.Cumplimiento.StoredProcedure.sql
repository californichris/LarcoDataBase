USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE        PROCEDURE [dbo].[Cumplimiento]
	@FROM AS VARCHAR(50),
	@TO AS VARCHAR(50),
	@CLIENT AS VARCHAR(8000),
	@TYPE AS VARCHAR(50)
AS 

DECLARE @SQL AS VARCHAR(8000)
DECLARE @TASK AS VARCHAR(25)
IF (@CLIENT <> '') BEGIN
	SELECT @CLIENT = '''' + REPLACE(@CLIENT,',',''',''') + ''''
END

IF (@TYPE = 'Larco') BEGIN
	SELECT @TYPE = 'Interna', @TASK = 'Calidad'
END
ELSE BEGIN
	SELECT @TYPE = 'Entrega', @TASK = 'VentasFinal'
END


IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N'tempdb..#tmpCump'))
DROP TABLE #tmpCump

CREATE TABLE [#tmpCump] (
	[ITE_Nombre] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Fecha] [datetime] NULL
) ON [PRIMARY]

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N'tempdb..#tmpCump1'))
DROP TABLE #tmpCump1

CREATE TABLE [#tmpCump1] (
	[Fecha] [datetime] NULL,
	[Liberadas] [int] NULL
) ON [PRIMARY]

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N'tempdb..#tmpCump2'))
DROP TABLE #tmpCump2

CREATE TABLE [#tmpCump2] (
	[Fecha] [datetime] NULL,
	[NoLiberadas] [int] NULL
) ON [PRIMARY]


SET @SQL = 'INSERT INTO #tmpCump ' +
           'SELECT I.ITE_Nombre,' + @TYPE + ' ' +
           'FROM tblItemTasks I INNER JOIN tblTareas T ' +
           'ON I.TAS_Id = T.[Id] INNER JOIN tblOrdenes O ' +
           'ON I.ITE_Nombre = O.ITE_Nombre ' +
           'WHERE T.Nombre = ''' + @TASK + ''' AND ITS_Status IS NOT NULL ' +
           'AND ITS_Status <> 9 AND ITS_DTStop <= CONVERT(VARCHAR(10),' + @TYPE + ',101) + '' 23:59:59.99'' ' + 
	   'AND ' + @TYPE + ' >= ''' + @FROM + ''' AND ' + @TYPE + ' <= ''' + @TO + ''' ' +
	   'AND I.ITE_NOMBRE NOT IN (SELECT ITE_NOMBRE FROM tblScrap) '
	
IF (@CLIENT <> '') BEGIN
	SET @SQL = @SQL + ' AND SUBSTRING(I.ITE_Nombre,4,3) IN (' + @CLIENT + ') '
END


EXEC(@SQL)


INSERT INTO #tmpCump1 
SELECT Fecha,Count(Fecha) FROM #tmpCump GROUP BY Fecha

-- SELECT * FROM #tmpCump1

SET @SQL = 'INSERT INTO #tmpCump2 ' +
		   'SELECT ' + @TYPE + ',Count(*)  ' +
		   'FROM tblOrdenes O  ' +
		   'WHERE ' + @TYPE + ' >= ''' + @FROM + ''' AND ' + @TYPE + ' <= ''' + @TO + ''' ' +
		   'AND O.ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpCump) ' + 
                   'AND O.ITE_Nombre NOT IN (SELECT ITE_Nombre FROM tblScrap) '

IF (@CLIENT <> '') BEGIN
	SET @SQL = @SQL + ' AND SUBSTRING(O.ITE_Nombre,4,3) IN (' + @CLIENT + ') '
END

SET @SQL = @SQL + ' GROUP BY ' + @TYPE + ' '


EXEC(@SQL)

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N'tempdb..#tmpCump3'))
DROP TABLE #tmpCump3

CREATE TABLE [#tmpCump3] (
	[Fecha] [datetime] NULL,
	[Liberadas] [int] NULL,
	[NoLiberadas] [int] NULL
) ON [PRIMARY]

INSERT INTO #tmpCump3
SELECT C.Fecha,Liberadas,NoLiberadas
FROM #tmpCump1 C
INNER JOIN #tmpCump2 N ON C.Fecha = N.Fecha
ORDER BY C.Fecha

INSERT INTO #tmpCump3
SELECT Fecha,Liberadas,0 FROM #tmpCump1 WHERE Fecha NOT IN (SELECT Fecha FROM #tmpCump2)

INSERT INTO #tmpCump3
SELECT Fecha,0,NoLiberadas FROM #tmpCump2 WHERE Fecha NOT IN (SELECT Fecha FROM #tmpCump1)
 
SELECT * FROM #tmpCump3 ORDER BY Fecha



GO
