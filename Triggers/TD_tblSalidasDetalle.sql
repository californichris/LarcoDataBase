USE [Larco]
GO
/****** Object:  Trigger [dbo].[TD_tblSalidasDetalle]    Script Date: 09/06/2012 22:33:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   TRIGGER [dbo].[TD_tblSalidasDetalle] ON [dbo].[tblSalidasDetalle]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE 
	@SD_ID			INT,
	@ED_ID			INT,
	@ED_CANTIDAD		DECIMAL(18,2)

	/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
	DECLARE Salidas_Deleted CURSOR FOR
	
	SELECT SD_ID FROM DELETED
	
	/*OPEN CURSOR*/
	OPEN Salidas_Deleted
	/*GET FIRST RECORD INTO VARIABLE*/
	FETCH NEXT FROM Salidas_Deleted INTO @SD_ID
	WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
	BEGIN
	

		/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
		DECLARE SalidasEntradas_Deleted CURSOR FOR
		
			SELECT ED_ID, ED_Cantidad FROM tblEntradasSalidas WHERE SD_ID = @SD_ID
		
		/*OPEN CURSOR*/
		OPEN SalidasEntradas_Deleted
		/*GET FIRST RECORD INTO VARIABLE*/
		FETCH NEXT FROM SalidasEntradas_Deleted INTO @ED_ID, @ED_CANTIDAD
		WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
		BEGIN

			UPDATE tblEntradasDetalle SET ED_Restante = ED_Restante + @ED_CANTIDAD
			WHERE ED_ID = @ED_ID


		   FETCH NEXT FROM SalidasEntradas_Deleted INTO @ED_ID, @ED_CANTIDAD
		END
		
		--DROP TABLE ##TBLEXPORTBU
		/*CLOSE CURSOR*/
		CLOSE SalidasEntradas_Deleted
		DEALLOCATE SalidasEntradas_Deleted


		DELETE FROM tblEntradasSalidas WHERE SD_ID = @SD_ID

	   FETCH NEXT FROM Salidas_Deleted INTO @SD_ID
	END
	
	--DROP TABLE ##TBLEXPORTBU
	/*CLOSE CURSOR*/
	CLOSE Salidas_Deleted
	DEALLOCATE Salidas_Deleted

	INSERT INTO tblSalidasDetalle_History
	SELECT * FROM DELETED

    SET NOCOUNT OFF
END
