USE [Larco]
GO
/****** Object:  Trigger [TI_tblGroups]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblGroups]'))
DROP TRIGGER [dbo].[TI_tblGroups]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblGroups]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TI_tblGroups] ON [dbo].[tblGroups]
FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON
    
	INSERT INTO tblGroup_Screens(Group_ID, SCR_ID)  
    SELECT I.Group_ID,24 FROM INSERTED I

    SET NOCOUNT OFF
END
'
GO
