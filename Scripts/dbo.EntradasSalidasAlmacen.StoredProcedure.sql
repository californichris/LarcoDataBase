USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--exec EntradasSalidasAlmacen 'Entradas','12/11/2007','12/11/2007 23:59:59.99',0,''


CREATE          PROCEDURE [dbo].[EntradasSalidasAlmacen]
    @TYPE AS VARCHAR(100),
    @FROM AS VARCHAR(100),
    @TO AS VARCHAR(100),
    @DLLS AS BIT,
    @WHERE AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)

IF (@TYPE = 'Entradas') BEGIN
	SET @SQL = 'SELECT CONVERT(VARCHAR(10),E.ENT_Fecha,101) AS [FechaEntrada], M.MAT_Numero AS [IDMaterial],
		ED.ED_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], ED.ED_Costo AS [PrecioUnitario],
		ED.ED_Costo * ED.ED_Cantidad AS [Total], M.MAT_Cantidad AS [SaldoAlmacen],
		P.PROV_Nombre AS [Proveedor], E.ENT_OrdenCompra AS [OrdenCompra],
		E.ENT_Factura AS [Factura], E.ENT_Nacional AS [TipoEntrada],
		E.ENT_TipoImp AS [TipoImp.], E.ENT_Pedimento AS [Pedimento]
		FROM tblEntradasDetalle ED
		INNER JOIN tblEntradas E ON ED.ENT_ID = E.ENT_ID
		LEFT OUTER JOIN tblMateriales M ON ED.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblProvedores P ON E.PROV_ID = P.PROV_ID
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID '

	SET @SQL = @SQL + ' WHERE (E.ENT_Fecha >= ''' + @FROM + ''' AND E.ENT_Fecha <= ''' + @TO + ''') '

	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE)

END
ELSE IF (@TYPE = 'Salidas') BEGIN
	SET @SQL = 'SELECT CONVERT(VARCHAR(10),S.SAL_Fecha,101) AS [FechaSalida], M.MAT_Numero AS [IDMaterial],
		SD.SD_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], M.MAT_Cantidad AS [SaldoAlmacen],
		EM.Nombre AS [SolicitadoPor], '''' AS [FechaSalidaLarco], '''' AS [SaldoLarco]
		FROM tblSalidasDetalle SD
		INNER JOIN tblSalidas S ON SD.SAL_ID = S.SAL_ID
		LEFT OUTER JOIN tblMateriales M ON SD.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblEmpleados EM ON EM.[ID] = S.SAL_Solicitado
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID '

	SET @SQL = @SQL + ' WHERE (S.SAL_Fecha >= ''' + @FROM + ''' AND S.SAL_Fecha <= ''' + @TO + ''') '

	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE)

END
ELSE IF (@TYPE = 'Salidas Costos') BEGIN
	SET @SQL = 'SELECT CONVERT(VARCHAR(10),S.SAL_Fecha,101) AS [FechaSalida], M.MAT_Numero AS [IDMaterial],
		SD.SD_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], ES.ES_Costo AS [PrecioUnitario],
		ES.ES_Costo * SD.SD_Cantidad AS [Total], M.MAT_Cantidad AS [SaldoAlmacen],
		EM.Nombre AS [SolicitadoPor], E.ENT_OrdenCompra AS [OrdenCompra],
		E.ENT_Factura AS [Factura], '''' AS [FechaSalidaLarco], '''' AS [SaldoLarco]
		FROM tblSalidasDetalle SD
		INNER JOIN tblSalidas S ON SD.SAL_ID = S.SAL_ID
		INNER JOIN tblEntradasSalidas ES ON SD.SD_ID = ES.SD_ID
		INNER JOIN tblEntradasDetalle ED ON ES.ED_ID = ED.ED_ID
		INNER JOIN tblEntradas E ON ED.ENT_ID = E.ENT_ID
		LEFT OUTER JOIN tblMateriales M ON SD.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblEmpleados EM ON EM.[ID] = S.SAL_Solicitado
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID '

	SET @SQL = @SQL + ' WHERE (S.SAL_Fecha >= ''' + @FROM + ''' AND S.SAL_Fecha <= ''' + @TO + ''') '

	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE)

END
ELSE BEGIN -- Entradas vs Salidas
	SET @SQL = 'SELECT ED.ED_ID AS [Id], CONVERT(VARCHAR(10),E.ENT_Fecha,101) AS [FechaEntrada], M.MAT_Numero AS [IDMaterial],
		ED.ED_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], ED.ED_Costo AS [PrecioUnitario],
		ED.ED_Costo * ED.ED_Cantidad AS [Total],
		P.PROV_Nombre AS [Proveedor], E.ENT_OrdenCompra AS [OrdenCompra],
		E.ENT_Factura AS [Factura], E.ENT_Nacional AS [TipoEntrada],
		E.ENT_TipoImp AS [TipoImp.], E.ENT_Pedimento AS [Pedimento],
		CONVERT(VARCHAR(10),S.SAL_Fecha,101) AS [FechaSalida],
		ES.ED_Cantidad AS [CantidadSalida], ES.ES_Costo AS [PrecioUnitarioSalida], 
		ES.ES_Costo * ES.ED_Cantidad AS [TotalSalida], 
		ED.ED_Restante AS [SaldoAlmacen], ED.ED_Restante * ED.ED_Costo AS [SaldoAlmacenDinero]
		FROM tblEntradasDetalle ED
		INNER JOIN tblEntradas E ON ED.ENT_ID = E.ENT_ID
		LEFT OUTER JOIN tblEntradasSalidas ES ON ED.ED_ID = ES.ED_ID
		LEFT OUTER JOIN tblSalidasDetalle SD ON ES.SD_ID = SD.SD_ID
		LEFT OUTER JOIN tblSalidas S ON SD.SAL_ID = S.SAL_ID
		LEFT OUTER JOIN tblMateriales M ON ED.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblProvedores P ON E.PROV_ID = P.PROV_ID
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID '


	SET @SQL = @SQL + ' WHERE (E.ENT_Fecha >= ''' + @FROM + ''' AND E.ENT_Fecha <= ''' + @TO + ''') '

	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE + ' ORDER BY M.MAT_Numero, E.ENT_Fecha')

END








GO
