USE [Larco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TD_tblproductos] ON [dbo].[tblProductos]
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
GO
