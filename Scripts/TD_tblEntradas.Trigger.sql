USE [Larco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE        TRIGGER [dbo].[TD_tblEntradas] ON [dbo].[tblEntradas]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON

    INSERT INTO tblEntradas_History
    SELECT *,'Delete',GETDATE() FROM DELETED

    SET NOCOUNT OFF
END
GO
