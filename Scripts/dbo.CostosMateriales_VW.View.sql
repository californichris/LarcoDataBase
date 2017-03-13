USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CostosMateriales_VW] AS
SELECT MAT_ID, AVG(ED_Costo) AS CostoPromedio FROM tblEntradasDetalle GROUP BY MAT_ID

GO
