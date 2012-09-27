USE [Larco]
GO
/****** Object:  Trigger [dbo].[TI_tblGroups]    Script Date: 09/06/2012 22:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TI_tblGroups] ON [dbo].[tblGroups]
FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON
    
	INSERT INTO tblGroup_Screens(Group_ID, SCR_ID)  
    SELECT I.Group_ID,24 FROM INSERTED I

    SET NOCOUNT OFF
END
