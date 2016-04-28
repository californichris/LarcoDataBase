USE [Larco]
GO
/****** Object:  Trigger [TD_tblSalidas]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE        TRIGGER [dbo].[TD_tblSalidas] ON [dbo].[tblSalidas]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON

    INSERT INTO tblSalidas_History
    SELECT *,'Delete',GETDATE() FROM DELETED

    SET NOCOUNT OFF
END
GO
