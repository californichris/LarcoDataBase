USE [Larco]
GO
/****** Object:  View [dbo].[Routing_VW]    Script Date: 11/16/2015 14:43:41 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Routing_VW]'))
DROP VIEW [dbo].[Routing_VW]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Routing_VW]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Routing_VW] AS

SELECT Rou_Id, Nombre AS Product, Rou_From as TaskId
FROM tblRouting
UNION
SELECT Rou_Id, Nombre AS Product, Rou_To AS TaskId 
FROM tblRouting
WHERE Nombre + CAST(Rou_To AS VARCHAR(10)) NOT IN (SELECT Nombre + CAST(Rou_From AS VARCHAR(10)) FROM tblRouting)
'
GO
