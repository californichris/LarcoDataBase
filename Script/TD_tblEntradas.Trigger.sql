USE [Larco]
GO
/****** Object:  Trigger [TD_tblEntradas]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblEntradas]'))
DROP TRIGGER [dbo].[TD_tblEntradas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblEntradas]'))
EXEC dbo.sp_executesql @statement = N'








CREATE        TRIGGER [dbo].[TD_tblEntradas] ON [dbo].[tblEntradas]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON

    INSERT INTO tblEntradas_History
    SELECT *,''Delete'',GETDATE() FROM DELETED

    SET NOCOUNT OFF
END










'
GO
