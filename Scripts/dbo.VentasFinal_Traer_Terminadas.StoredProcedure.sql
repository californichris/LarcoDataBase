USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[VentasFinal_Traer_Terminadas]
(
  @TASK   AS VARCHAR(50),
  @FILTER AS VARCHAR(1000)
)
AS

	if exists (select * from tempdb..sysobjects where id = object_id(N'tempdb..#tmpTerminadas'))
	drop table #tmpTerminadas

	CREATE TABLE [#tmpTerminadas] (
		[ITE_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[ITE_Nombre] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[Late] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[ITE_Status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[ITS_DTStop] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	) ON [PRIMARY]

	DECLARE @SQL AS VARCHAR(8000)

	SET @SQL = 'INSERT INTO #tmpTerminadas SELECT I.ITE_ID,RTRIM(I.ITE_Nombre) AS ITE_Nombre, ' + 
	'CASE WHEN ITS_Status = 2 THEN 0 ' + 
	'WHEN dbo.GetHours(I.ITS_DTStart,GETDATE()) > T.Tiempo THEN 1 ' + 
	'WHEN dbo.GetHours(O.Interna,GETDATE()) > T.Interno THEN 1 ' + 
	'WHEN I2.ITE_Priority > 0.00 THEN 2 ELSE 0 END AS Late, ' +  
	'I2.ITE_Status, ' + 
	'I.ITS_DTStop ' +    
	'FROM tblItemTasks I ' + 
	'INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] AND T.[ID] = ' + @TASK + 
	'INNER JOIN tblItems I2 ON I2.ITE_ID = I.ITE_ID ' + 
	'INNER JOIN tblOrdenes O ON I.ITE_ID = O.ITE_ID ' + 
	'WHERE I.ITS_Status = 2 ' + @FILTER +
	'ORDER BY I.ITS_DTStart Desc'

	PRINT(@SQL) 
    EXEC(@SQL)
    
	SELECT * FROM #tmpTerminadas WHERE ITS_DTStop > DATEADD(dd,-2,GETDATE())




GO
