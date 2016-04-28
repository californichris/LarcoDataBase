USE [Larco]
GO
/****** Object:  Trigger [TI_tblMateriales]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  TRIGGER [dbo].[TI_tblMateriales] ON [dbo].[tblMateriales]
FOR INSERT
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE 
	@ENT_ID			INT,
	@MAT_CANTIDAD		DECIMAL(18,2),
	@MAT_ID			INT

    SELECT @ENT_ID = ENT_ID FROM tblEntradas WHERE ENT_Pedimento = 'N/A'

    IF (@ENT_ID IS NULL) BEGIN
	INSERT INTO 
	tblEntradas(ENT_Pedimento, ENT_ClavePedimento, ENT_Fecha, ENT_PaisOrigen,
	ENT_Nacional, ENT_TipoImp, ENT_Factura, ENT_OrdenCompra, PROV_ID, ENT_IVA,
	USE_ID, ENT_Dolares, ENT_TipoCambio, ENT_Desp)
	SELECT 'N/A','N/A',GETDATE(),2,'Nacional','','N/A','N/A',3,0,14,0,1.00,NULL 
    END

    SELECT @ENT_ID = ENT_ID FROM tblEntradas WHERE ENT_Pedimento = 'N/A'
    --select * from tblMateriales
    SELECT @MAT_CANTIDAD = MAT_CANTIDAD, @MAT_ID = MAT_ID FROM INSERTED 

    INSERT INTO tblEntradasDetalle(ENT_ID, MAT_ID, ED_Cantidad, ED_Costo, ED_Restante, SL_Desp)
    SELECT @ENT_ID, @MAT_ID, @MAT_CANTIDAD, 0.0, @MAT_CANTIDAD,NULL 
END
GO
