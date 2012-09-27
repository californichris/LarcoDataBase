USE [Larco]
GO
/****** Object:  Trigger [dbo].[TD_tblEntradas]    Script Date: 09/06/2012 22:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER        TRIGGER [dbo].[TD_tblEntradas] ON [dbo].[tblEntradas]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON

    INSERT INTO tblEntradas_History
    SELECT *,'Delete',GETDATE() FROM DELETED

    SET NOCOUNT OFF
END
