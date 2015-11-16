USE [Larco]
GO
/****** Object:  Trigger [TD_tblScrap]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblScrap]'))
DROP TRIGGER [dbo].[TD_tblScrap]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblScrap]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TRIGGER [dbo].[TD_tblScrap] ON [dbo].[tblScrap]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON

    DELETE FROM tblOrdenes
    WHERE ITE_NOMBRE IN (SELECT SCR_NewItem FROM DELETED)   

    SET NOCOUNT OFF
END

'
GO
