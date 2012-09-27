USE [Larco]
GO
/****** Object:  Trigger [dbo].[TD_tblOrdenes]    Script Date: 09/06/2012 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TD_tblOrdenes] ON [dbo].[tblOrdenes]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	-- Delete Records from tblAggregateValue
    DELETE FROM tblItems
    WHERE ITE_NOMBRE IN (SELECT ITE_NOMBRE FROM DELETED)

    DELETE FROM tblItemTasks
    WHERE ITE_NOMBRE IN (SELECT ITE_NOMBRE FROM DELETED)


    SET NOCOUNT OFF
END
