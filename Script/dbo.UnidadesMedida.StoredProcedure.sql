USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[UnidadesMedida]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnidadesMedida]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UnidadesMedida]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnidadesMedida]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE   PROCEDURE [dbo].[UnidadesMedida]
  @TYPE AS INT,
  @NAME AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblUnidadesMedida(UNI_Medida)
	SELECT @NAME
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblUnidadesMedida SET UNI_Medida = @NAME WHERE UNI_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblUnidadesMedida WHERE UNI_ID = @ID
END



' 
END
GO
