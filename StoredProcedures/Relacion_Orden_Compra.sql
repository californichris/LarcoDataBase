USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Relacion_Orden_Compra]    Script Date: 09/06/2012 22:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**

Le agregue el parametro @WWHERE para que en la pantalla se pueda 
filtrar por fecha de recibido este cambio lo pidio 
Daria el 18 de abril del 2011
**/
ALTER        PROCEDURE [dbo].[Relacion_Orden_Compra]
	@CLIENTE AS VARCHAR(8000),
	@ORDEN AS VARCHAR(8000),
	@COMPRA AS VARCHAR(50),
	@PARTE AS VARCHAR(50),
	@PRODUCTO AS VARCHAR(50),
	@FIRST AS BIT,
    @YEAR AS VARCHAR(2),
	@WHERE AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)
DECLARE @SQLWHERE AS VARCHAR(8000)
-- ***************************************************************************************
-- ********************* Delete and create temporary tables ******************************
-- ***************************************************************************************
if exists (select * from tempdb..sysobjects where id = object_id(N'tempdb..#tmpOrdenes'))
drop table #tmpOrdenes

CREATE TABLE [#tmpOrdenCompra] (
	[Orden] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Recibido] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OrdenCompra] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cantidad] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cliente] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Descripcion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Numero] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Entrega] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Interna] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Tarea] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Stock] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Programado] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Total] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Dolares] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

PRINT('Temporary Table created.')
-- ***************************************************************************************
-- ****** Insert data into temporary table #tmpEmpData From .csv File ********************
-- ***************************************************************************************
SET @SQL = 'INSERT INTO #tmpOrdenCompra ' +
           'SELECT RIGHT(O.ITE_Nombre,LEN(O.ITE_Nombre) - 3) AS Orden,CONVERT(VARCHAR(10),O.Recibido,101) AS Recibido,' +
	   'O.OrdenCompra,O.Ordenada As Cantidad, O.Requerida As Cliente, ' +
	   'O.Producto As Descripcion,O.Numero,CONVERT(VARCHAR(10),O.Entrega,101) AS Entrega,CONVERT(VARCHAR(10),O.Interna,101) AS Interna, ' +
	   'T.Nombre AS Tarea,CASE WHEN I.ITS_Status = 0 THEN ''Listo'' ' +
	   'WHEN I.ITS_Status = 1 THEN ''Activo'' ' +
	   'WHEN I.ITS_Status = 2 THEN ''Terminado'' END AS Status,'''','''','''', ' +
	   'O.Total,O.Dolares ' +	
	   'FROM tblOrdenes O ' +
	   'INNER JOIN tblItemTasks I ON O.ITE_ID = I.ITE_ID AND ITS_DTStart IS NOT NULL AND ITS_DTStop IS NULL ' +
	   'INNER JOIN tblTareas T ON T.[ID] = I.TAS_ID ' +
	   'LEFT OUTER JOIN tblEmpleados E ON I.[USE_Login] = E.[ID] '


    SET @SQLWHERE = ' I.ITS_Status <> 9 AND LEFT(O.ITE_Nombre,2) = ''' + @YEAR + ''' '
    IF (@CLIENTE <> 'Todos')
    BEGIN
        if (@SQLWHERE <> '') 
		SET @SQLWHERE = @SQLWHERE + ' AND '

        SET @SQLWHERE = @SQLWHERE + ' SUBSTRING(O.ITE_Nombre,4,3) IN (''' + REPLACE(@CLIENTE,',',''',''') + ''') '

    END

    IF (@ORDEN <> 'Todos')
    BEGIN
        if (@SQLWHERE <> '') 
		SET @SQLWHERE = @SQLWHERE + ' AND '

        SET @SQLWHERE = @SQLWHERE + ' SUBSTRING(O.ITE_Nombre,8,3) IN (''' + REPLACE(@ORDEN,',',''',''') + ''') '

    END

    IF (@COMPRA <> 'Todos')
    BEGIN
        if (@SQLWHERE <> '') 
		SET @SQLWHERE = @SQLWHERE + ' AND '

        SET @SQLWHERE = @SQLWHERE + 'O.OrdenCompra = ''' + @COMPRA + ''''
    END

    IF (@PARTE <> 'Todos')
    BEGIN
        IF (@SQLWHERE <> '') 
		SET @SQLWHERE = @SQLWHERE + ' AND '

        IF CHARINDEX('*', @PARTE) = 0 BEGIN
          SET @SQLWHERE = @SQLWHERE + 'O.Numero = ''' + @PARTE + ''''
        END
        ELSE BEGIN
          SET @SQLWHERE = @SQLWHERE + 'O.Numero LIKE ''' + REPLACE(@PARTE,'*','%') + ''''
        END        

    END

    IF (@PRODUCTO <> 'Todos')
    BEGIN
        IF (@SQLWHERE <> '') 
		SET @SQLWHERE = @SQLWHERE + ' AND '

        IF CHARINDEX('*', @PRODUCTO) = 0 BEGIN
          SET @SQLWHERE = @SQLWHERE + 'O.Producto = ''' + @PRODUCTO + ''''
        END
        ELSE BEGIN
          SET @SQLWHERE = @SQLWHERE + 'O.Producto LIKE ''' + REPLACE(@PRODUCTO,'*','%') + ''''
        END        
    END

    IF (@FIRST = 0) BEGIN
	    IF (@WHERE <> '')
	    BEGIN
	        if (@SQLWHERE <> '') 
			SET @SQLWHERE = @SQLWHERE + ' AND '
	
	        SET @SQLWHERE = @SQLWHERE + @WHERE
	    END
    END

    IF (@SQLWHERE <> '')
    BEGIN
	 SET @SQL = @SQL + ' WHERE ' + @SQLWHERE
    END

PRINT(@SQL)
EXEC(@SQL)

-- INSERT LOS QUE ESTAN TERMINADOS EN VENTAS FINAL
IF (@FIRST = 0) BEGIN

SET @SQL = 'INSERT INTO #tmpOrdenCompra ' +
           'SELECT RIGHT(O.ITE_Nombre,LEN(O.ITE_Nombre) - 3) AS Orden,CONVERT(VARCHAR(10),O.Recibido,101) AS Recibido,' +
	   'O.OrdenCompra,O.Ordenada As Cantidad, O.Requerida As Cliente, ' +
     	   'O.Producto As Descripcion,O.Numero,CONVERT(VARCHAR(10),O.Entrega,101) AS Entrega,CONVERT(VARCHAR(10),O.Interna,101) AS Interna, ' +
	   'T.Nombre AS Tarea,CASE WHEN I.ITS_Status = 0 THEN ''Listo'' ' +
	   'WHEN I.ITS_Status = 1 THEN ''Activo'' ' +
	   'WHEN I.ITS_Status = 2 THEN ''Terminado'' END AS Status,'''','''','''', ' +
	   'O.Total,O.Dolares ' +	
	   'FROM tblOrdenes O ' +
	   'INNER JOIN tblItemTasks I ON O.ITE_ID = I.ITE_ID AND ITS_DTStart IS NOT NULL AND ITS_DTStop IS NOT NULL ' +
	   'INNER JOIN tblTareas T ON T.[ID] = I.TAS_ID AND T.Nombre = ''VentasFinal'' ' +
	   'LEFT OUTER JOIN tblEmpleados E ON I.[USE_Login] = E.[ID] '


    if (@SQLWHERE <> '')
	 SET @SQL = @SQL + ' WHERE ' + @SQLWHERE

