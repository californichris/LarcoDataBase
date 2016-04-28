USE [Larco]
GO
/****** Object:  Trigger [TI_tblGroups]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TI_tblGroups] ON [dbo].[tblGroups]
FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON
    
	INSERT INTO tblGroup_Screens(Group_ID, SCR_ID)  
    SELECT I.Group_ID,24 FROM INSERTED I

    SET NOCOUNT OFF
END
GO
