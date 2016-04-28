USE [Larco]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHours]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SELECT dbo.GetHours('2006-04-18 00:00:00.000','2006-04-18 08:00:00.000')

CREATE FUNCTION [dbo].[GetHours](@START AS DATETIME,@CURRENTDATE AS DATETIME) RETURNS DECIMAL(18,2)
AS 
BEGIN

DECLARE @STARTTIME AS VARCHAR(10)
DECLARE @ENDTIME AS VARCHAR(10)

SELECT @STARTTIME = '07:00:00', @ENDTIME = '01:00:00'

DECLARE @DIFSTART AS INT
DECLARE @DIFEND AS INT
DECLARE @TIMEDIFF AS DECIMAL(18,2)
DECLARE @DAYS AS INT
DECLARE @HOURSLEFT AS DECIMAL(18,2)
DECLARE @DIFSTART2 AS INT
DECLARE @DIFEND2 AS INT
-- DECLARE @START AS DATETIME
-- DECLARE @CURRENTDATE AS DATETIME
-- 
-- SELECT @START = '2006-04-11 01:00:00.000', @CURRENTDATE = '2006-04-12 08:30:00'

SELECT @TIMEDIFF = DATEDIFF(mi,@START,@CURRENTDATE )/60.00

SELECT @DAYS = (DATEDIFF(mi,@START,@CURRENTDATE) / 60 ) / 24
SELECT @HOURSLEFT = @TIMEDIFF - ( 24.00 * @DAYS)

SELECT @DIFSTART = DATEDIFF(mi, CONVERT(VARCHAR(10),@CURRENTDATE,101) + ' ' + @ENDTIME, @CURRENTDATE)
SELECT @DIFEND = DATEDIFF(mi, CONVERT(VARCHAR(10),@CURRENTDATE,101) + ' ' + @STARTTIME, @CURRENTDATE)

SELECT @DIFSTART2 = DATEDIFF(mi, CONVERT(VARCHAR(10),@START,101), @START)
SELECT @DIFEND2 = DATEDIFF(mi, CONVERT(VARCHAR(10),@START,101) + ' 01:00:00', @START)

-- SI EL TIEMPO EN EL QUE LO ESTA CHECANDO ESTA ENTRE LA 1 AM Y LAS 7 AM
IF ( ( @DIFSTART > 0 ) AND ( @DIFEND < 0 ) )
BEGIN
	SET @TIMEDIFF = @TIMEDIFF - ( @DIFSTART / 60.00 )
END
ELSE IF ( @HOURSLEFT > 18.00 )
BEGIN
	SET @TIMEDIFF = @TIMEDIFF - 6.00
END
ELSE IF ( (@HOURSLEFT < 18.00) AND ( @DIFSTART2 >= 0 ) AND ( @DIFEND2 <= 0 ) AND ( @HOURSLEFT > 6.0 ) )
BEGIN
	SET @TIMEDIFF = @TIMEDIFF - 6.00
END

SELECT @TIMEDIFF = @TIMEDIFF - (@DAYS * 6.00)

RETURN	@TIMEDIFF

END
GO
