USE [Larco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE        TRIGGER [dbo].[TD_tblEntradasDetalle] ON [dbo].[tblEntradasDetalle]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE 
	@MAT_ID			INT,
	@ED_CANTIDAD		DECIMAL(18,2),
	@ED_COSTO		DECIMAL(18,2),
	@PROV_ID		INT,
	@COSTO_AVG              DECIMAL(18,2)

	/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
	DECLARE Materiales_Deleted CURSOR FOR
	
	SELECT MAT_ID FROM DELETED
	
	/*OPEN CURSOR*/
	OPEN Materiales_Deleted
	/*GET FIRST RECORD INTO VARIABLE*/
	FETCH NEXT FROM Materiales_Deleted INTO @MAT_ID
	WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
	BEGIN
	
	    SELECT @COSTO_AVG = CASE WHEN AVG(ED_Costo) IS NULL THEN 0.0 ELSE AVG(ED_Costo) END,
	    @ED_CANTIDAD = CASE WHEN SUM(ED_Restante) IS NULL THEN 0.0 ELSE SUM(ED_Restante) END 
	    FROM tblEntradasDetalle WHERE MAT_ID = @MAT_ID
	
	    SELECT TOP 1 @PROV_ID = E.PROV_ID, 
            @ED_COSTO = CASE WHEN I.ED_Costo IS NULL THEN 0.0 ELSE I.ED_Costo END  
	    FROM tblEntradasDetalle I 
	    INNER JOIN tblEntradas E ON I.ENT_ID = E.ENT_ID
	    WHERE MAT_ID = @MAT_ID ORDER BY  ENT_Fecha DESC ,ED_ID DESC
	    
	    UPDATE tblMateriales SET MAT_Cantidad = @ED_CANTIDAD, MAT_UltimoCosto = @ED_COSTO, 
	    MAT_UltimoProvedor = @PROV_ID, MAT_CostoPromedio = @COSTO_AVG 
	    WHERE MAT_ID = @MAT_ID

	   FETCH NEXT FROM Materiales_Deleted INTO @MAT_ID
	END
	
	--DROP TABLE ##TBLEXPORTBU
	/*CLOSE CURSOR*/
	CLOSE Materiales_Deleted
	DEALLOCATE Materiales_Deleted

	INSERT INTO tblEntradasDetalle_History
	SELECT * FROM DELETED


    SET NOCOUNT OFF
END
GO
