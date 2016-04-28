USE [Larco]
GO
/****** Object:  View [dbo].[PendingOrders_VW]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PendingOrders_VW] AS

SELECT * 
FROM tblItemTasks IT
WHERE IT.ITS_DTStart IS NOT NULL AND IT.ITS_DTStop IS NULL AND IT.ITS_Status NOT IN (9,3)
AND SUBSTRING(IT.ITE_Nombre,4,3) NOT IN ('004','005','010','060','062','162','699','799','862','899','999','960')
GO
