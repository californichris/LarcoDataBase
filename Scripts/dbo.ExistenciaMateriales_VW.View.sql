USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ExistenciaMateriales_VW] AS
WITH ExistenciaMateriales AS ( 
SELECT MAT_ID, SUM(ED_Cantidad) AS Cantidad FROM tblEntradasDetalle GROUP BY MAT_ID
UNION
SELECT MAT_ID,(SUM(SD_Cantidad) * -1) AS Cantidad FROM tblSalidasDetalle GROUP BY MAT_ID
) SELECT MAT_ID, SUM(Cantidad) AS Existencia 
FROM ExistenciaMateriales GROUP BY MAT_ID


GO
