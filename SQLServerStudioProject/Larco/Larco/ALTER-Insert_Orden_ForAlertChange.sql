USE [Larco]
GO

/****** Object:  StoredProcedure [dbo].[Insert_Orden]    Script Date: 11/16/2015 15:34:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER       PROCEDURE [dbo].[Insert_Orden]
(
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
	@STOCK		BIT,
	@PLANO      INT,
	@STOCKPARCIAL   BIT,
	@STOCKPARCIALCANTIDAD INT,
	@MEZCLADO   BIT,
	@INSERTSTOCK BIT,
	@REQUISICION VARCHAR(50),
	@URGENTE BIT,
	@ALERTA BIT,
	@ALERTAMSG VARCHAR(50),
	@INSTRUCCIONES VARCHAR(1000)
)
AS
DECLARE 
	@RES 	  	INT,
	@TAS_ID   	INT,
	@TAS_ID2  	INT,
	@ITE_ID	  	INT,
	@ISPUTONLY  	BIT,
	@ISLAST  	BIT,
	@ERROR		VARCHAR(200),
	@ITEMEXISTS     VARCHAR(50),
	@ST_ID      INT

IF (@INSERTSTOCK = 0) BEGIN

	SELECT @TAS_ID = [Id], @ISPUTONLY = IsPutOnly,@ISLAST = IsLast FROM tblTareas WHERE Nombre = @TAREA
	IF (@@ERROR <> 0 OR @TAS_ID IS NULL OR @ISPUTONLY = 0) BEGIN		
		SELECT @ERROR = 'La Tarea ' + @TAREA + ' no existe.'
		GOTO LBLERROR
	END

	SELECT @ITEMEXISTS = ITE_Nombre FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE
	IF (@ITEMEXISTS IS NOT NULL) BEGIN		
		SELECT @ERROR = 'Ya existe una orden con el nombre: ' + @ITE_NOMBRE + '.'
		GOTO LBLERROR
	END
	SET @ITEMEXISTS = NULL

	SELECT @ITEMEXISTS = ITE_Nombre FROM tblStockOrdenes WHERE ITE_Nombre = @ITE_NOMBRE
	IF (@ITEMEXISTS IS NOT NULL) BEGIN		
		SELECT @ERROR = 'Ya existe una orden con el nombre: ' + @ITE_NOMBRE + '.'
		GOTO LBLERROR
	END
	

	IF( @ISPUTONLY = 1 ) BEGIN
		--INSERT ITEM INTO tblitems
		INSERT INTO tblItems(ITE_Nombre,PRO_Nombre,ITE_Fecha,ITE_Priority)
		SELECT @ITE_NOMBRE,@PRO_NOMBRE,GETDATE(),0

		--GET ITE_ID FROM THE NEW ITEM
		SELECT @ITE_ID = ITE_ID FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE

		--INSERT INTO tblItemTasks
		INSERT INTO tblItemTasks(ITE_ID,TAS_ID,ITE_Nombre)
		SELECT @ITE_ID,[ID],@ITE_NOMBRE FROM TBLTAREAS
					
		--UPDATE ITEM STATUS
		--select * from mcpItemTasks
		IF (@PLANO IS NOT NULL) BEGIN
		    -- if plano is not null order will be completed in ventas and move to the next task as ready
			UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStart = GETDATE(), ITS_DTStop = GETDATE(), USE_Login = @USE_LOGIN
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE

			SELECT @TAS_ID2 = Rou_To FROM tblRouting WHERE Nombre = @PRO_NOMBRE AND Rou_From = @TAS_ID

			UPDATE tblItemTasks SET ITS_Status = 0,ITS_DTStart = GETDATE()
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID2 AND ITE_Nombre = @ITE_NOMBRE				
		END
		ELSE BEGIN
		    -- if plano is null order will remain in ventas as Active
			UPDATE tblItemTasks SET ITS_Status = 1,ITS_DTStart = GETDATE(), ITS_DTStop = NULL, USE_Login = @USE_LOGIN
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE		
		END

		--INSERT INTO tblOrdenes
		INSERT INTO tblOrdenes(ITE_ID,ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
		OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,Otras,Unitario,
		Total,Dolares,PN_Id,Update_Date,Update_User,StockParcial,StockParcialCantidad,Requisicion,Urgente,
		Alerta, AlertaMsg, Instrucciones)
		SELECT @ITE_ID,@ITE_NOMBRE,@PROCESO,@REQUERIDA,@ORDENADA,@PRO_NOMBRE,@NUMERO,@TERMINAL,
	        @ORDENCOMPRA,@RECIBIDO,@ENTREGA,@INTERNA,@NOMBRE,@APROBACION,@OBSERVACIONES,@OTRAS,@UNITARIO,
	        @TOTAL,@DOLARES,@PLANO,GETDATE(),@USE_LOGIN,@STOCKPARCIAL,@STOCKPARCIALCANTIDAD,@REQUISICION,@URGENTE,
	        @ALERTA, @ALERTAMSG, @INSTRUCCIONES
	        
        IF @STOCKPARCIAL = 1 BEGIN
			-- RECORD Salida IN STOCK
			INSERT INTO tblStock(PN_Id,ITE_Nombre,ST_Cantidad,ST_Fecha,ST_Tipo,Update_Date,Update_User)
			VALUES (@PLANO,@ITE_NOMBRE,@STOCKPARCIALCANTIDAD,CONVERT (date, GETDATE()),'Salida',GETDATE(),@USE_LOGIN) 
		    
			SELECT @ST_ID = @@IDENTITY
		    
			-- UPDATE tblOrdenes RECORD WITH THE STOCK ID RECORD
			IF (@ITE_ID IS NOT NULL AND @ST_ID IS NOT NULL) BEGIN
			  UPDATE tblOrdenes SET ST_Id = @ST_ID WHERE ITE_ID = @ITE_ID
			END
        
        END         	        
	END


	SELECT 0 AS ERROR,'' AS MSG
END
ELSE BEGIN
	SET @ITEMEXISTS = NULL

	SELECT @ITEMEXISTS = ITE_Nombre FROM tblStockOrdenes WHERE ITE_Nombre = @ITE_NOMBRE
	IF (@ITEMEXISTS IS NOT NULL) BEGIN		
		SELECT @ERROR = 'Ya existe una orden con el nombre: ' + @ITE_NOMBRE + '.'
		GOTO LBLERROR
	END

	INSERT INTO tblStockOrdenes(ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
	OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,Otras,Unitario,Total,
	Dolares,Stock,Programado,Cantidad,FileName,AddBy, AddDate,PN_Id,Update_Date,Update_User,Mezclado,Requisicion,Urgente,
	Alerta, AlertaMsg, Instrucciones)
	SELECT @ITE_NOMBRE,@PROCESO,@REQUERIDA,@ORDENADA,@PRO_NOMBRE,@NUMERO,@TERMINAL,
        @ORDENCOMPRA,@RECIBIDO,@ENTREGA,@INTERNA,@NOMBRE,@APROBACION,@OBSERVACIONES,@OTRAS,@UNITARIO,@TOTAL,
	@DOLARES,@STOCK,0,NULL,'Ventas','Ventas',GETDATE(),@PLANO,GETDATE(),@USE_LOGIN,@MEZCLADO,@REQUISICION,@URGENTE,
	@ALERTA, @ALERTAMSG, @INSTRUCCIONES
    
    -- GET ID OF THE INSERTED RECORD
    SELECT @ITE_ID = @@IDENTITY
    
    IF @MEZCLADO = 0 BEGIN
		-- RECORD Salida IN STOCK
		INSERT INTO tblStock(PN_Id,ITE_Nombre,ST_Cantidad,ST_Fecha,ST_Tipo,Update_Date,Update_User)
		VALUES (@PLANO,@ITE_NOMBRE,@REQUERIDA,CONVERT (date, GETDATE()),'Salida',GETDATE(),@USE_LOGIN) 
	    
		SELECT @ST_ID = @@IDENTITY
	    
		-- UPDATE tblStockOrdenes RECORD WITH THE STOCK ID RECORD
		IF (@ITE_ID IS NOT NULL AND @ST_ID IS NOT NULL) BEGIN
		  UPDATE tblStockOrdenes SET ST_Id = @ST_ID WHERE ITE_ID = @ITE_ID
		END
	END
	    
	SELECT 0 AS ERROR,'' AS MSG
END

LBLERROR:
	SELECT -1 AS ERROR,@ERROR AS MSG

GO

