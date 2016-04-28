USE [Larco]
GO
/****** Object:  Trigger [TD_tblTareas]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TD_tblTareas] ON [dbo].[tblTareas]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	-- Delete Records from tblAggregateValue
	DELETE tblAggregateValue
    FROM tblAggregateValue A, DELETED D
    WHERE A.Task_ID = D.[ID]


    SET NOCOUNT OFF
END
GO
