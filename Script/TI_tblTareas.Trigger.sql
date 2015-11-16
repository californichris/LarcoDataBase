USE [Larco]
GO
/****** Object:  Trigger [TI_tblTareas]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblTareas]'))
DROP TRIGGER [dbo].[TI_tblTareas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblTareas]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TI_tblTareas] ON [dbo].[tblTareas]
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


'
GO
