USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Screens]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Screens]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Screens]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Screens]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE   PROCEDURE [dbo].[Screens]
  @TYPE AS INT,
  @NAME AS VARCHAR(50) = NULL,
  @FORM AS VARCHAR(50) = NULL,
  @DESC AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblScreens(SCR_Name,SCR_FormName,SCR_Description,SCR_Year)
	SELECT @NAME,@FORM,@DESC,YEAR(GETDATE())
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblScreens SET SCR_Name = @NAME, SCR_FormName = @FORM,
        SCR_Description = @DESC WHERE SCR_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblScreens WHERE SCR_ID = @ID
END



' 
END
GO
