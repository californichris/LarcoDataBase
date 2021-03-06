USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--exec SalidasLarco 7,8,'SSSSSSS',2


CREATE    PROCEDURE [dbo].[SalidasLarco]
    @SD_ID 	  AS INT,
    @SL_CANTIDAD  AS INT,
    @SL_PEDIMENTO AS VARCHAR(50),
    @SL_DESP      AS INT
AS

DECLARE @MAT_ID           INT,
	@MAT_NUMERO       VARCHAR(50),
	@MAT_TIPO         INT,
	@ENT_ID	          INT,
	@ENT_Desp         INT,
	@MAT_ID_Desp      INT,
	@MAT_UltimoCosto  DECIMAL(18,2),
	@ED_ID_Desp	  INT

IF (@SL_DESP > 0) BEGIN
	--SELECT @MAT_ID = MAT_ID FROM tblSalidasDetalle WHERE SD_ID = @SD_ID
	SELECT @MAT_ID = SD.MAT_ID, @ENT_ID = E.ENT_ID 
	FROM tblSalidas S
	INNER JOIN tblSalidasDetalle SD ON S.SAL_ID = SD.SAL_ID
	INNER JOIN tblEntradasSalidas ES ON ES.SD_ID = SD.SD_ID
	INNER JOIN tblEntradasDetalle ED ON ES.ED_ID = ED.ED_ID
	INNER JOIN tblEntradas E ON E.ENT_ID = ED.ENT_ID
	WHERE SD.SD_ID = @SD_ID	

	SELECT @MAT_NUMERO = MAT_NUMERO, @MAT_UltimoCosto = MAT_UltimoCosto FROM tblMateriales WHERE MAT_ID = @MAT_ID

	--SELECT * FROM tblMateriales WHERE MAT_ID = 3
	
	-- SI EL MATERIAL DE DESPERDICIO NO EXISTE AGREGARLO
	IF NOT EXISTS(SELECT MAT_ID FROM tblMateriales WHERE MAT_NUMERO = 'D' + @MAT_NUMERO) BEGIN
		-- SI EL TIPO DE MATERIAL DESPERDICIO NO EXISTE AGREGARLO
		IF NOT EXISTS(SELECT TIP_ID FROM tblTiposMaterial WHERE TIP_Descripcion = 'Desperdicio') BEGIN
			INSERT INTO tblTiposMaterial(TIP_Tipo, TIP_Descripcion) SELECT 'Directo','Desperdicio'
		END

		SELECT @MAT_TIPO = TIP_ID FROM tblTiposMaterial WHERE TIP_Descripcion = 'Desperdicio'
		
		INSERT INTO tblMateriales(MAT_Fraccion,MAT_Numero, MAT_Descripcion, 
		MAT_Unidad, MAT_Tipo, MAT_Cantidad, MAT_costo, MAT_UltimoCosto, MAT_CostoPromedio,
		MAT_Minimo, MAT_Maximo, MAT_Stock, MAT_UltimoProvedor,MAT_Usuario, MAT_Fecha,
		MAT_Ubicacion, MAT_Total, MAT_ProvNumero, MAT_Kilos, MAT_Densidad)
		SELECT MAT_Fraccion,'D' + MAT_Numero, MAT_Descripcion + ' - Desperdicio', 
		MAT_Unidad, @MAT_TIPO, 0.0, 0.0, 0.0, 0.0,
		0.0, 0.0, 0.0, MAT_UltimoProvedor, MAT_Usuario, GETDATE(),
		MAT_Ubicacion, 0.0, MAT_ProvNumero, MAT_Kilos, MAT_Densidad
		FROM tblMateriales WHERE MAT_ID = @MAT_ID
	END
	SELECT @MAT_ID_Desp = MAT_ID FROM tblMateriales WHERE MAT_NUMERO = 'D' + @MAT_NUMERO 


	-- CHECAR SI YA SE HA AGREGADO DESPERDICIO A ESTA ORDEN 
	IF EXISTS(SELECT ENT_ID FROM tblEntradas WHERE ENT_Desp = @ENT_ID) BEGIN
		SELECT @ENT_Desp = ENT_ID FROM tblEntradas WHERE ENT_Desp = @ENT_ID	
	END
	ELSE BEGIN -- SINO SE HA AGREGADO DESPERDICIO A ESTA ORDEN AGREGAR LA ENTRADA
		INSERT INTO tblEntradas(ENT_Pedimento, ENT_ClavePedimento,
		ENT_Fecha, ENT_PaisOrigen, ENT_Nacional, ENT_TipoImp,
		ENT_Factura, ENT_OrdenCompra, PROV_ID, ENT_IVA, USE_ID,
		ENT_Dolares, ENT_TipoCambio, ENT_Desp)
		SELECT ENT_Pedimento, 'Desperdicio', CONVERT(VARCHAR(10), GETDATE(), 101),
		ENT_PaisOrigen, ENT_Nacional, ENT_TipoImp,
		ENT_Factura, ENT_OrdenCompra, PROV_ID, ENT_IVA, USE_ID,
		ENT_Dolares, ENT_TipoCambio, @ENT_ID
		FROM tblEntradas WHERE ENT_ID = @ENT_ID

		SELECT @ENT_Desp = ENT_ID FROM tblEntradas WHERE ENT_Desp = @ENT_ID			
	END

	-- AGREGAR LA ENTRADA EN tblEntradasDetalle
	INSERT INTO tblEntradasDetalle(ENT_ID, MAT_ID, ED_Cantidad, ED_Costo, ED_Restante, SL_Desp)
	SELECT @ENT_Desp, @MAT_ID_Desp, @SL_DESP, @MAT_UltimoCosto, @SL_DESP, @SD_ID

	
	SELECT TOP 1 @ED_ID_Desp = ED_ID FROM tblEntradasDetalle WHERE SL_Desp = @SD_ID

	UPDATE tblSalidasDetalle SET SL_Cantidad = @SL_CANTIDAD, 
	SL_Pedimento = @SL_PEDIMENTO, ED_ID = @ED_ID_Desp, IS_SL = 1
	WHERE SD_ID = @SD_ID
END
ELSE BEGIN
	UPDATE tblSalidasDetalle SET SL_Cantidad = @SL_CANTIDAD, 
	SL_Pedimento = @SL_PEDIMENTO, ED_ID = NULL, IS_SL = 1
	WHERE SD_ID = @SD_ID
END

 

-- SELECT * FROM tblSalidasDetalle

-- SELECT *
-- FROM tblSalidas S
-- INNER JOIN tblSalidasDetalle SD ON S.SAL_ID = SD.SAL_ID
-- INNER JOIN tblEntradasSalidas ES ON ES.SD_ID = SD.SD_ID
-- INNER JOIN tblEntradasDetalle ED ON ES.ED_ID = ED.ED_ID
-- INNER JOIN tblEntradas E ON E.ENT_ID = ED.ENT_ID
-- WHERE SAL_ORDEN = '07-062-101-01'
-- 
-- SELECT * FROM tblEntradas WHERE ENT_ID = 2







GO
