USE [Larco]
GO
/****** Object:  Trigger [TD_tblFacturasDetalle]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create         TRIGGER [dbo].[TD_tblFacturasDetalle] ON [dbo].[tblFacturasDetalle]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE 
	@ITE_NOMBRE	VARCHAR(50),
	@STOCK		BIT

	/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
	DECLARE Facturas_Deleted CURSOR FOR
	
	SELECT ITE_NOMBRE,FD_Stock FROM DELETED
	
	/*OPEN CURSOR*/
	OPEN Facturas_Deleted
	/*GET FIRST RECORD INTO VARIABLE*/
	FETCH NEXT FROM Facturas_Deleted INTO @ITE_NOMBRE,@STOCK
	WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
	BEGIN
	
		IF(@STOCK = 0)BEGIN
		UPDATE tblOrdenes SET FAC_ID = NULL WHERE ITE_NOMBRE = @ITE_NOMBRE
		END ELSE BEGIN
		UPDATE tblStockOrdenes SET FAC_ID = NULL WHERE ITE_NOMBRE = @ITE_NOMBRE
		END

	   FETCH NEXT FROM Facturas_Deleted INTO @ITE_NOMBRE,@STOCK
	END
	
	/*CLOSE CURSOR*/
	CLOSE Facturas_Deleted
	DEALLOCATE Facturas_Deleted

    SET NOCOUNT OFF
END
GO
