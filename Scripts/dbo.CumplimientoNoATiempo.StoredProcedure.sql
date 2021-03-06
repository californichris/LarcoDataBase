USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[CumplimientoNoATiempo]
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

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N'tempdb..#tmpOrdenes'))
DROP TABLE #tmpOrdenes

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N'tempdb..#tmpCump'))
DROP TABLE #tmpCump

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N'tempdb..#tmpItemTasks'))
DROP TABLE #tmpItemTasks

CREATE TABLE [#tmpCump] (
	[ITE_Nombre] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]


CREATE TABLE [#tmpOrdenes] (
	[ITE_ID] [int] NULL ,
	[ITE_Nombre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TipoProceso] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Requerida] [int] NULL ,
	[Ordenada] [int] NULL ,
	[Producto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Numero] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Terminal] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OrdenCompra] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Recibido] [datetime] NULL ,
	[Entrega] [datetime] NULL ,
	[Interna] [datetime] NULL ,
	[Nombre] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Aprobacion] [bit] NULL CONSTRAINT [DF_tblOrdenes_Aprobacion] DEFAULT (0),
	[Observaciones] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Otras] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Unitario] [decimal](18, 2) NULL ,
	[Total] [decimal](18, 2) NULL ,
	[Dolares] [bit] NULL CONSTRAINT [DF_tblOrdenes_Dolares] DEFAULT (0),
	[FAC_Id] [int] NULL 
) ON [PRIMARY]


CREATE TABLE [#tmpItemTasks] (
	[ITE_Nombre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ITS_Status] [tinyint] NULL ,
	[ITS_DTStart] [datetime] NULL ,
	[ITS_DTStop] [datetime] NULL ,
	[Nombre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

SET @SQL = 'INSERT INTO #tmpCump ' +
           'SELECT I.ITE_Nombre ' +
           'FROM tblItemTasks I ' +
	   'INNER JOIN tblTareas T ON I.TAS_Id = T.[Id] ' + 
	   'INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre ' +
           'WHERE T.Nombre = ''' + @TASK + ''' AND ITS_Status IS NOT NULL ' +
           'AND ITS_Status <> 9 AND ITS_DTStop <= CONVERT(VARCHAR(10),' + @TYPE + ',101) + '' 23:59:59.99'' ' + 
	   'AND (' + @TYPE + ' >= ''' + @FROM + ''' AND ' + @TYPE + ' <= ''' + @TO + ''') ' +
	   'AND I.ITE_NOMBRE NOT IN (SELECT ITE_NOMBRE FROM tblScrap) '
	
IF (@CLIENT <> '') BEGIN
	SET @SQL = @SQL + ' AND SUBSTRING(I.ITE_Nombre,4,3) IN (' + @CLIENT + ') '
END


EXEC(@SQL)


SET @SQL = 'INSERT INTO #tmpOrdenes SELECT ITE_ID,ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,' + 
           'Numero,Terminal,OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,' + 
           'Otras,Unitario,Total,Dolares,FAC_Id ' +
	       'FROM tblOrdenes O  ' +
	       'WHERE (' + @TYPE + ' >= ''' + @FROM + ''' AND ' + @TYPE + ' <= ''' + @TO + ''') ' +
	       'AND O.ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpCump) ' + 
           'AND O.ITE_Nombre NOT IN (SELECT ITE_Nombre FROM tblScrap) '

IF (@CLIENT <> '') BEGIN
	SET @SQL = @SQL + ' AND SUBSTRING(O.ITE_Nombre,4,3) IN (' + @CLIENT + ') '
END

SET @SQL = @SQL + ' ORDER BY O.ITE_Nombre'

EXEC(@SQL)

SET @SQL = 'INSERT INTO #tmpItemTasks SELECT IT.ITE_Nombre, IT.ITS_Status, IT.ITS_DTStart, IT.ITS_DTStop, T.Nombre ' +
	   'FROM tblItemTasks IT ' +
       'INNER JOIN tblTareas T ON T.Id = IT.Tas_Id ' +
	   'WHERE T.Nombre IN (''Calidad'', ''VentasFinal'')  ' +
	   'AND ITE_NOMBRE IN (SELECT ITE_NOMBRE FROM #tmpOrdenes)'

EXEC(@SQL)

SELECT O.*, IT.ITS_DTStop AS Calidad, IT2.ITS_DTStop AS VentasFinal   
FROM #tmpOrdenes O
LEFT OUTER JOIN #tmpItemTasks IT ON O.ITE_Nombre = IT.ITE_Nombre AND IT.Nombre = 'Calidad'
LEFT OUTER JOIN #tmpItemTasks IT2 ON O.ITE_Nombre = IT2.ITE_Nombre AND IT2.Nombre = 'VentasFinal'

GO
