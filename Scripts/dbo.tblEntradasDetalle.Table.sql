USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEntradasDetalle](
	[ED_ID] [int] IDENTITY(1,1) NOT NULL,
	[ENT_ID] [int] NOT NULL,
	[MAT_ID] [int] NOT NULL,
	[ED_Cantidad] [int] NOT NULL,
	[ED_Costo] [int] NOT NULL,
	[ED_Restante] [decimal](18, 2) NULL,
	[SL_Desp] [int] NULL,
 CONSTRAINT [pk_EntradasDetalleId] PRIMARY KEY CLUSTERED 
(
	[ED_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblEntradasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_EntradasDetalle_Entradas] FOREIGN KEY([ENT_ID])
REFERENCES [dbo].[tblEntradas] ([ENT_ID])
GO
ALTER TABLE [dbo].[tblEntradasDetalle] CHECK CONSTRAINT [FK_EntradasDetalle_Entradas]
GO
ALTER TABLE [dbo].[tblEntradasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_EntradasDetalle_Materiales] FOREIGN KEY([MAT_ID])
REFERENCES [dbo].[tblMateriales] ([MAT_ID])
GO
ALTER TABLE [dbo].[tblEntradasDetalle] CHECK CONSTRAINT [FK_EntradasDetalle_Materiales]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE        TRIGGER [dbo].[TD_tblEntradasDetalle] ON [dbo].[tblEntradasDetalle]
AFTER DELETE
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
		SELECT @MAT_ID = M.MAT_ID, 
		@ED_CANTIDAD = CASE WHEN E.Existencia IS NULL THEN 0.0 ELSE E.Existencia END,
		@COSTO_AVG = CASE WHEN C.CostoPromedio IS NULL THEN 0.0 ELSE C.CostoPromedio END
		FROM tblMateriales M
		LEFT OUTER JOIN ExistenciaMateriales_VW  E ON M.MAT_ID = E.MAT_ID
		LEFT OUTER JOIN CostosMateriales_VW C on M.MAT_ID = C.MAT_ID
		WHERE M.MAT_ID = @MAT_ID
 
	    SELECT TOP 1 @PROV_ID = E.PROV_ID, @ED_COSTO = CASE WHEN I.ED_Costo IS NULL THEN 0.0 ELSE I.ED_Costo END  
	    FROM tblEntradasDetalle I 
	    INNER JOIN tblEntradas E ON I.ENT_ID = E.ENT_ID
	    WHERE MAT_ID = @MAT_ID 
		ORDER BY  ENT_Fecha DESC ,ED_ID DESC
	    
	    UPDATE tblMateriales 
		SET MAT_Cantidad = @ED_CANTIDAD, MAT_UltimoCosto = @ED_COSTO, MAT_UltimoProvedor = @PROV_ID, MAT_CostoPromedio = @COSTO_AVG 
	    WHERE MAT_ID = @MAT_ID

	   FETCH NEXT FROM Materiales_Deleted INTO @MAT_ID
	END
	
	/*CLOSE CURSOR*/
	CLOSE Materiales_Deleted
	DEALLOCATE Materiales_Deleted

	INSERT INTO tblEntradasDetalle_History
	SELECT * FROM DELETED


    SET NOCOUNT OFF
END











GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TI_tblEntradasDetalle] ON [dbo].[tblEntradasDetalle]
AFTER INSERT, UPDATE 
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE 
	@MAT_ID			INT,
	@ED_CANTIDAD	DECIMAL(18,2),
	@ED_COSTO		DECIMAL(18,2),
	@PROV_ID		INT,
	@COSTO_AVG      DECIMAL(18,2),
	@TOTAL          DECIMAL(18,2),
	@ENT_ID			INT

    SELECT @MAT_ID = I.MAT_ID, @ED_COSTO = ED_Costo, @ENT_ID = ENT_ID FROM INSERTED I
    --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
    --INSERT INTO tmpEmpleados(Nombre) SELECT 'Entro a TI_tblEntradasDetalle matID: ' + CAST(@MAT_ID AS varchar(10)) 

	SELECT @MAT_ID = M.MAT_ID, 
	@ED_CANTIDAD = CASE WHEN E.Existencia IS NULL THEN 0.0 ELSE E.Existencia END,
	@COSTO_AVG = CASE WHEN C.CostoPromedio IS NULL THEN 0.0 ELSE C.CostoPromedio END
	FROM tblMateriales M
	LEFT OUTER JOIN ExistenciaMateriales_VW  E ON M.MAT_ID = E.MAT_ID
	LEFT OUTER JOIN CostosMateriales_VW C on M.MAT_ID = C.MAT_ID
	WHERE M.MAT_ID = @MAT_ID

    --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
    /*INSERT INTO tmpEmpleados(Nombre) 
    SELECT 'Entro a TI_tblEntradasDetalle @COSTO_AVG:' + CAST(@COSTO_AVG AS varchar(10)) + ', @ED_CANTIDAD:' + 
    CAST(@ED_CANTIDAD AS varchar(10))
	*/

    SELECT TOP 1 @PROV_ID = PROV_ID FROM tblEntradas WHERE ENT_ID = @ENT_ID
    --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
    /*INSERT INTO tmpEmpleados(Nombre)
    SELECT 'Entro a TI_tblEntradasDetalle @PROV_ID:' + CAST(@PROV_ID AS varchar(10)) + ', @ED_COSTO:' + 
    CAST(@ED_COSTO AS varchar(10))
    */

    UPDATE tblMateriales SET MAT_Cantidad = @ED_CANTIDAD, MAT_UltimoCosto = @ED_COSTO, 
    MAT_UltimoProvedor = @PROV_ID, MAT_CostoPromedio = @COSTO_AVG, MAT_Total = @TOTAL 
    WHERE MAT_ID = @MAT_ID

    SET NOCOUNT OFF
END









GO