PRINT(@SQL)
EXEC(@SQL)

--- ******************************************************************

SET @SQL = 'INSERT INTO #tmpOrdenCompra ' +
           'SELECT RIGHT(O.ITE_Nombre,LEN(O.ITE_Nombre) - 3) AS Orden,CONVERT(VARCHAR(10),O.Recibido,101) AS Recibido,' +
	   'O.OrdenCompra,O.Ordenada As Cantidad, O.Requerida As Cliente, ' +
	   'O.Producto As Descripcion,O.Numero,CONVERT(VARCHAR(10),O.Entrega,101) AS Entrega,CONVERT(VARCHAR(10),O.Interna,101) AS Interna, ' +
	   ' '''' AS Tarea,'''' Status,FileName,Stock,Programado, ' +
	   'O.Total,O.Dolares ' +	
	   'FROM tblStockOrdenes O '

    SET @SQLWHERE = ' LEFT(O.ITE_Nombre,2) = ''' + @YEAR + ''' '
    IF (@CLIENTE <> 'Todos')
    BEGIN
        if (@SQLWHERE <> '') 
		SET @SQLWHERE = @SQLWHERE + ' AND '

        SET @SQLWHERE = @SQLWHERE + ' SUBSTRING(O.ITE_Nombre,4,3) IN (''' + REPLACE(@CLIENTE,',',''',''') + ''') '

    END

    IF (@ORDEN <> 'Todos')
    BEGIN
        if (@SQLWHERE <> '') 
		SET @SQLWHERE = @SQLWHERE + ' AND '

        SET @SQLWHERE = @SQLWHERE + ' SUBSTRING(O.ITE_Nombre,8,3) IN (''' + REPLACE(@ORDEN,',',''',''') + ''') '

    END

    IF (@COMPRA <> 'Todos')
    BEGIN
        if (@SQLWHERE <> '') 
		SET @SQLWHERE = @SQLWHERE + ' AND '

        SET @SQLWHERE = @SQLWHERE + 'O.OrdenCompra = ''' + @COMPRA + ''''
    END

    IF (@PARTE <> 'Todos')
    BEGIN
        if (@SQLWHERE <> '') 
		SET @SQLWHERE = @SQLWHERE + ' AND '

        IF CHARINDEX('*', @PARTE) = 0 BEGIN
          SET @SQLWHERE = @SQLWHERE + 'O.Numero = ''' + @PARTE + ''''
        END
        ELSE BEGIN
          SET @SQLWHERE = @SQLWHERE + 'O.Numero LIKE ''' + REPLACE(@PARTE,'*','%') + ''''
        END        
    END
    
    IF (@PRODUCTO <> 'Todos')
    BEGIN
        IF (@SQLWHERE <> '') 
		SET @SQLWHERE = @SQLWHERE + ' AND '

        IF CHARINDEX('*', @PRODUCTO) = 0 BEGIN
          SET @SQLWHERE = @SQLWHERE + 'O.Producto = ''' + @PRODUCTO + ''''
        END
        ELSE BEGIN
          SET @SQLWHERE = @SQLWHERE + 'O.Producto LIKE ''' + REPLACE(@PRODUCTO,'*','%') + ''''
        END        
    END    

IF (@SQLWHERE <> '') 
	SET @SQLWHERE = @SQLWHERE + ' AND '

SET @SQLWHERE = @SQLWHERE + ' Programado = 0 '

IF (@WHERE <> '') 
	SET @SQLWHERE = @SQLWHERE + 'AND ' + @WHERE


SET @SQL = @SQL + ' WHERE ' + @SQLWHERE

PRINT(@SQL)
EXEC(@SQL)


END -- Termina IF (@FIRST = 0)


SELECT * FROM #tmpOrdenCompra ORDER BY Orden

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
