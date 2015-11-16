USE [Larco]
GO
/****** Object:  Trigger [TD_tblproductos]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblproductos]'))
DROP TRIGGER [dbo].[TD_tblproductos]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblproductos]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TD_tblproductos] ON [dbo].[tblProductos]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	-- Delete Records from tblAggregateValue
	DELETE tblAggregateValue
    FROM tblAggregateValue A, DELETED D
    WHERE A.Product_ID = D.[ID]


    SET NOCOUNT OFF
END
'
GO
