select * from tblEntradasDetalle where MAT_ID in (174,305)
update tblEntradasDetalle set ED_Restante = ED_Cantidad where MAT_ID in (174,305)

select * from tblEntradasDetalle where MAT_ID in (174,305)
select * from tblSalidasDetalle where MAT_ID in (174,305)

CREATE VIEW [dbo].[ExistenciaMateriales_VW] AS
WITH ExistenciaMateriales AS ( 
SELECT MAT_ID, SUM(ED_Cantidad) AS Cantidad FROM tblEntradasDetalle GROUP BY MAT_ID
UNION
SELECT MAT_ID,(SUM(SD_Cantidad) * -1) AS Cantidad FROM tblSalidasDetalle GROUP BY MAT_ID
) SELECT MAT_ID, SUM(Cantidad) AS Existencia 
FROM ExistenciaMateriales GROUP BY MAT_ID



GO

WITH FilteredTable AS ( SELECT M.[MAT_ID],J1.MAT_Numero,J1.MAT_ProvNumero,J1.MAT_Descripcion,M.[ED_Cantidad],M.[ED_Costo],M.[ENT_ID],M.[ED_Restante],M.[ED_ID],ROW_NUMBER() OVER (ORDER BY J1.[MAT_Numero] asc) AS RowNumber FROM [tblEntradasDetalle] M  INNER  JOIN [tblMateriales] J1 ON M.[MAT_ID] = J1.MAT_ID   WHERE ( J1.[MAT_Numero] LIKE @p0 OR J1.[MAT_ProvNumero] LIKE @p1 OR J1.[MAT_Descripcion] LIKE @p2 OR M.[ED_Cantidad] LIKE @p3 OR M.[ED_Costo] LIKE @p4 )  ) 
SELECT * FROM FilteredTable  WHERE RowNumber BETWEEN 1 AND 25


select M.MAT_ID, M.MAT_Cantidad, MV.Existencia from tblMateriales M
inner join [ExistenciaMateriales_VW] MV on M.MAT_ID = MV.MAT_ID
where M.MAT_Cantidad <> MV.Existencia

select * from tblEntradas order by ent_id desc

delete from tblEntradas where ENT_ID = 6754


CREATE VIEW [dbo].[CostosMateriales_VW] AS
SELECT MAT_ID, AVG(ED_Costo) AS CostoPromedio FROM tblEntradasDetalle GROUP BY MAT_ID
GO

select * from [ExistenciaMateriales_VW] where MAT_ID not in (select MAT_ID from tblMateriales)
select * from CostosMateriales_VW where MAT_ID not in (select MAT_ID from tblMateriales)

select MAT_ID from tblMateriales where MAT_ID not in (select MAT_ID from [ExistenciaMateriales_VW])
select MAT_ID from tblMateriales where MAT_ID not in (select MAT_ID from CostosMateriales_VW)

SELECT * FROM tblMateriales WHERE mat_id = 1098

SELECT M.MAT_ID, 
CASE WHEN E.Existencia IS NULL THEN 0.0 ELSE E.Existencia END AS Existencia,
CASE WHEN C.CostoPromedio IS NULL THEN 0.0 ELSE C.CostoPromedio END AS CostoPromedio,
FROM tblMateriales M
LEFT OUTER JOIN ExistenciaMateriales_VW  E ON M.MAT_ID = E.MAT_ID
LEFT OUTER JOIN CostosMateriales_VW C on M.MAT_ID = C.MAT_ID
WHERE M.mat_id = 1098