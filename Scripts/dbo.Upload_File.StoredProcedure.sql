USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- truncate table tblstockordenes
-- select * from tblempdata order by lastupdate
-- Upload_File 'C:\Chris\Code\Larco\uploadtest.csv','uploadtest.xls','sa','06'
-- select * from tblStockOrdenes where [filename] = 'uploadtest.xls'
-- select * from tblStockOrdenes where [filename] is null
-- delete from tblStockOrdenes where [filename] is null
-- delete from tblStockOrdenes where [filename] = 'uploadtest.xls'

CREATE    PROCEDURE [dbo].[Upload_File]
	@FILENAME AS VARCHAR(1000),
	@FILE AS VARCHAR(50),
	@ADDBY AS VARCHAR(50),
	@ANIO AS VARCHAR(2)
AS

DECLARE @SQL AS VARCHAR(8000)

-- ***************************************************************************************
-- ********************* Delete and create temporary tables ******************************
-- ***************************************************************************************
if exists (select * from tempdb..sysobjects where id = object_id(N'tempdb..#tmpOrdenes'))
drop table #tmpOrdenes

CREATE TABLE [#tmpOrdenes] (
	[ITE_Nombre] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TipoProceso] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Requerida] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Ordenada] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Producto] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Numero] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Terminal] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OrdenCompra] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Recibido] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Interna] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Entrega] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Nombre] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Aprobacion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Unitario] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Total] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Dolares] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Observaciones] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Otras] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

if exists (select * from tempdb..sysobjects where id = object_id(N'tempdb..#tmpRejected'))
drop table #tmpRejected

CREATE TABLE [#tmpRejected] (
	[ITE_Nombre] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TipoProceso] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Requerida] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Ordenada] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Producto] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Numero] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Terminal] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OrdenCompra] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Recibido] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Interna] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Entrega] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Nombre] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Aprobacion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Unitario] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Total] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Dolares] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Observaciones] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Otras] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Razon] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

PRINT('Temporary Tables created.')

