USE [Larco]
GO
/****** Object:  Trigger [dbo].[TD_tblSalidas]    Script Date: 09/06/2012 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER        TRIGGER [dbo].[TD_tblSalidas] ON [dbo].[tblSalidas]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON

    INSERT INTO tblSalidas_History
    SELECT *,'Delete',GETDATE() FROM DELETED

    SET NOCOUNT OFF
END
