USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec SalidasLarcoEditar 7,8,'SSSSSSS',2

CREATE  PROCEDURE [dbo].[SalidasLarcoEditar]
    @SD_ID 	  AS INT,
    @SL_CANTIDAD  AS INT,
    @SL_PEDIMENTO AS VARCHAR(50),
    @SL_DESP      AS INT
AS

DECLARE @COUNT            INT,
	@ENT_Desp         INT,
	@ED_ID_Desp	  INT

SELECT @ED_ID_Desp = ED_ID  FROM tblSalidasDetalle WHERE SD_ID = @SD_ID
IF (@ED_ID_Desp IS NULL) BEGIN
	EXEC SalidasLarco @SD_ID, @SL_CANTIDAD, @SL_PEDIMENTO, @SL_DESP 
END
ELSE BEGIN
	SELECT @ENT_Desp = ENT_ID FROM tblEntradasDetalle WHERE ED_ID = @ED_ID_Desp
	IF (@SL_DESP > 0) BEGIN	
		UPDATE tblEntradasDetalle SET ED_Cantidad = @SL_DESP
		WHERE ED_ID = @ED_ID_Desp	
	END
	ELSE BEGIN
		DELETE FROM tblEntradasDetalle WHERE ED_ID = @ED_ID_Desp
		
		SELECT @COUNT = COUNT(ED_ID) FROM tblEntradasDetalle WHERE ENT_ID = @ENT_Desp
		
		IF (@COUNT = 0) BEGIN
			DELETE FROM tblEntradas WHERE ENT_ID = @ENT_Desp 
		END
	END
	
END



GO
