USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[ExchangeRate]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExchangeRate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ExchangeRate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExchangeRate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



--EXEC Screens 2,'''','''','''',1
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





' 
END
GO
