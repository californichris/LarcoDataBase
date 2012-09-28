USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Update_Orden]    Script Date: 09/28/2012 16:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Update_Orden 10809,'07-036-009-06','212',10,10,'Anvil','11212','1212','5/4/2007','10/10/2007','5/3/2007','Edgar Lara A',0,'121211112','Anvil',12,120,'Ventas','System','192.168.1.70','12345',0
ALTER         PROCEDURE [dbo].[Update_Orden]
(
	@ITE_ID		INT,
	@ITE_NOMBRE	VARCHAR(50),
	@PROCESO        VARCHAR(50),
	@REQUERIDA	INT,
	@ORDENADA	INT,
	@PRO_NOMBRE	VARCHAR(50),	
	@NUMERO		VARCHAR(50),
	@TERMINAL	VARCHAR(50),
	@ENTREGA	DATETIME,
	@RECIBIDO	DATETIME,
	@INTERNA	DATETIME,
	@NOMBRE		VARCHAR(150),
	@APROBACION	BIT,
	@OBSERVACIONES  VARCHAR(1000),
	@OTRAS		VARCHAR(500),
	@UNITARIO	DECIMAL(18,2),
	@TOTAL		DECIMAL(18,2),
	@TAREA		VARCHAR(50),
	@USE_LOGIN	VARCHAR(50),
	@ITS_MACHINE	VARCHAR(50),
	@ORDENCOMPRA	VARCHAR(50),
	@DOLARES	BIT,
	@CAMBIO		BIT,
	@STOCK		BIT,
	@PLANO		INT,
	@STOCKPARCIAL   BIT,
	@STOCKPARCIALCANTIDAD INT,
	@MEZCLADO   BIT	
)
AS
DECLARE
	@RES 	  	INT,
	@ERROR		VARCHAR(200),
	@ITEMEXISTS VARCHAR(50),
    @OLD_PLANO  INT ,
	@TAS_ID   	INT,
	@TAS_ID2  	INT,
    @ST_ID      INT,
    @OLDREQUERIDA INT
	
	IF @STOCK = 1 OR @MEZCLADO = 1 BEGIN
		DECLARE @ITE_NOMBRE_OLD AS VARCHAR(50)
	    		
		SELECT @ITE_NOMBRE_OLD = ITE_Nombre, @ST_ID = ST_Id FROM tblOrdenes WHERE ITE_ID = @ITE_ID
		
		DELETE FROM tblItems WHERE ITE_ID = @ITE_ID
		DELETE FROM tblItemTasks WHERE ITE_ID = @ITE_ID
		DELETE FROM tblOrdenes WHERE ITE_ID = @ITE_ID	  
		DELETE FROM tblScrap WHERE ITE_Nombre = @ITE_NOMBRE_OLD		
 	    DELETE FROM tblStock WHERE ST_Id = @ST_ID
	
		SELECT @ITE_NOMBRE_OLD = ITE_Nombre, @ST_ID = ST_Id FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID	    
		
		DELETE FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID		
   	    DELETE FROM tblStock WHERE ST_Id = @ST_ID
   	    DELETE FROM tblMergeOrdenes WHERE ITE_Nombre = @ITE_NOMBRE_OLD

		EXEC Insert_Orden @ITE_NOMBRE,@PROCESO,@REQUERIDA,@ORDENADA,@PRO_NOMBRE,@NUMERO,
				  @TERMINAL,@ENTREGA,@RECIBIDO,@INTERNA,@NOMBRE,@APROBACION,@OBSERVACIONES,
				  @OTRAS,@UNITARIO,@TOTAL,@TAREA,@USE_LOGIN,@ITS_MACHINE,@ORDENCOMPRA,@DOLARES,@STOCK,
				  @PLANO,@STOCKPARCIAL,@STOCKPARCIALCANTIDAD,@MEZCLADO,1		
	END
	ELSE BEGIN
		SELECT @ITEMEXISTS = ITE_Nombre FROM tblItems WHERE ITE_ID = @ITE_ID
		IF (@ITEMEXISTS IS NOT NULL) BEGIN --ALREADY EXISTS JUST NEED TO UPDATE THE RECORDS
			SET @ITEMEXISTS = NULL
					
			SELECT @ITEMEXISTS = ITE_Nombre FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE AND ITE_ID <> @ITE_ID
			IF (@ITEMEXISTS IS NOT NULL) BEGIN		
				SELECT @ERROR = 'Ya existe una orden con el nombre: ' + @ITE_NOMBRE + '.'
				GOTO LBLERROR
			END
				
			UPDATE tblItems SET ITE_Nombre = @ITE_NOMBRE, PRO_NOMBRE = @PRO_NOMBRE WHERE ITE_ID = @ITE_ID
			UPDATE tblItemTasks SET ITE_Nombre = @ITE_NOMBRE WHERE ITE_ID = @ITE_ID
			
			SELECT @OLD_PLANO = PN_ID, @ST_ID = ST_Id 
			FROM tblOrdenes WHERE ITE_ID = @ITE_ID
						
			--UPDATE INTO tblOrdenes
			UPDATE tblOrdenes SET ITE_Nombre = @ITE_NOMBRE,
			TipoProceso = @PROCESO, Requerida = @REQUERIDA, Ordenada = @ORDENADA,
			Producto = @PRO_NOMBRE, Numero = @NUMERO, Terminal = @TERMINAL,
			Recibido = @RECIBIDO, Entrega = @ENTREGA, Interna = @INTERNA, 
			Nombre = @NOMBRE, Aprobacion = @APROBACION, Observaciones = @OBSERVACIONES,
			Otras =  @OTRAS, Unitario = @UNITARIO, Total = @TOTAL, 
			OrdenCompra = @ORDENCOMPRA, Dolares = @DOLARES, PN_Id = @PLANO, Update_Date = GETDATE(), 
			Update_User = @USE_LOGIN, StockParcial = @STOCKPARCIAL, 
			StockParcialCantidad = @STOCKPARCIALCANTIDAD
			WHERE ITE_ID = @ITE_ID
		    
			-- BORRAR EL REGISTRO DEL STOCK SI ES QUE TENIA
   		    DELETE FROM tblStock WHERE ST_Id = @ST_ID
		    	    
			-- SI TIENE STOCK PARCIAL
			IF (@STOCKPARCIAL = 1) BEGIN	
				INSERT INTO tblStock(PN_Id,ITE_Nombre,ST_Cantidad,ST_Fecha,ST_Tipo,Update_Date,Update_User)
				VALUES (@PLANO,@ITE_NOMBRE,@STOCKPARCIALCANTIDAD,CONVERT (date, GETDATE()),'Salida',GETDATE(),@USE_LOGIN) 
			    
				SELECT @ST_ID = @@IDENTITY
			    
				-- UPDATE tblOrdenes RECORD WITH THE STOCK ID RECORD
				IF (@ITE_ID IS NOT NULL AND @ST_ID IS NOT NULL) BEGIN
				  UPDATE tblOrdenes SET ST_Id = @ST_ID WHERE ITE_ID = @ITE_ID
				END	        
			END
		     
			IF (@OLD_PLANO IS NULL AND @PLANO IS NOT NULL) BEGIN	
				print('MOVE ORDER TO NEXT TASK AS READY')
				--MOVE ORDER TO NEXT TASK AS READY    
				SELECT @TAS_ID = [Id] FROM tblTareas WHERE Nombre = @TAREA
		      
				UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStart = GETDATE(), ITS_DTStop = GETDATE(), USE_Login = @USE_LOGIN
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE

				SELECT @TAS_ID2 = Rou_To FROM tblRouting WHERE Nombre = @PRO_NOMBRE AND Rou_From = @TAS_ID

				UPDATE tblItemTasks SET ITS_Status = 0,ITS_DTStart = GETDATE()
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID2 AND ITE_Nombre = @ITE_NOMBRE					      	      
			END
			ELSE IF (@OLD_PLANO IS NOT NULL AND @PLANO IS NULL) BEGIN
				print('MOVE ORDER TO VENTAS AS ACTIVE')
				--MOVE ORDER TO VENTAS AS ACTIVE 
   				SELECT @TAS_ID = [Id] FROM tblTareas WHERE Nombre = @TAREA

				UPDATE tblItemTasks SET ITS_Status = NULL,ITS_DTStart = NULL, ITS_DTStop = NULL, USE_Login = NULL
				WHERE ITE_Id = @ITE_ID AND ITE_Nombre = @ITE_NOMBRE
					
				UPDATE tblItemTasks SET ITS_Status = 1,ITS_DTStart = GETDATE(), ITS_DTStop = NULL, USE_Login = @USE_LOGIN
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE			
			END
		END	
		ELSE BEGIN -- DOES NOT EXISTS, SO USE TO BE A STOCK ORDER
		    SELECT @ITE_NOMBRE_OLD = ITE_Nombre, @ST_ID = ST_Id FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID
			DELETE FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID		
   			DELETE FROM tblStock WHERE ST_Id = @ST_ID
   			DELETE FROM tblMergeOrdenes WHERE ITE_Nombre = @ITE_NOMBRE_OLD

			EXEC Insert_Orden @ITE_NOMBRE,@PROCESO,@REQUERIDA,@ORDENADA,@PRO_NOMBRE,@NUMERO,
					  @TERMINAL,@ENTREGA,@RECIBIDO,@INTERNA,@NOMBRE,@APROBACION,@OBSERVACIONES,
					  @OTRAS,@UNITARIO,@TOTAL,@TAREA,@USE_LOGIN,@ITS_MACHINE,@ORDENCOMPRA,@DOLARES,@STOCK,
					  @PLANO,@STOCKPARCIAL,@STOCKPARCIALCANTIDAD,@MEZCLADO,0		
		END
	END


 --   -- DID NOT CHANGE AND IS NOT STOCK
	--IF(@CAMBIO = 0 AND @STOCK = 0) BEGIN
	--	SELECT @ITEMEXISTS = ITE_Nombre FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE AND ITE_ID <> @ITE_ID
	--	IF (@ITEMEXISTS IS NOT NULL) BEGIN		
	--		SELECT @ERROR = 'Ya existe una orden con el nombre: ' + @ITE_NOMBRE + '.'
	--		GOTO LBLERROR
	--	END
			
	--	--INSERT ITEM INTO tblitems
	--	UPDATE tblItems SET ITE_Nombre = @ITE_NOMBRE, PRO_NOMBRE = @PRO_NOMBRE WHERE ITE_ID = @ITE_ID
	
	--	UPDATE tblItemTasks SET ITE_Nombre = @ITE_NOMBRE WHERE ITE_ID = @ITE_ID
		
	--	SELECT @OLD_PLANO = PN_ID, @ST_ID = ST_Id 
	--	FROM tblOrdenes WHERE ITE_ID = @ITE_ID
					
	--	--UPDATE INTO tblOrdenes
	--	UPDATE tblOrdenes SET ITE_Nombre = @ITE_NOMBRE,
	--	TipoProceso = @PROCESO, Requerida = @REQUERIDA, Ordenada = @ORDENADA,
	--	Producto = @PRO_NOMBRE, Numero = @NUMERO, Terminal = @TERMINAL,
	--	Recibido = @RECIBIDO, Entrega = @ENTREGA, Interna = @INTERNA, 
	--	Nombre = @NOMBRE, Aprobacion = @APROBACION, Observaciones = @OBSERVACIONES,
	--	Otras =  @OTRAS, Unitario = @UNITARIO, Total = @TOTAL, 
	--	OrdenCompra = @ORDENCOMPRA, Dolares = @DOLARES, PN_Id = @PLANO, Update_Date = GETDATE(), 
	--	Update_User = @USE_LOGIN, StockParcial = @STOCKPARCIAL, 
	--	StockParcialCantidad = @STOCKPARCIALCANTIDAD
	--	WHERE ITE_ID = @ITE_ID
	    
	--    -- BORRAR EL REGISTRO DEL STOCK SI ES QUE TENIA
	--	IF (@ST_ID IS NOT NULL) BEGIN
	--	  DELETE FROM tblStock WHERE ST_Id = @ST_ID
	--	END	    
	    	    
	--    -- SI TIENE STOCK PARCIAL
	--    IF (@STOCKPARCIAL = 1) BEGIN	
	--		INSERT INTO tblStock(PN_Id,ITE_Nombre,ST_Cantidad,ST_Fecha,ST_Tipo,Update_Date,Update_User)
	--		VALUES (@PLANO,@ITE_NOMBRE,@STOCKPARCIALCANTIDAD,CONVERT (date, GETDATE()),'Salida',GETDATE(),@USE_LOGIN) 
		    
	--		SELECT @ST_ID = @@IDENTITY
		    
	--		-- UPDATE tblOrdenes RECORD WITH THE STOCK ID RECORD
	--		IF (@ITE_ID IS NOT NULL AND @ST_ID IS NOT NULL) BEGIN
	--		  UPDATE tblOrdenes SET ST_Id = @ST_ID WHERE ITE_ID = @ITE_ID
	--		END	        
	--    END
	     
	--    IF (@OLD_PLANO IS NULL AND @PLANO IS NOT NULL) BEGIN	
	--        print('MOVE ORDER TO NEXT TASK AS READY')
	--        --MOVE ORDER TO NEXT TASK AS READY    
	--        SELECT @TAS_ID = [Id] FROM tblTareas WHERE Nombre = @TAREA
	      
	--		UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStart = GETDATE(), ITS_DTStop = GETDATE(), USE_Login = @USE_LOGIN
	--		WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE

	--		SELECT @TAS_ID2 = Rou_To FROM tblRouting WHERE Nombre = @PRO_NOMBRE AND Rou_From = @TAS_ID

	--		UPDATE tblItemTasks SET ITS_Status = 0,ITS_DTStart = GETDATE()
	--		WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID2 AND ITE_Nombre = @ITE_NOMBRE					      	      
	--    END
	--    ELSE IF (@OLD_PLANO IS NOT NULL AND @PLANO IS NULL) BEGIN
	--        print('MOVE ORDER TO VENTAS AS ACTIVE')
	--        --MOVE ORDER TO VENTAS AS ACTIVE 
 --  	        SELECT @TAS_ID = [Id] FROM tblTareas WHERE Nombre = @TAREA

	--		UPDATE tblItemTasks SET ITS_Status = NULL,ITS_DTStart = NULL, ITS_DTStop = NULL, USE_Login = NULL
	--	    WHERE ITE_Id = @ITE_ID AND ITE_Nombre = @ITE_NOMBRE
				
	--		UPDATE tblItemTasks SET ITS_Status = 1,ITS_DTStart = GETDATE(), ITS_DTStop = NULL, USE_Login = @USE_LOGIN
	--		WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE			
	--    END
	 	  
	--    -- UPDATED CODE ON SEPTEMBER 3 2012 TO UPDATE NEW FIELDS PN_Id, Update_Date, Update_User AND ADDED LOGIC FOR PLANO
	--    -- MOVE ORDER TO NEXT TASK WHEN PLANO IS SET AND RETURN ORDER TO VENTAS WHEN PLANO IS NULL
	  
	--	-- CODE ADDED ON AUGUST 15 2007 TO UPDATE THE NEW BILLING FIELDS.
	--	-- UPDATE tblOrdenes SET FAC_Cantidad = @REQUERIDA, 
	--	-- FAC_Desc = @OTRAS, FAC_Numero = @NUMERO
	--	-- WHERE ITE_ID = @ITE_ID AND FAC_Id IS NULL
	
	--END
	---- DID NOT CHANGE AND IS STOCK
	--ELSE IF (@CAMBIO = 0 AND @STOCK = 1) BEGIN
	--	SELECT @ITEMEXISTS = ITE_Nombre FROM tblStockOrdenes WHERE ITE_Nombre = @ITE_NOMBRE AND ITE_ID <> @ITE_ID
	--	IF (@ITEMEXISTS IS NOT NULL) BEGIN		
	--		SELECT @ERROR = 'Ya existe una orden con el nombre: ' + @ITE_NOMBRE + '.'
	--		GOTO LBLERROR
	--	END

	--	SELECT @ST_ID = ST_Id, @OLDREQUERIDA = Requerida FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID

	--	UPDATE tblStockOrdenes SET ITE_Nombre = @ITE_NOMBRE,
	--	TipoProceso = @PROCESO, Requerida = @REQUERIDA, Ordenada = @ORDENADA,
	--	Producto = @PRO_NOMBRE, Numero = @NUMERO, Terminal = @TERMINAL,
	--	Recibido = @RECIBIDO, Entrega = @ENTREGA, Interna = @INTERNA, 
	--	Nombre = @NOMBRE, Aprobacion = @APROBACION, Observaciones = @OBSERVACIONES,
	--	Otras =  @OTRAS, Unitario = @UNITARIO, Total = @TOTAL, 
	--	OrdenCompra = @ORDENCOMPRA, Dolares = @DOLARES, PN_Id = @PLANO, Update_Date = GETDATE(), 
	--	Update_User = @USE_LOGIN, Mezclado = @MEZCLADO
	--	WHERE ITE_ID = @ITE_ID
		
	--    -- BORRAR EL REGISTRO DEL STOCK SI ES QUE TENIA
	--    IF (@OLDREQUERIDA <> @REQUERIDA) BEGIN
	--		IF (@ST_ID IS NOT NULL) BEGIN
	--		  DELETE FROM tblStock WHERE ST_Id = @ST_ID
	--		END	    
		    
	--		INSERT INTO tblStock(PN_Id,ITE_Nombre,ST_Cantidad,ST_Fecha,ST_Tipo,Update_Date,Update_User)
	--		VALUES (@PLANO,@ITE_NOMBRE,@REQUERIDA,CONVERT (date, GETDATE()),'Salida',GETDATE(),@USE_LOGIN) 
		    
	--		SELECT @ST_ID = @@IDENTITY
		    
	--		-- UPDATE tblStockOrdenes RECORD WITH THE STOCK ID RECORD
	--		IF (@ITE_ID IS NOT NULL AND @ST_ID IS NOT NULL) BEGIN
	--		  UPDATE tblStockOrdenes SET ST_Id = @ST_ID WHERE ITE_ID = @ITE_ID
	--		END			    	            
	--    END
				
	--END
	--ELSE IF (@CAMBIO = 1  AND @STOCK = 0) BEGIN
	--	IF (@MEZCLADO = 0) BEGIN
	--		EXEC Delete_Orden @ITE_ID, @STOCK
			
	--		EXEC Insert_Orden @ITE_NOMBRE,@PROCESO,@REQUERIDA,@ORDENADA,@PRO_NOMBRE,@NUMERO,
	--				  @TERMINAL,@ENTREGA,@RECIBIDO,@INTERNA,@NOMBRE,@APROBACION,@OBSERVACIONES,
	--				  @OTRAS,@UNITARIO,@TOTAL,@TAREA,@USE_LOGIN,@ITS_MACHINE,@ORDENCOMPRA,@DOLARES,1,
	--				  @PLANO,@STOCKPARCIAL,@STOCKPARCIALCANTIDAD,@MEZCLADO
	--	END
	--	ELSE BEGIN
	--		SELECT @ITEMEXISTS = ITE_Nombre FROM tblStockOrdenes WHERE ITE_Nombre = @ITE_NOMBRE AND ITE_ID <> @ITE_ID
	--		IF (@ITEMEXISTS IS NOT NULL) BEGIN		
	--			SELECT @ERROR = 'Ya existe una orden con el nombre: ' + @ITE_NOMBRE + '.'
	--			GOTO LBLERROR
	--		END

	--		SELECT @ST_ID = ST_Id FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID

	--		UPDATE tblStockOrdenes SET ITE_Nombre = @ITE_NOMBRE,
	--		TipoProceso = @PROCESO, Requerida = @REQUERIDA, Ordenada = @ORDENADA,
	--		Producto = @PRO_NOMBRE, Numero = @NUMERO, Terminal = @TERMINAL,
	--		Recibido = @RECIBIDO, Entrega = @ENTREGA, Interna = @INTERNA, 
	--		Nombre = @NOMBRE, Aprobacion = @APROBACION, Observaciones = @OBSERVACIONES,
	--		Otras =  @OTRAS, Unitario = @UNITARIO, Total = @TOTAL, 
	--		OrdenCompra = @ORDENCOMPRA, Dolares = @DOLARES, PN_Id = @PLANO, Update_Date = GETDATE(), 
	--		Update_User = @USE_LOGIN, Mezclado = @MEZCLADO, Stock = 0, ST_Id = NULL
	--		WHERE ITE_ID = @ITE_ID
			
	--		-- BORRAR EL REGISTRO DEL STOCK SI ES QUE TENIA
	--		IF (@ST_ID IS NOT NULL) BEGIN
	--		  DELETE FROM tblStock WHERE ST_Id = @ST_ID
	--		END	    			    		    			
	--	END
	--END	
	--ELSE IF (@CAMBIO = 1  AND @STOCK = 1) BEGIN
	--	EXEC Delete_Orden @ITE_ID, @STOCK
		
	--	EXEC Insert_Orden @ITE_NOMBRE,@PROCESO,@REQUERIDA,@ORDENADA,@PRO_NOMBRE,@NUMERO,
	--			  @TERMINAL,@ENTREGA,@RECIBIDO,@INTERNA,@NOMBRE,@APROBACION,@OBSERVACIONES,
	--			  @OTRAS,@UNITARIO,@TOTAL,@TAREA,@USE_LOGIN,@ITS_MACHINE,@ORDENCOMPRA,@DOLARES,0,
	--			  @PLANO,@STOCKPARCIAL,@STOCKPARCIALCANTIDAD,@MEZCLADO
	--END	


	SELECT 0 AS ERROR,'' AS MSG
LBLERROR:
	SELECT -1 AS ERROR,@ERROR AS MSG
