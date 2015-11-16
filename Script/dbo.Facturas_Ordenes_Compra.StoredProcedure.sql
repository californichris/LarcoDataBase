USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Facturas_Ordenes_Compra]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facturas_Ordenes_Compra]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Facturas_Ordenes_Compra]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facturas_Ordenes_Compra]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- Facturas_Ordenes_Compra ''07'',''007'',''07-007-007-02,07-007-004-02,07-007-007-04,07-007-007-05,07-007-007-12,07-007-007-14,07-007-007-19,07-007-007-01''
CREATE       PROCEDURE [dbo].[Facturas_Ordenes_Compra]
    @ANIO AS VARCHAR(2),
    @CLIENTE AS VARCHAR(3),
    @ORDENES AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id = OBJECT_ID(N''tempdb..#tmpOrdenesCompra''))
DROP TABLE #tmpOrdenesCompra

CREATE TABLE [#tmpOrdenesCompra] (
	[OrdenCompra] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]


SET @SQL = ''INSERT INTO #tmpOrdenesCompra '' +
	   ''SELECT DISTINCT SUBSTRING(O.ITE_NOMBRE,8,3) AS OrdenCompra  '' +
	   ''FROM tblItemTasks I '' +
	   ''INNER JOIN tblTareas T ON I.TAS_ID = T.ID '' +
	   ''INNER JOIN tblOrdenes O ON O.ITE_Nombre = I.ITE_Nombre '' +
	   ''WHERE T.Nombre = ''''VentasFinal'''' AND I.ITS_STATUS = 2 AND LEFT(O.ITE_Nombre,2) = '' + @ANIO + '' '' +
	   ''AND O.FAC_Id IS NULL AND SUBSTRING(O.ITE_NOMBRE,5,2) = '' + RIGHT(@CLIENTE,2) + '' ''

IF('''' <> @ORDENES)BEGIN
	SET @SQL = @SQL + '' AND O.ITE_Nombre NOT IN ('''''' + REPLACE(@ORDENES,'','','''''','''''') + '''''') '' 
END

PRINT(@SQL)
EXEC(@SQL)

SET @SQL = ''INSERT INTO #tmpOrdenesCompra '' +
	   ''SELECT DISTINCT SUBSTRING(O.ITE_NOMBRE,8,3) AS OrdenCompra  '' +
	   ''FROM tblStockOrdenes O '' +
	   ''WHERE LEFT(O.ITE_Nombre,2) = '' + @ANIO + '' '' +
	   ''AND O.FAC_Id IS NULL AND O.Programado = 0 AND SUBSTRING(O.ITE_NOMBRE,5,2) = '' + RIGHT(@CLIENTE,2) + '' ''

IF('''' <> @ORDENES)BEGIN
	SET @SQL = @SQL + '' AND O.ITE_Nombre NOT IN ('''''' + REPLACE(@ORDENES,'','','''''','''''') + '''''') '' 
END

PRINT(@SQL)
EXEC(@SQL)

SELECT DISTINCT OrdenCompra FROM #tmpOrdenesCompra ORDER BY OrdenCompra





' 
END
GO
