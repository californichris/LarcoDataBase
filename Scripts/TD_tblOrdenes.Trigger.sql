USE [Larco]
GO
/****** Object:  Trigger [TD_tblOrdenes]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TD_tblOrdenes] ON [dbo].[tblOrdenes]
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
GO
