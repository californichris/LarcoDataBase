USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Grupos]    Script Date: 09/06/2012 22:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[Grupos]
  @TYPE AS INT,
  @NAME AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblGroups(Group_Name)
	SELECT @NAME
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblGroups SET Group_Name = @NAME WHERE Group_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblGroups WHERE Group_ID = @ID
END
