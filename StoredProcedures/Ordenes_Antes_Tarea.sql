USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Ordenes_Antes_Tarea]    Script Date: 09/06/2012 22:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Ordenes_Antes_Tarea 'VentasFinal',' AND  SUBSTRING(I.ITE_Nombre,4,3)  = ''036'''
ALTER   PROCEDURE [dbo].[Ordenes_Antes_Tarea]
  @TASK   AS VARCHAR(50),
  @FILTER AS VARCHAR(1000)
AS 

DECLARE @ISLAST AS BIT
DECLARE @SQL AS VARCHAR(8000)

SELECT @ISLAST = IsLast FROM tblTareas WHERE Nombre = @TASK

IF (@ISLAST = 0) BEGIN
		SET @SQL = 'SELECT COUNT(*) AS Antes ' + 
			   'FROM tblItemTasks I ' +
			   'INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] ' +
			   'INNER JOIN tblOrdenes O ON I.ITE_ID = O.ITE_ID ' +
               'INNER JOIN tblItems I2 ON I2.ITE_ID = I.ITE_ID ' +
			   'INNER JOIN tblRouting R2 ON R2.Nombre = O.Producto AND R2.Rou_From = I.TAS_Id ' +
			   'WHERE T.Nombre = ''' + @TASK + ''' AND I.ITS_Status IS NULL '
END
ELSE BEGIN
		SET @SQL = 'SELECT COUNT(*) AS Antes ' + 
			   'FROM tblItemTasks I ' +
			   'INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] ' +
			   'INNER JOIN tblOrdenes O ON I.ITE_ID = O.ITE_ID ' +
               'INNER JOIN tblItems I2 ON I2.ITE_ID = I.ITE_ID ' +
			   'INNER JOIN tblRouting R2 ON R2.Nombre = O.Producto AND R2.Rou_TO = I.TAS_Id ' +
			   'WHERE T.Nombre = ''' + @TASK + ''' AND I.ITS_Status IS NULL '
END

PRINT(@SQL + @FILTER) 
EXEC(@SQL + @FILTER)
