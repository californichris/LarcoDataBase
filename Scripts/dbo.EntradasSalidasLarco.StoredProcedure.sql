USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--exec EntradasSalidasAlmacen 'Entradas','12/11/2007','12/11/2007 23:59:59.99',0,''


CREATE         PROCEDURE [dbo].[EntradasSalidasLarco]
    @TYPE AS VARCHAR(100),
    @FROM AS VARCHAR(100),
    @TO AS VARCHAR(100),
    @DLLS AS BIT,
    @WHERE AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)

IF (@TYPE = 'Entradas') BEGIN
	SET @SQL = 'SELECT CONVERT(VARCHAR(10),E.ENT_Fecha,101) AS [FechaEntrada], M.MAT_Numero AS [IDMaterial],
		M.MAT_Fraccion AS [FraccionAran.], ED.ED_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], ED.ED_Costo AS [PrecioUnitario],
		ED.ED_Costo * ED.ED_Cantidad AS [Total], M.MAT_Cantidad AS [SaldoAlmacen],
		P.PROV_Nombre AS [Proveedor], E.ENT_OrdenCompra AS [OrdenCompra],
		E.ENT_Factura AS [Factura], E.ENT_Nacional AS [TipoEntrada],
		E.ENT_TipoImp AS [TipoImp.], PA.PAIS_Nombre AS [PaisOrigen], E.ENT_Pedimento AS [Pedimento]
		FROM tblEntradasDetalle ED
		INNER JOIN tblEntradas E ON ED.ENT_ID = E.ENT_ID
		LEFT OUTER JOIN tblMateriales M ON ED.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblPaises PA ON E.ENT_PaisOrigen = PA.PAIS_ID
		LEFT OUTER JOIN tblProvedores P ON E.PROV_ID = P.PROV_ID
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID '

	SET @SQL = @SQL + ' WHERE (E.ENT_Fecha >= ''' + @FROM + ''' AND E.ENT_Fecha <= ''' + @TO + ''') '
	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE)
END
ELSE IF (@TYPE = 'Salidas') BEGIN
	SET @SQL = 'SELECT CONVERT(VARCHAR(10),SL.SL_Fecha,101) AS [FechaSalida],
		   P.PT_Fraccion AS [FraccionAranProd.], P.PT_Descripcion AS [DescripcionProd],
		   S.SAL_Orden AS [OrdenTrabajo], M.MAT_Numero AS [IDMaterial],
		   M.MAT_Descripcion AS [DescripcionMat], M.MAT_Fraccion AS [FraccionAranMat.],
		   SD.SD_Cantidad AS [CantidadOrden], U.UNI_Medida AS [UnidadMedida],
		   SD.SL_Cantidad AS [Descargado], (SD.SD_Cantidad - SD.SL_Cantidad) AS [Desperdicio],
		   SD.SL_Pedimento AS [Pedimento] 
		   FROM tblSalidasDetalle SD
		   INNER JOIN tblSalidas S ON SD.SAL_ID = S.SAL_ID
		   INNER JOIN tblSalidasLarco SL ON S.SAL_Orden = SL.SL_Orden
		   LEFT OUTER JOIN tblMateriales M ON SD.MAT_ID = M.MAT_ID
		   LEFT OUTER JOIN tblProductosTerminadosDetalle PD ON PD.MAT_ID = M.MAT_ID
		   LEFT OUTER JOIN tblProductosTerminados P ON P.PT_ID = PD.PT_ID
		   LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID
		   LEFT OUTER JOIN tblUnidadesMedida U ON U.UNI_ID = M.MAT_Unidad '

	SET @SQL = @SQL + ' WHERE (SL.SL_Fecha >= ''' + @FROM + ''' AND SL.SL_Fecha <= ''' + @TO + ''') '
	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE)
END
ELSE BEGIN -- Entradas vs Salidas
	SET @SQL = 'SELECT ED.ED_ID AS [Id], CONVERT(VARCHAR(10),E.ENT_Fecha,101) AS [FechaEntrada], M.MAT_Numero AS [IDMaterial],
		M.MAT_Fraccion AS [FraccionAran.], ED.ED_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], ED.ED_Costo AS [PrecioUnitario],
		ED.ED_Costo * ED.ED_Cantidad AS [Total],
		P.PROV_Nombre AS [Proveedor], E.ENT_OrdenCompra AS [OrdenCompra],
		E.ENT_Factura AS [Factura], E.ENT_Nacional AS [TipoEntrada],
		E.ENT_TipoImp AS [TipoImp.], PA.PAIS_Nombre AS [PaisOrigen],E.ENT_Pedimento AS [Pedimento],
		ES.ED_Cantidad AS [Cant.TomadaDeEntrada], CONVERT(VARCHAR(10),SL.SL_Fecha,101) AS [FechaSalida], S.SAL_Orden AS [OrdenTrabajo],
		SD.SD_Cantidad AS [CantidadOrden], U.UNI_Medida AS [UnidadMedida],
		SD.SL_Cantidad AS [Descargado], (SD.SD_Cantidad - SD.SL_Cantidad) AS [Desperdicio],
		SD.SL_Pedimento AS [Pedimento] 
		FROM tblEntradasDetalle ED
		INNER JOIN tblEntradas E ON ED.ENT_ID = E.ENT_ID
		LEFT OUTER JOIN tblEntradasSalidas ES ON ED.ED_ID = ES.ED_ID
		LEFT OUTER JOIN tblSalidasDetalle SD ON ES.SD_ID = SD.SD_ID AND SL_CANTIDAD IS NOT NULL
		LEFT OUTER JOIN tblSalidas S ON SD.SAL_ID = S.SAL_ID
		LEFT OUTER JOIN tblSalidasLarco SL ON S.SAL_Orden = SL.SL_Orden
		LEFT OUTER JOIN tblMateriales M ON ED.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblProvedores P ON E.PROV_ID = P.PROV_ID
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID
		LEFT OUTER JOIN tblPaises PA ON E.ENT_PaisOrigen = PA.Pais_ID
		LEFT OUTER JOIN tblUnidadesMedida U ON U.UNI_ID = M.MAT_Unidad '


	SET @SQL = @SQL + ' WHERE (E.ENT_Fecha >= ''' + @FROM + ''' AND E.ENT_Fecha <= ''' + @TO + ''') '
	
	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE + ' ORDER BY M.MAT_Numero, ED.ED_ID, E.ENT_Fecha, CONVERT(VARCHAR(10),SL.SL_Fecha,101) DESC')
END





GO
