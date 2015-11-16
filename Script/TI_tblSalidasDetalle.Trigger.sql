USE [Larco]
GO
/****** Object:  Trigger [TI_tblSalidasDetalle]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblSalidasDetalle]'))
DROP TRIGGER [dbo].[TI_tblSalidasDetalle]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblSalidasDetalle]'))
EXEC dbo.sp_executesql @statement = N'





CREATE        TRIGGER [dbo].[TI_tblSalidasDetalle] ON [dbo].[tblSalidasDetalle]
FOR INSERT, UPDATE
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE 
	@MAT_ID			INT,
	@SD_CANTIDAD		DECIMAL(18,2),
	@ED_RESTANTE		DECIMAL(18,2),
	@SD_COSTO		DECIMAL(18,2),
	@SD_ID 			INT,
	@ED_ID 			INT,
	@COSTO	                DECIMAL(18,2),
	@TIPO_COSTEO            VARCHAR(50),
	@EXIT			BIT

	SELECT @SD_ID = SD_ID, @MAT_ID = I.MAT_ID, @SD_CANTIDAD = SD_Cantidad  
	FROM INSERTED I WHERE IS_SL = 0
	
	SELECT TOP 1 @TIPO_COSTEO = CONF_Inventarios FROM tblInventariosConf
	
	SET @EXIT = 0
	IF(@SD_ID IS NOT NULL) BEGIN 
		IF(@TIPO_COSTEO = ''PROMEDIO'') BEGIN
			--ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
			--INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a PROMEDIO''
			
			/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
			DECLARE Salidas_Promedio CURSOR FOR
			
			SELECT D.ED_ID,M.MAT_CostoPromedio, D.ED_Restante FROM tblEntradasDetalle D
			INNER JOIN tblEntradas E ON D.ENT_ID = E.ENT_ID
			INNER JOIN tblMateriales M ON D.MAT_ID = M.MAT_ID
			WHERE D.MAT_ID = @MAT_ID AND D.ED_Restante > 0
			ORDER BY E.ENT_FECHA ASC, D.ED_ID ASC
			
			/*OPEN CURSOR*/
			OPEN Salidas_Promedio
			/*GET FIRST RECORD INTO VARIABLE*/
			FETCH NEXT FROM Salidas_Promedio INTO @ED_ID, @COSTO, @ED_RESTANTE
			WHILE @@FETCH_STATUS = 0 AND @EXIT = 0/*do while not end of cursor*/
			BEGIN
			   IF(@ED_RESTANTE >= @SD_CANTIDAD) BEGIN
				UPDATE tblEntradasDetalle SET ED_Restante = @ED_RESTANTE - @SD_CANTIDAD WHERE ED_ID = @ED_ID
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @SD_CANTIDAD
			
				SET @EXIT = 1
			        BREAK
			   END
			   ELSE BEGIN
				SET @SD_CANTIDAD = @SD_CANTIDAD - @ED_RESTANTE
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @ED_RESTANTE
			
				UPDATE tblEntradasDetalle SET ED_Restante = 0.0 WHERE ED_ID = @ED_ID
			   END
			   	   
			   FETCH NEXT FROM Salidas_Promedio INTO @ED_ID, @COSTO, @ED_RESTANTE
			END
			
			--DROP TABLE ##TBLEXPORTBU
			/*CLOSE CURSOR*/
			CLOSE Salidas_Promedio
			DEALLOCATE Salidas_Promedio
		
		END
		ELSE IF(@TIPO_COSTEO = ''PEPS'') BEGIN
			--ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
			--INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a PEPS''
			
			/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
			DECLARE Salidas_PEPS CURSOR FOR
			
			SELECT D.ED_ID,D.ED_Costo, D.ED_Restante 
			FROM tblEntradasDetalle D
			INNER JOIN tblEntradas E ON D.ENT_ID = E.ENT_ID
			WHERE D.MAT_ID = @MAT_ID AND D.ED_Restante > 0
			ORDER BY E.ENT_FECHA ASC, D.ED_ID ASC
			
			/*OPEN CURSOR*/
			OPEN Salidas_PEPS
			/*GET FIRST RECORD INTO VARIABLE*/
			FETCH NEXT FROM Salidas_PEPS INTO @ED_ID, @COSTO, @ED_RESTANTE
			WHILE @@FETCH_STATUS = 0 AND @EXIT = 0 /*do while not end of cursor*/
			BEGIN
			   
			   IF(@ED_RESTANTE >= @SD_CANTIDAD) BEGIN
			        --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
				--INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a @ED_RESTANTE >= @SD_CANTIDAD''
				UPDATE tblEntradasDetalle SET ED_Restante = @ED_RESTANTE - @SD_CANTIDAD WHERE ED_ID = @ED_ID
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @SD_CANTIDAD
			
				SET @EXIT = 1
			        BREAK
			   END
			   ELSE BEGIN
			        --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
				--INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a @ED_RESTANTE < @SD_CANTIDAD''
				SET @SD_CANTIDAD = @SD_CANTIDAD - @ED_RESTANTE
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @ED_RESTANTE
			
				UPDATE tblEntradasDetalle SET ED_Restante = 0.0 WHERE ED_ID = @ED_ID
			   END
			
			   FETCH NEXT FROM Salidas_PEPS INTO @ED_ID, @COSTO, @ED_RESTANTE
			END
			
			--DROP TABLE ##TBLEXPORTBU
			/*CLOSE CURSOR*/
			CLOSE Salidas_PEPS
			DEALLOCATE Salidas_PEPS
		
		END
		ELSE IF(@TIPO_COSTEO = ''UEPS'') BEGIN
			--ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
			--INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a UEPS''
			
			/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
			DECLARE Salidas_UEPS CURSOR FOR
			
			SELECT D.ED_ID,D.ED_Costo, D.ED_Restante FROM tblEntradasDetalle D
			INNER JOIN tblEntradas E ON D.ENT_ID = E.ENT_ID
			WHERE D.MAT_ID = @MAT_ID AND D.ED_Restante > 0
			ORDER BY E.ENT_FECHA DESC, D.ED_ID DESC
			
			/*OPEN CURSOR*/
			OPEN Salidas_UEPS
			/*GET FIRST RECORD INTO VARIABLE*/
			FETCH NEXT FROM Salidas_UEPS INTO @ED_ID, @COSTO, @ED_RESTANTE
			WHILE @@FETCH_STATUS = 0 AND @EXIT = 0 /*do while not end of cursor*/
			BEGIN
			   
			   IF(@ED_RESTANTE >= @SD_CANTIDAD) BEGIN
				UPDATE tblEntradasDetalle SET ED_Restante = @ED_RESTANTE - @SD_CANTIDAD WHERE ED_ID = @ED_ID
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @SD_CANTIDAD
			
				SET @EXIT = 1
			        BREAK
			   END
			   ELSE BEGIN
				SET @SD_CANTIDAD = @SD_CANTIDAD - @ED_RESTANTE
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @ED_RESTANTE
			
				UPDATE tblEntradasDetalle SET ED_Restante = 0.0 WHERE ED_ID = @ED_ID
			   END
			
			   FETCH NEXT FROM Salidas_UEPS INTO @ED_ID, @COSTO, @ED_RESTANTE
			END
			
			--DROP TABLE ##TBLEXPORTBU
			/*CLOSE CURSOR*/
			CLOSE Salidas_UEPS
			DEALLOCATE Salidas_UEPS
		
		END
	END
    SET NOCOUNT OFF
END






'
GO
