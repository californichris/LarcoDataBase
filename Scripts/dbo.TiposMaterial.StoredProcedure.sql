USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[TiposMaterial]    Script Date: 04/27/2016 20:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[TiposMaterial]
  @TYPE AS INT,
  @MATERIALTYPE AS VARCHAR(50) = NULL,
  @DESC AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblTiposMaterial(TIP_Tipo, TIP_Descripcion)
	SELECT @MATERIALTYPE, @DESC
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblTiposMaterial SET TIP_Tipo = @MATERIALTYPE, TIP_Descripcion = @DESC 
	WHERE TIP_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblTiposMaterial WHERE TIP_ID = @ID
END
GO
