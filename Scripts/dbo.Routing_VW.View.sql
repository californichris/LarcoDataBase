USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Routing_VW] AS

SELECT Rou_Id, Nombre AS Product, Rou_From as TaskId
FROM tblRouting
UNION
SELECT Rou_Id, Nombre AS Product, Rou_To AS TaskId 
FROM tblRouting
WHERE Nombre + CAST(Rou_To AS VARCHAR(10)) NOT IN (SELECT Nombre + CAST(Rou_From AS VARCHAR(10)) FROM tblRouting)

GO
