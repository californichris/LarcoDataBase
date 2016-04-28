USE [Larco]
GO
/****** Object:  Trigger [dbo].[ReprogramarOrden]    Script Date: 11/16/2015 15:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  TRIGGER [dbo].[ReprogramarOrden]
ON [dbo].[tblScrap]
FOR INSERT
NOT FOR REPLICATION
AS
BEGIN
	
        DECLARE 
		@ITE_NOMBRE		VARCHAR(50),
		@SCR_PARCIAL		BIT,
		@SCR_REPRO		INT,
		@NEW_ITE_NOMBRE		VARCHAR(50),
		@NEW			CHAR(1),
		@ITE_ID	  	        INT,
		@TAS_ID		   	INT,
		@TAS_ID2  		INT,
		@PRO_NOMBRE		VARCHAR(50),
		@SCR_DETECTADO	VARCHAR(50),
		@TAS_ORDER		   	INT

	SET NOCOUNT ON


	SELECT @ITE_NOMBRE = ITE_Nombre,@SCR_PARCIAL = SCR_Parcial,@SCR_REPRO = SCR_Repro, @SCR_DETECTADO = SCR_Detectado FROM INSERTED
	SELECT @PRO_NOMBRE = PRO_Nombre FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE
 
	SELECT @NEW = SUBSTRING(@ITE_NOMBRE,4,1)
	IF (@NEW = '0') 
		SET @NEW = '9'
	ELSE
		SELECT @NEW = CAST( CAST(@NEW AS INT) - 1 AS CHAR(1) )

	SELECT @NEW_ITE_NOMBRE = SUBSTRING(@ITE_NOMBRE,1,3) + @NEW + SUBSTRING(@ITE_NOMBRE,5,9)

	UPDATE tblScrap SET SCR_NewItem = @NEW_ITE_NOMBRE WHERE ITE_Nombre = @ITE_NOMBRE 

	--INSERT INTO tblItems
	INSERT INTO tblItems(ITE_Nombre,PRO_Nombre,ITE_Fecha,ITE_Priority)
	SELECT @NEW_ITE_NOMBRE,PRO_NOMBRE,GETDATE(),0 FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE

	--GET ITE_ID FROM THE NEW ITEM
	SELECT @ITE_ID = ITE_ID FROM tblItems WHERE ITE_Nombre = @NEW_ITE_NOMBRE

	--INSERT INTO tblItemTasks
	INSERT INTO tblItemTasks(ITE_ID,TAS_ID,ITE_Nombre)
	SELECT @ITE_ID,[ID],@NEW_ITE_NOMBRE FROM TBLTAREAS

	--UPDATE ITEM STATUS
	SELECT @TAS_ID = [Id] FROM tblTareas WHERE Nombre = 'Ventas'

	UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStart = GETDATE(), ITS_DTStop = GETDATE()
        WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @NEW_ITE_NOMBRE

	SELECT @TAS_ID2 = Rou_To FROM tblRouting WHERE Nombre = @PRO_NOMBRE AND Rou_From = @TAS_ID

	UPDATE tblItemTasks SET ITS_Status = 0,ITS_DTStart = GETDATE()
        WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID2 AND ITE_Nombre = @NEW_ITE_NOMBRE


	--INSERT INTO tblOrdenes
	IF (@SCR_PARCIAL = 0) BEGIN -- si es total
		INSERT INTO tblOrdenes(ITE_ID,ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
		OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,Otras,Unitario,Total,
		Dolares,Urgente,Alerta, AlertaMsg, Instrucciones)
		SELECT @ITE_ID,@NEW_ITE_NOMBRE,TipoProceso,Requerida,Ordenada,Producto,Numero,
		Terminal,OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,
		Otras,Unitario,Total,Dolares,Urgente,Alerta, AlertaMsg, Instrucciones
		FROM tblOrdenes WHERE ITE_Nombre = @ITE_NOMBRE  

	    -- ACTUALIAR ES STATUS DE LA ORDEN RECIEN SCRAPEADA
	    UPDATE tblItemTasks SET ITS_Status = 9 WHERE ITE_Nombre = @ITE_NOMBRE AND ITS_Status IS NOT NULL

	END
	ELSE BEGIN -- si es parcial	
		INSERT INTO tblOrdenes(ITE_ID,ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
		OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,Otras,Unitario,Total,
		Dolares,Urgente,Alerta, AlertaMsg, Instrucciones)
		SELECT @ITE_ID,@NEW_ITE_NOMBRE,TipoProceso,@SCR_REPRO,@SCR_REPRO,Producto,Numero,
		Terminal,OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,
		Otras,Unitario,Total,Dolares,Urgente,Alerta, AlertaMsg, Instrucciones
		FROM tblOrdenes WHERE ITE_Nombre = @ITE_NOMBRE  

		-- Update Cantidad Larco = Cantidad Larco - Reprogramada
		UPDATE tblOrdenes SET Ordenada = (Ordenada - @SCR_REPRO) WHERE ITE_Nombre = @ITE_NOMBRE
		
	    SELECT @TAS_ID = [Id], @TAS_ORDER = TAS_Order FROM tblTareas WHERE Nombre = @SCR_DETECTADO

		UPDATE tblItemTasks 
		SET ITS_Status = NULL, ITS_DTStart = NULL, ITS_DTStop = NULL, 
		USE_Login = NULL, ITS_Machine = NULL
		WHERE ITE_Nombre = @ITE_NOMBRE 
		AND TAS_ID IN (SELECT ID FROM tblTareas WHERE TAS_Order > @TAS_ORDER)

		UPDATE tblItemTasks SET ITS_Status = 1, ITS_DTStart = GETDATE(), ITS_DTStop = NULL
		WHERE ITE_Nombre = @ITE_NOMBRE AND TAS_ID = @TAS_ID        
		
	END
	
	
END
