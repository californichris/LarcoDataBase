USE [Larco]
GO
/****** Object:  Trigger [TI_tblFacturasDetalle]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblFacturasDetalle]'))
DROP TRIGGER [dbo].[TI_tblFacturasDetalle]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblFacturasDetalle]'))
EXEC dbo.sp_executesql @statement = N'
create        TRIGGER [dbo].[TI_tblFacturasDetalle] ON [dbo].[tblFacturasDetalle]
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

'
GO
