USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






--exec SalidasLarco 7,8,'SSSSSSS',2


CREATE  PROCEDURE [dbo].[SalidasLarcoBorrar]
    @SD_ID 	  AS INT
AS

DECLARE @COUNT            INT,
	@ENT_Desp         INT,
	@ED_ID_Desp	  INT

SELECT @ED_ID_Desp = ED_ID  FROM tblSalidasDetalle WHERE SD_ID = @SD_ID
IF (@ED_ID_Desp IS NOT NULL) BEGIN
	SELECT @ENT_Desp = ENT_ID FROM tblEntradasDetalle WHERE ED_ID = @ED_ID_Desp
	
	DELETE FROM tblEntradasDetalle WHERE ED_ID = @ED_ID_Desp
	
	SELECT @COUNT = COUNT(ED_ID) FROM tblEntradasDetalle WHERE ENT_ID = @ENT_Desp
	
	IF (@COUNT = 0) BEGIN
		DELETE FROM tblEntradas WHERE ENT_ID = @ENT_Desp 
	END
END

UPDATE tblSalidasDetalle SET SL_Cantidad = NULL, 
SL_Pedimento = NULL, ED_ID = NULL, IS_SL = 1
WHERE SD_ID = @SD_ID






GO
