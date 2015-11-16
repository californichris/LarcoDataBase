USE [Larco]
GO
/****** Object:  Trigger [TI_tblproductos]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblproductos]'))
DROP TRIGGER [dbo].[TI_tblproductos]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblproductos]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TI_tblproductos] ON [dbo].[tblProductos]
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

'
GO
