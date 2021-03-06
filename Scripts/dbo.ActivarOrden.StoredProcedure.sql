USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ActivarOrden '06-044-007-15','Calidad'
-- ItemTasks '06-044-007-15


CREATE  PROCEDURE [dbo].[ActivarOrden]
	@ITE_NOMBRE AS VARCHAR(50),
	@TASK AS VARCHAR(50),
	@USER AS VARCHAR(50),
	@MACHINE AS VARCHAR(50)
AS 

DECLARE
	@TAS_ID		INT,
	@TAREA		VARCHAR(50),
        @STATUS         VARCHAR(50),
        @START          DATETIME,
	@STOP		DATETIME,
	@ENTRO		BIT

SET @ENTRO = 0

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N'tempdb..#tmpTasks'))
DROP TABLE #tmpTasks

CREATE TABLE [#tmpTasks] (
	[TAS_ID] [int] NULL
) ON [PRIMARY]


DECLARE @PRODUCTO AS VARCHAR(50)
SELECT @PRODUCTO = Producto FROM tblOrdenes WHERE ITE_Nombre = @ITE_NOMBRE

INSERT INTO #tmpTasks
SELECT ROU_From FROM tblRouting WHERE Nombre = @PRODUCTO

INSERT INTO #tmpTasks
SELECT ROU_To FROM tblRouting WHERE Nombre = @PRODUCTO
AND Rou_To NOT IN ( SELECT TAS_ID FROM #tmpTasks)


/**************************************************************************************************/
DECLARE Task_Cursor CURSOR FOR

	SELECT I.TAS_ID,T.Nombre AS Tarea,
	CASE WHEN I.ITS_Status = 0 THEN 'Listo'
	WHEN I.ITS_Status = 1 THEN 'Activo'
	WHEN I.ITS_Status = 2 THEN 'Terminado' END AS Status,
	ITS_DTStart AS Start,ITS_DTStop AS Stop
	from tblitemtasks I
	INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
	WHERE I.ITE_Nombre = @ITE_NOMBRE
	AND T.[ID] IN (SELECT TAS_ID FROM #tmpTasks)
	ORDER BY TAS_Order

OPEN Task_Cursor
/*GET FIRST RECORD INTO VARIABLE*/
FETCH NEXT FROM Task_Cursor INTO @TAS_ID,@TAREA,@STATUS,@START,@STOP
WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
BEGIN

	IF ( @ENTRO = 0) BEGIN

		IF( @TAREA = @TASK) BEGIN
			UPDATE tblItemTasks SET ITS_Status = 1,ITS_DTStart = GETDATE(),
			USE_LOGIN = @USER,ITS_Machine = @MACHINE
			WHERE TAS_ID = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE
			
			SET @ENTRO = 1
		END
	
		IF( @STATUS = 'Listo') BEGIN
			UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStart = GETDATE(), 
			ITS_DTStop = GETDATE(),USE_LOGIN = @USER,ITS_Machine = @MACHINE
			WHERE TAS_ID = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE
		END
	
		IF( @STATUS = 'Activo') AND (@ENTRO = 0) BEGIN
			print ('entro activo')
			UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStop = GETDATE(),
			USE_LOGIN = @USER,ITS_Machine = @MACHINE
			WHERE TAS_ID = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE
			
		END
	
		IF( @STATUS IS NULL ) AND (@ENTRO = 0) BEGIN
			UPDATE tblItemTasks SET ITS_Status = 2, ITS_DTStart = GETDATE(), 
			ITS_DTStop = GETDATE(),USE_LOGIN = @USER,ITS_Machine = @MACHINE
			WHERE TAS_ID = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE
		END
	END

   FETCH NEXT FROM Task_Cursor INTO @TAS_ID,@TAREA,@STATUS,@START,@STOP
 END
/*CLOSE CURSOR*/
CLOSE Task_Cursor
DEALLOCATE Task_Cursor

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON



GO
