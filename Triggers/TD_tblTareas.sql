USE [Larco]
GO
/****** Object:  Trigger [dbo].[TD_tblTareas]    Script Date: 09/06/2012 22:34:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TD_tblTareas] ON [dbo].[tblTareas]
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