-- ***************************************************************************************
-- ****** Insert data into temporary table #tmpEmpData From .csv File ********************
-- ***************************************************************************************
SET @SQL = 'BULK INSERT #tmpOrdenes FROM ''' + @FILENAME + '''
WITH ( FIRSTROW = 2, FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'')'

EXEC(@SQL)

PRINT('Bulk insert done.')

-- -- ***************************************************************************************
-- -- ********************** Remove the character " from fields *****************************
-- -- ***************************************************************************************
UPDATE #tmpOrdenes SET ITE_Nombre = REPLACE(ITE_Nombre,'"',''),
TipoProceso = REPLACE(TipoProceso,'"',''),
Requerida = REPLACE(Requerida,'"',''),
Ordenada = REPLACE(Ordenada,'"',''),
Producto = REPLACE(Producto,'"',''),
Numero = REPLACE(Numero,'"',''),
Terminal = REPLACE(Terminal,'"',''),
OrdenCompra = REPLACE(OrdenCompra,'"',''),
Recibido = REPLACE(Recibido,'"',''),
Interna = REPLACE(Interna,'"',''),
Entrega = REPLACE(Entrega,'"',''),
Nombre = REPLACE(Nombre,'"',''),
Aprobacion = REPLACE(Aprobacion,'"',''),
Unitario = REPLACE(Unitario,'"',''),
Total = REPLACE(Total,'"',''),
Dolares = REPLACE(Dolares,'"',''),
Observaciones = REPLACE(Observaciones,'"',''),
Otras = REPLACE(Otras,'"','')

-- select * from #tmpOrdenes

UPDATE #tmpOrdenes SET Observaciones = NULL WHERE Observaciones = ' '
UPDATE #tmpOrdenes SET Otras = NULL WHERE Otras = ' '

PRINT('Replace done.')

-- *********************************************************************************************
-- Validate data
-- *********************************************************************************************

INSERT INTO #tmpRejected SELECT *,'Orden ya existente.' 
FROM #tmpOrdenes WHERE ITE_Nombre IN (SELECT RIGHT(ITE_Nombre,10) FROM tblOrdenes)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'El cliente no existe.' 
FROM #tmpOrdenes WHERE LEFT(ITE_Nombre,3) NOT IN (SELECT Clave FROM tblClientes)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La longitud de la orden debe de ser de 10 caracteres.' 
FROM #tmpOrdenes WHERE LEN( RTRIM(ITE_Nombre) ) > 10
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La orden no esta en el formato correcto. xxx-xxx-xx.' 
FROM #tmpOrdenes WHERE SUBSTRING(ITE_Nombre,4,1) <> '-'
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La orden no esta en el formato correcto. xxx-xxx-xx.' 
FROM #tmpOrdenes WHERE SUBSTRING(ITE_Nombre,8,1) <> '-'
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La longitud del Tipo de Proceso debe de ser de 50 caracteres.' 
FROM #tmpOrdenes WHERE LEN( RTRIM(TipoProceso) ) > 50
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La cantidad Requerida debe de ser numerica.' 
FROM #tmpOrdenes WHERE ISNUMERIC(Requerida) = 0
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La cantidad Ordenada debe de ser numerica.' 
FROM #tmpOrdenes WHERE ISNUMERIC(Ordenada) = 0
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'No es una Descripcion valida.' 
FROM #tmpOrdenes WHERE UPPER(Producto) NOT IN (SELECT UPPER(Nombre) FROM tblProductos)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La longitud de la Descripcion debe de ser de 50 caracteres.' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Producto) ) > 50
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La longitud del Numero debe de ser de 50 caracteres.' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Numero) ) > 50
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La longitud del Terminal debe de ser de 50 caracteres.' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Terminal) ) > 50
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La longitud de la Orden de Compra debe de ser de 50 caracteres.' 
FROM #tmpOrdenes WHERE LEN( RTRIM(OrdenCompra) ) > 50
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La fecha interna no es un tipo de fecha valido.' 
FROM #tmpOrdenes WHERE ISDATE(Interna) = 0
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La fecha de Entrega no es un tipo de fecha valido.' 
FROM #tmpOrdenes WHERE ISDATE(Entrega) = 0
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'No es un Nombre d empleado valido.' 
FROM #tmpOrdenes WHERE UPPER(Nombre) NOT IN (SELECT UPPER(Nombre) FROM tblEmpleados)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)


INSERT INTO #tmpRejected SELECT *,'La longitud del Nombre debe de ser de 150 caracteres.' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Nombre) ) > 150
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La Aprobacion debe de ser 1 o 0.' 
FROM #tmpOrdenes WHERE Aprobacion NOT IN (0,1)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La longitud de las Observaciones debe de ser de 1000 caracteres.' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Observaciones) ) > 1000
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La longitud de otra descripcion debe de ser de 500 caracteres.' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Otras) ) > 500
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'La el precio unitario debe de ser numerico.' 
FROM #tmpOrdenes WHERE ISNUMERIC(Unitario) = 0
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,'Los Dolares debe de ser 1 o 0.' 
FROM #tmpOrdenes WHERE Dolares NOT IN (0,1)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

DELETE FROM #tmpOrdenes WHERE ITE_Nombre IN ( SELECT ITE_Nombre FROM #tmpRejected )

DELETE FROM tblStockOrdenes WHERE FileName = @FILE AND Programado = 0

-- SELECT @ANIO + '-' + ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
-- OrdenCompra,Recibido,Interna,Entrega,Nombre,Aprobacion,Unitario,Total,Dolares,Observaciones,
-- Otras,@FILE,@ADDBY,GETDATE() FROM #tmpOrdenes


INSERT INTO tblStockOrdenes(ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
OrdenCompra,Recibido,Interna,Entrega,Nombre,Aprobacion,Unitario,Total,Dolares,Observaciones,
Otras,FileName,AddBy,AddDate)
SELECT @ANIO + '-' + ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
OrdenCompra,Convert(varchar(10),GETDATE(),101),Interna,Entrega,Nombre,Aprobacion,Unitario,
CAST(Unitario AS DECIMAL(12,2))* CAST(Requerida AS DECIMAL(12,2)),Dolares,Observaciones,
Otras,@FILE,@ADDBY,GETDATE() 
FROM #tmpOrdenes


-- -- ***************************************************************************************
-- -- ************* Delete file from server and drop temporary table ************************


DROP TABLE #tmpOrdenes

-- ***************************************************************************************
SET @SQL = 'master..xp_cmdshell ''del ' + @FILENAME + ''',no_output'
EXEC(@SQL)

PRINT('File deleted.')

SELECT * FROM #tmpRejected ORDER BY ITE_Nombre







GO
