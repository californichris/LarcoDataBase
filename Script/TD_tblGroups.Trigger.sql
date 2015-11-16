USE [Larco]
GO
/****** Object:  Trigger [TD_tblGroups]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblGroups]'))
DROP TRIGGER [dbo].[TD_tblGroups]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblGroups]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TD_tblGroups] ON [dbo].[tblGroups]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	-- Delete Records from tblCategory_Screens
	DELETE tblGroup_Screens
    FROM tblGroup_Screens G, DELETED D
    WHERE G.Group_ID = D.Group_ID

	-- Delete Records from tblGroup_Screens
	DELETE tblUser_Groups
    FROM tblUser_Groups U, DELETED D
    WHERE U.Group_ID = D.Group_ID


    SET NOCOUNT OFF
END
'
GO
