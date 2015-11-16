USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Grupos]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Grupos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Grupos]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Grupos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create  PROCEDURE [dbo].[Grupos]
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



' 
END
GO
