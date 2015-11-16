USE [Larco]
GO
/****** Object:  Trigger [TD_tblCategories]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblCategories]'))
DROP TRIGGER [dbo].[TD_tblCategories]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblCategories]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TD_tblCategories] ON [dbo].[tblCategories]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	DELETE tblCategory_Screens
    FROM tblCategory_Screens C, DELETED D
    WHERE C.Category_ID = D.Category_ID

    SET NOCOUNT OFF
END

'
GO
