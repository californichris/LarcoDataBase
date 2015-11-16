USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Update_Orden]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Update_Orden]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Update_Orden]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Update_Orden]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Update_Orden 10809,''07-036-009-06'',''212'',10,10,''Anvil'',''11212'',''1212'',''5/4/2007'',''10/10/2007'',''5/3/2007'',''Edgar Lara A'',0,''121211112'',''Anvil'',12,120,''Ventas'',''System'',''192.168.1.70'',''12345'',0
CREATE         PROCEDURE [dbo].[Update_Orden]
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
	@MEZCLADO   BIT,
	@REQUISICION VARCHAR(50),
	@URGENTE BIT		
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
    @OLDREQUERIDA INT,
    @CURRENTTASK VARCHAR(50),
    @CURRENTSTATUS     VARCHAR(50)  

	IF @STOCK = 1 OR @MEZCLADO = 1 BEGIN		
		DECLARE @ITE_NOMBRE_OLD AS VARCHAR(50)
        SET @ITE_NOMBRE_OLD = NULL
		
		SELECT @ITE_NOMBRE_OLD = ITE_Nombre FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID
		IF @ITE_NOMBRE_OLD IS NULL BEGIN
		    PRINT(''DELETE FROM ALL TABLES BECAUSE USE TO BE A PRODUCTION ORDER SO INSERT THE NEW ONE AS STOCK'')
		     -- DELETE FROM ALL TABLES BECAUSE IT WAS IN tblOrdenes	    		
			DELETE FROM tblItems WHERE ITE_ID = @ITE_ID
			DELETE FROM tblItemTasks WHERE ITE_ID = @ITE_ID
			DELETE FROM tblOrdenes WHERE ITE_ID = @ITE_ID	  
			DELETE FROM tblScrap WHERE ITE_Nombre = @ITE_NOMBRE_OLD		
 			DELETE FROM tblStock WHERE ST_Id = @ST_ID

			-- USE TO BE A PRODUCTION ORDER SO INSERT THE NEW ONE AS STOCK 
			EXEC Insert_Orden @ITE_NOMBRE,@PROCESO,@REQUERIDA,@ORDENADA,@PRO_NOMBRE,@NUMERO,
					  @TERMINAL,@ENTREGA,@RECIBIDO,@INTERNA,@NOMBRE,@APROBACION,@OBSERVACIONES,
					  @OTRAS,@UNITARIO,@TOTAL,@TAREA,@USE_LOGIN,@ITS_MACHINE,@ORDENCOMPRA,@DOLARES,@STOCK,
					  @PLANO,@STOCKPARCIAL,@STOCKPARCIALCANTIDAD,@MEZCLADO,1, @REQUISICION, @URGENTE		

		END
		ELSE BEGIN	
		    PRINT(''EXISTING ORDER IN tblStockOrdenes UPDATE DATA'')		
			SET @ITEMEXISTS = NULL

			PRINT(''@ITE_NOMBRE = '' + @ITE_NOMBRE + '' @ITE_ID = '')
			PRINT(@ITE_ID)
			SELECT @ITEMEXISTS = ITE_Nombre FROM tblStockOrdenes WHERE ITE_Nombre = @ITE_NOMBRE AND ITE_ID <> @ITE_ID
		
			IF (@ITEMEXISTS IS NOT NULL) BEGIN		
				SELECT @ERROR = ''Ya existe una orden con el nombre: '' + @ITE_NOMBRE + ''.''
				GOTO LBLERROR
			END
			
			SELECT @ST_ID = ST_Id FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID	    
			
			--UPDATE INTO tblStockOrdenes
			UPDATE tblStockOrdenes SET ITE_Nombre = @ITE_NOMBRE,
			TipoProceso = @PROCESO, Requerida = @REQUERIDA, Ordenada = @ORDENADA,
			Producto = @PRO_NOMBRE, Numero = @NUMERO, Terminal = @TERMINAL,
			OrdenCompra = @ORDENCOMPRA, Recibido = @RECIBIDO, Entrega = @ENTREGA, Interna = @INTERNA, 
			Nombre = @NOMBRE, Aprobacion = @APROBACION, Observaciones = @OBSERVACIONES,
			Otras =  @OTRAS, Unitario = @UNITARIO, Total = @TOTAL, 
			Dolares = @DOLARES, Stock = @STOCK, PN_Id = @PLANO, Update_Date = GETDATE(), 
			Update_User = @USE_LOGIN, Mezclado = @MEZCLADO, Requisicion = @REQUISICION,
			Urgente = @URGENTE
			WHERE ITE_ID = @ITE_ID
			
		    UPDATE tblStock SET PN_Id = @PLANO, ITE_Nombre = @ITE_NOMBRE, 
		    ST_Cantidad = @REQUERIDA, Update_Date = GETDATE(),Update_User = @USE_LOGIN
		    WHERE ST_ID = @ST_ID		    
		   			
   			DELETE FROM tblMergeOrdenes WHERE ITE_Nombre = @ITE_NOMBRE_OLD		
		END	
	END
	ELSE BEGIN
		SELECT @ITEMEXISTS = ITE_Nombre FROM tblItems WHERE ITE_ID = @ITE_ID
		IF (@ITEMEXISTS IS NOT NULL) BEGIN --ALREADY EXISTS JUST NEED TO UPDATE THE RECORDS
			SET @ITEMEXISTS = NULL
					
			SELECT @ITEMEXISTS = ITE_Nombre FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE AND ITE_ID <> @ITE_ID
			IF (@ITEMEXISTS IS NOT NULL) BEGIN		
				SELECT @ERROR = ''Ya existe una orden con el nombre: '' + @ITE_NOMBRE + ''.''
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
			StockParcialCantidad = @STOCKPARCIALCANTIDAD, Requisicion = @REQUISICION,
			Urgente = @URGENTE
			WHERE ITE_ID = @ITE_ID
		    
			-- BORRAR EL REGISTRO DEL STOCK SI ES QUE TENIA
   		    DELETE FROM tblStock WHERE ST_Id = @ST_ID
		    	    
			-- SI TIENE STOCK PARCIAL
			IF (@STOCKPARCIAL = 1) BEGIN	
				INSERT INTO tblStock(PN_Id,ITE_Nombre,ST_Cantidad,ST_Fecha,ST_Tipo,Update_Date,Update_User)
				VALUES (@PLANO,@ITE_NOMBRE,@STOCKPARCIALCANTIDAD,CONVERT (date, GETDATE()),''Salida'',GETDATE(),@USE_LOGIN) 
			    
				SELECT @ST_ID = @@IDENTITY
			    
				-- UPDATE tblOrdenes RECORD WITH THE STOCK ID RECORD
				IF (@ITE_ID IS NOT NULL AND @ST_ID IS NOT NULL) BEGIN
				  UPDATE tblOrdenes SET ST_Id = @ST_ID WHERE ITE_ID = @ITE_ID
				END	        
			END

			SELECT TOP 1 @CURRENTTASK = T.Nombre, @CURRENTSTATUS = (CASE WHEN I.ITS_Status = 0 THEN ''Listo''
			WHEN I.ITS_Status = 1 THEN ''Activo''
			WHEN I.ITS_Status = 2 THEN ''Terminado''
			WHEN I.ITS_Status = 9 THEN ''Scrap'' END)
			FROM tblitemtasks I
			INNER JOIN tbltareas T on I.TAS_ID = T.ID
			WHERE ITE_ID = @ITE_ID AND ITS_Status IS NOT NULL

			PRINT(''@CURRENTTASK = ['' + @CURRENTTASK + ''] @CURRENTSTATUS = ['' + @CURRENTSTATUS + '']'')
		     
			IF (@OLD_PLANO IS NULL AND @PLANO IS NOT NULL  AND (''VentasFinal'' <> @CURRENTTASK AND ''Terminado'' <> @CURRENTSTATUS)) BEGIN	
				print(''MOVE ORDER TO NEXT TASK AS READY'')
				--MOVE ORDER TO NEXT TASK AS READY    
				SELECT @TAS_ID = [Id] FROM tblTareas WHERE Nombre = @TAREA
		      
				UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStart = GETDATE(), ITS_DTStop = GETDATE(), USE_Login = @USE_LOGIN
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE

				SELECT @TAS_ID2 = Rou_To FROM tblRouting WHERE Nombre = @PRO_NOMBRE AND Rou_From = @TAS_ID

				UPDATE tblItemTasks SET ITS_Status = 0,ITS_DTStart = GETDATE()
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID2 AND ITE_Nombre = @ITE_NOMBRE					      	      
			END
			ELSE IF (@OLD_PLANO IS NOT NULL AND @PLANO IS NULL) BEGIN
				print(''MOVE ORDER TO VENTAS AS ACTIVE'')
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
					  @PLANO,@STOCKPARCIAL,@STOCKPARCIALCANTIDAD,@MEZCLADO,0, @REQUISICION, @URGENTE		
		END
	END

	SELECT 0 AS ERROR,'''' AS MSG
LBLERROR:
	SELECT -1 AS ERROR,@ERROR AS MSG
' 
END
GO
