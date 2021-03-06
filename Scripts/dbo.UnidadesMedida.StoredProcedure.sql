USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



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




GO
