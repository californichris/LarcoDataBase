USE [Larco]
GO
/****** Object:  Trigger [TI_tblEntradasDetalle]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblEntradasDetalle]'))
DROP TRIGGER [dbo].[TI_tblEntradasDetalle]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblEntradasDetalle]'))
EXEC dbo.sp_executesql @statement = N'







CREATE        TRIGGER [dbo].[TI_tblEntradasDetalle] ON [dbo].[tblEntradasDetalle]
FOR INSERT, UPDATE
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE 
	@MAT_ID			INT,
	@ED_CANTIDAD		DECIMAL(18,2),
	@ED_COSTO		DECIMAL(18,2),
	@PROV_ID		INT,
	@COSTO_AVG              DECIMAL(18,2),
	@TOTAL                  DECIMAL(18,2),
	@ENT_ID			INT

    SELECT @MAT_ID = I.MAT_ID, @ED_COSTO = ED_Costo, @ENT_ID = ENT_ID FROM INSERTED I
    --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
    --INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a TI_tblEntradasDetalle matID: '' + CAST(@MAT_ID AS varchar(10)) 


    SELECT @COSTO_AVG = CASE WHEN AVG(ED_Costo) IS NULL THEN 0.0 ELSE AVG(ED_Costo) END,
    @ED_CANTIDAD = CASE WHEN SUM(ED_Restante) IS NULL THEN 0.0 ELSE SUM(ED_Restante) END,
    @TOTAL = CASE WHEN SUM(ED_Restante * ED_Costo) IS NULL THEN 0.0 ELSE SUM(ED_Restante * ED_Costo) END
    FROM tblEntradasDetalle WHERE MAT_ID = @MAT_ID
    
    --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
    --INSERT INTO tmpEmpleados(Nombre) 
    --SELECT ''Entro a TI_tblEntradasDetalle @COSTO_AVG:'' + CAST(@COSTO_AVG AS varchar(10)) + '', @ED_CANTIDAD:'' + 
    --CAST(@ED_CANTIDAD AS varchar(10))


    SELECT TOP 1 @PROV_ID = PROV_ID FROM tblEntradas WHERE ENT_ID = @ENT_ID
    --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
    --INSERT INTO tmpEmpleados(Nombre)
    --SELECT ''Entro a TI_tblEntradasDetalle @PROV_ID:'' + CAST(@PROV_ID AS varchar(10)) + '', @ED_COSTO:'' + 
    --CAST(@ED_COSTO AS varchar(10))
    
    UPDATE tblMateriales SET MAT_Cantidad = @ED_CANTIDAD, MAT_UltimoCosto = @ED_COSTO, 
    MAT_UltimoProvedor = @PROV_ID, MAT_CostoPromedio = @COSTO_AVG, MAT_Total = @TOTAL 
    WHERE MAT_ID = @MAT_ID

    SET NOCOUNT OFF
END








'
GO
