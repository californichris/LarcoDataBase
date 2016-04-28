USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Screens]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
