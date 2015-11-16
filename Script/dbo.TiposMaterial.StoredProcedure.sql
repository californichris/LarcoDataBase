USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[TiposMaterial]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TiposMaterial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TiposMaterial]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TiposMaterial]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



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




' 
END
GO
