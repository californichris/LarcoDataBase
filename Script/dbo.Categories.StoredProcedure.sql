USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Categories]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Categories]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

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


' 
END
GO
