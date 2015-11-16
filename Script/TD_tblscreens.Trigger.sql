USE [Larco]
GO
/****** Object:  Trigger [TD_tblscreens]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblscreens]'))
DROP TRIGGER [dbo].[TD_tblscreens]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblscreens]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TD_tblscreens] ON [dbo].[tblScreens]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	-- Delete Records from tblCategory_Screens
	DELETE tblCategory_Screens
    FROM tblCategory_Screens C, DELETED D
    WHERE C.SCR_ID = D.SCR_ID

	-- Delete Records from tblGroup_Screens
	DELETE tblCategory_Screens
    FROM tblGroup_Screens G, DELETED D
    WHERE G.SCR_ID = D.SCR_ID


    SET NOCOUNT OFF
END
'
GO
