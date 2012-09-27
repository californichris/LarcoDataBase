USE [Larco]
GO
/****** Object:  Trigger [dbo].[TI_tblTareas]    Script Date: 09/06/2012 22:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TI_tblTareas] ON [dbo].[tblTareas]
FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON
    
	DECLARE @TASK AS INT
	SELECT @TASK = [ID] FROM INSERTED I

	INSERT INTO tblAggregateValue(Product_ID, Task_ID, [Value]) 
    SELECT [ID], @TASK, 1.00 FROM tblProductos ORDER BY [ID]

    SET NOCOUNT OFF
END
