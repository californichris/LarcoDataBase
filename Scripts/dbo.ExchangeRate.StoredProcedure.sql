USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--EXEC Screens 2,'','','',1
CREATE    PROCEDURE [dbo].[ExchangeRate]
  @TYPE   AS INT,
  @DATE   AS VARCHAR(10) = NULL,
  @AMOUTN AS DECIMAL(18,5) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblExchangeRate(Rate_Date,Rate_Amount)
	SELECT @DATE,@AMOUTN
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblExchangeRate SET Rate_Date = @DATE, Rate_Amount = @AMOUTN
        WHERE Rate_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblExchangeRate WHERE Rate_ID = @ID
END






GO
