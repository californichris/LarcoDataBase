USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- ItemTasks '06-067-310-01'
CREATE     PROCEDURE [dbo].[ItemTasks]
	@ITE_NOMBRE AS VARCHAR(50)
AS 


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

-- select * from #tmpTasks

SELECT I.TAS_ID,T.Nombre AS Tarea,
DEC_NOTE AS Status,
--CASE WHEN I.ITS_Status = 0 THEN 'Listo'
--WHEN I.ITS_Status = 1 THEN 'Activo'
--WHEN I.ITS_Status = 2 THEN 'Terminado' END AS Status,
ITS_DTStart AS Start,ITS_DTStop AS Stop,I.USE_Login AS Login
from tblitemtasks I
INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
LEFT OUTER JOIN tblDescriptions D ON D.DES_CODE = I.ITS_Status
WHERE I.ITE_Nombre = @ITE_NOMBRE
AND T.[ID] IN (SELECT TAS_ID FROM #tmpTasks)
ORDER BY TAS_Order







set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON



GO
