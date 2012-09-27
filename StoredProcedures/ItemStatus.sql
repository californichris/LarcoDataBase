USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[ItemStatus]    Script Date: 09/06/2012 22:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ItemStatus '06-002-002-05','Calidad'
-- ItemStatus '06-044-007-15','Almacen'
ALTER    PROCEDURE [dbo].[ItemStatus]
	@ITE_NOMBRE AS VARCHAR(50),
	@TASK AS VARCHAR(50)
AS 

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N'tempdb..#tmpTasks'))
DROP TABLE #tmpTasks

CREATE TABLE [#tmpTasks] (
	[TAS_ID] [int] NULL
) ON [PRIMARY]

DECLARE @NOMBRE AS VARCHAR(50)
DECLARE @STATUS AS INT
DECLARE @RES AS INT
DECLARE @CURRENTTASK AS VARCHAR(50)
DECLARE @PRODUCTO AS VARCHAR(50)
DECLARE @MSG AS VARCHAR(150)

SELECT @NOMBRE = ITE_Nombre,@PRODUCTO = Producto FROM tblOrdenes WHERE ITE_Nombre = @ITE_NOMBRE

IF( @NOMBRE IS NULL) BEGIN
	print('entro')
	SELECT @RES = 0,@MSG = 'La Orden no existe en el sistema.',@CURRENTTASK = '',@STATUS = 0
	GOTO LBLMSG
END

INSERT INTO #tmpTasks
SELECT ROU_From FROM tblRouting WHERE Nombre = @PRODUCTO

INSERT INTO #tmpTasks
SELECT ROU_To FROM tblRouting WHERE Nombre = @PRODUCTO
AND Rou_To NOT IN ( SELECT TAS_ID FROM #tmpTasks)

SELECT @CURRENTTASK = T2.Nombre 
FROM #tmpTasks T
INNER JOIN tblTareas T2 ON T.TAS_ID = T2.ID
WHERE T2.Nombre = @TASK

IF( @CURRENTTASK IS NULL) BEGIN
	SELECT @CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
	FROM tblItemTasks I
	INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
	WHERE I.ITE_Nombre = @ITE_NOMBRE
	AND I.ITS_Status IS NOT NULL AND I.ITS_DTStop IS NULL

	IF( @CURRENTTASK IS NULL) BEGIN
		SELECT TOP 1 @CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
		FROM tblItemTasks I 
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE ITE_Nombre = @ITE_NOMBRE AND I.ITS_Status IS NOT NULL
		ORDER BY TAS_Order DESC
	END

	SELECT @RES = 0,@MSG = 'La Orden es un ' + @PRODUCTO + ' no le corresponde esta tarea.'
	GOTO LBLMSG
END


SELECT @STATUS = I.ITS_STATUS FROM tblItemTasks I
INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
WHERE I.ITE_Nombre = @ITE_NOMBRE AND T.Nombre = @TASK

IF (@STATUS = 2) BEGIN
	SELECT @CURRENTTASK = NULL

	SELECT @CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
	FROM tblItemTasks I
	INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
	WHERE I.ITE_Nombre = @ITE_NOMBRE
	AND I.ITS_Status IS NOT NULL AND I.ITS_DTStop IS NULL

	IF( @CURRENTTASK IS NULL) BEGIN
		SELECT TOP 1 @CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
		FROM tblItemTasks I 
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE ITE_Nombre = @ITE_NOMBRE AND I.ITS_Status IS NOT NULL
		ORDER BY TAS_Order DESC

		SELECT @RES = 0,@MSG = 'La Orden ya esta completa en esta tarea.'
		GOTO LBLMSG		
	END
	ELSE BEGIN
		SELECT @RES = 0,@MSG = 'La Orden ya esta completa en esta tarea.'
		GOTO LBLMSG
	END
END
ELSE IF ( (@STATUS = 0) OR (@STATUS = 1) ) BEGIN
	SELECT @RES = 1,@MSG = '',@CURRENTTASK = @TASK
	GOTO LBLMSG
END
ELSE IF ( @STATUS = 9 ) BEGIN
	SELECT TOP 1 @RES = 0,@MSG = 'La orden fue scrapeada el dia ' + CONVERT(VARCHAR(10),SCR_Fecha,101),
	@CURRENTTASK = ''
        FROM tblScrap WHERE ITE_Nombre = '06-002-002-05'

	-- SELECT @RES = 0,@MSG = 'La orden fue scrapeada.',@CURRENTTASK = ''
	GOTO LBLMSG
END
ELSE BEGIN
	SELECT @CURRENTTASK = NULL

	SELECT @RES = 1,@MSG = '',@CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
	FROM tblItemTasks I
	INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
	WHERE I.ITE_Nombre = @ITE_NOMBRE
	AND I.ITS_Status IS NOT NULL AND I.ITS_DTStop IS NULL

	IF( @CURRENTTASK IS NULL) BEGIN
		SELECT TOP 1 @CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
		FROM tblItemTasks I 
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE ITE_Nombre = @ITE_NOMBRE AND I.ITS_Status IS NOT NULL
		ORDER BY TAS_Order DESC

		SELECT @RES = 0,@MSG = ''
		GOTO LBLMSG		
	END

	GOTO LBLMSG
END


LBLMSG:
	SELECT @RES AS Res,@MSG AS Msg,@CURRENTTASK AS Task,@STATUS AS Status





set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
