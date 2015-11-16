USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Paises]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paises]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Paises]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paises]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE    PROCEDURE [dbo].[Paises]
  @TYPE AS INT,
  @NAME AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblPaises(PAIS_NOMBRE)
	SELECT @NAME
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblPaises SET PAIS_NOMBRE = @NAME WHERE PAIS_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblPaises WHERE PAIS_ID = @ID
END




' 
END
GO
