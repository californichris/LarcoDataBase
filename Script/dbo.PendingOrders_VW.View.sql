USE [Larco]
GO
/****** Object:  View [dbo].[PendingOrders_VW]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PendingOrders_VW]'))
DROP VIEW [dbo].[PendingOrders_VW]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PendingOrders_VW]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[PendingOrders_VW] AS

SELECT * 
FROM tblItemTasks IT
WHERE IT.ITS_DTStart IS NOT NULL AND IT.ITS_DTStop IS NULL AND IT.ITS_Status NOT IN (9,3)
AND SUBSTRING(IT.ITE_Nombre,4,3) NOT IN (''004'',''005'',''010'',''060'',''062'',''162'',''699'',''799'',''862'',''899'',''999'',''960'') 	


'
GO
