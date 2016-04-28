USE [Larco]
GO
/****** Object:  Trigger [TI_tblproductos]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TI_tblproductos] ON [dbo].[tblProductos]
FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON
    
	DECLARE @PRODUCT AS INT
	SELECT @PRODUCT = [ID] FROM INSERTED I

	INSERT INTO tblAggregateValue(Product_ID, Task_ID, [Value]) 
    SELECT @PRODUCT,[ID],1.00 FROM tbltareas ORDER BY [ID]

    SET NOCOUNT OFF
END
GO
