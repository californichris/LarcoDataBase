USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[SalidasLarcoBorrar]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalidasLarcoBorrar]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SalidasLarcoBorrar]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalidasLarcoBorrar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





--exec SalidasLarco 7,8,''SSSSSSS'',2


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





' 
END
GO
