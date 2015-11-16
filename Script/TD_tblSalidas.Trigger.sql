USE [Larco]
GO
/****** Object:  Trigger [TD_tblSalidas]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblSalidas]'))
DROP TRIGGER [dbo].[TD_tblSalidas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblSalidas]'))
EXEC dbo.sp_executesql @statement = N'








CREATE        TRIGGER [dbo].[TD_tblSalidas] ON [dbo].[tblSalidas]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON

    INSERT INTO tblSalidas_History
    SELECT *,''Delete'',GETDATE() FROM DELETED

    SET NOCOUNT OFF
END










'
GO
