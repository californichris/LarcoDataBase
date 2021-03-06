USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- ChangeStatus '06-001-001-07','Calidad',3,'14','Localhost'
-- SELECT * FROM TBLtareas
-- Insert_Orden '001-001-00','test',10,10,'Anvil AMP','12345','123435','03/20/2006','03/18/2006','Christian Beltran',1,'just a test','test again',12.0,200,'Ventas','System',''
CREATE     PROCEDURE [dbo].[ChangeStatus]
(
	@ITE_NOMBRE 		VARCHAR(50),-- ORDEN
	@TAS_NOMBRE 		VARCHAR(50),-- TAREA
	@ITS_STATUS		INT,        -- STATUS ACTUAL
	@USE_LOGIN		VARCHAR(50),-- EMPLEADO
	@ITS_MACHINE		VARCHAR(50) -- MAQUINA
)
AS

DECLARE
	@TAS_ID   	INT,
	@TAS_ID2  	INT,
	@ITE_ID         INT,
	@PRO_NOMBRE     VARCHAR(50)

        --SELECT * FROM tblItemTasks
	-- SELECT * FROM tblitems
	IF (@ITS_STATUS = 0) BEGIN
		UPDATE tblItemTasks SET ITS_Status = 1, USE_Login = @USE_LOGIN, 
		ITS_Machine = @ITS_MACHINE, ITS_DTStart = GETDATE()
		FROM tblItemTasks I
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE T.Nombre = @TAS_NOMBRE AND I.ITE_Nombre = @ITE_NOMBRE 
	END
	ELSE IF ( (@ITS_STATUS = 1) OR (@ITS_STATUS = 3) ) BEGIN
		print('entro')
		UPDATE tblItemTasks SET ITS_Status = 2, USE_Login = @USE_LOGIN, 
		ITS_Machine = @ITS_MACHINE, ITS_DTStop = GETDATE()
		FROM tblItemTasks I
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE T.Nombre = @TAS_NOMBRE AND I.ITE_Nombre = @ITE_NOMBRE 

		SELECT @TAS_ID = [ID] FROM tblTareas WHERE Nombre = @TAS_NOMBRE		
		SELECT @PRO_NOMBRE = PRO_Nombre, @ITE_ID = ITE_Id FROM tblItems WHERE ITE_NOMBRE = @ITE_NOMBRE
		
		SELECT @TAS_ID2 = Rou_To FROM tblRouting WHERE Nombre = @PRO_NOMBRE AND Rou_From = @TAS_ID
		DECLARE @TAS_NOMBRE2 AS VARCHAR(50)

		SELECT @TAS_NOMBRE2 = Nombre FROM tblTareas WHERE Id = @TAS_ID2
	
                DECLARE @NEWTASK_STATUS AS INT
		SELECT @NEWTASK_STATUS = 0
		
		IF ( @TAS_NOMBRE2 = 'Corte') BEGIN
			SELECT @NEWTASK_STATUS = 1
		END

		UPDATE tblItemTasks SET ITS_Status = @NEWTASK_STATUS,ITS_DTStart = GETDATE()
	        WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID2 AND ITE_Nombre = @ITE_NOMBRE
		
		IF (@ITS_STATUS = 3)
		BEGIN
 			UPDATE tblRetrabajo SET RET_Stop = GETDATE() WHERE ITE_Nombre = @ITE_NOMBRE
		END
	END
	ELSE BEGIN
		UPDATE tblItemTasks SET ITS_Status = 3, USE_Login = @USE_LOGIN, 
		ITS_Machine = @ITS_MACHINE, ITS_DTStart = GETDATE()
		FROM tblItemTasks I
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE T.Nombre = @TAS_NOMBRE AND I.ITE_Nombre = @ITE_NOMBRE 
	END



	IF (@@ERROR <> 0)
		SELECT 1 AS ERROR,'Ocurrio un error mientras se cambiaba la orden de status.' AS MSG
	ELSE 	
		SELECT 0 AS ERROR,@TAS_NOMBRE2   AS MSG





set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON




GO
