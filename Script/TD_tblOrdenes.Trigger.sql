USE [Larco]
GO
/****** Object:  Trigger [TD_tblOrdenes]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblOrdenes]'))
DROP TRIGGER [dbo].[TD_tblOrdenes]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblOrdenes]'))
EXEC dbo.sp_executesql @statement = N'
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

'
GO
