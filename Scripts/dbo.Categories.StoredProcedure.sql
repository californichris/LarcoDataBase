USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[Categories]
  @TYPE AS INT,
  @NAME AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblCategories(Category_Name,Category_Order)
	SELECT @NAME,0
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblCategories SET Category_Name = @NAME WHERE Category_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblCategories WHERE Category_ID = @ID
END



GO
