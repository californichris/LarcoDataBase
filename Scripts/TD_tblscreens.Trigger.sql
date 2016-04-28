USE [Larco]
GO
/****** Object:  Trigger [TD_tblscreens]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TD_tblscreens] ON [dbo].[tblScreens]
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
GO
