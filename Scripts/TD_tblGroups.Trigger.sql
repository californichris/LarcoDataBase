USE [Larco]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TD_tblGroups] ON [dbo].[tblGroups]
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
GO
