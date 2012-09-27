USE [Larco]
GO
/****** Object:  Trigger [dbo].[TI_tblFacturasDetalle]    Script Date: 09/06/2012 22:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER        TRIGGER [dbo].[TI_tblFacturasDetalle] ON [dbo].[tblFacturasDetalle]
FOR INSERT, UPDATE
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE 
	@ITE_NOMBRE	VARCHAR(50),
	@FAC_ID		INT,
	@STOCK		BIT

    SELECT @ITE_NOMBRE = I.ITE_NOMBRE, @STOCK = FD_Stock, @FAC_ID = FAC_ID  
    FROM INSERTED I

    IF(@STOCK = 0)BEGIN
	UPDATE tblOrdenes SET FAC_ID = @FAC_ID WHERE ITE_NOMBRE = @ITE_NOMBRE
    END ELSE BEGIN
	UPDATE tblStockOrdenes SET FAC_ID = @FAC_ID WHERE ITE_NOMBRE = @ITE_NOMBRE
    END

    SET NOCOUNT OFF
END
