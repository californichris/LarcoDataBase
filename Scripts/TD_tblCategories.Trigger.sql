USE [Larco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TD_tblCategories] ON [dbo].[tblCategories]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	DELETE tblCategory_Screens
    FROM tblCategory_Screens C, DELETED D
    WHERE C.Category_ID = D.Category_ID

    SET NOCOUNT OFF
END
GO
