USE [Larco]
GO
/****** Object:  UserDefinedFunction [dbo].[ISOweek]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ISOweek]  (@DATE DATETIME)
RETURNS INT
AS
BEGIN
   DECLARE @ISOweek INT
   SET @ISOweek = DATEPART(wk,@DATE) 
                  +1 
                  -DATEPART(wk,CAST(DATEPART(yy,@DATE) AS CHAR(4))+'0104')
   -- Special cases: Jan 1-3 may belong to the previous year
   IF (@ISOweek=0)
      SET @ISOweek = dbo.ISOweek(CAST(DATEPART(yy,@DATE) - 1
                     AS CHAR(4))+'12'+ CAST(24+DATEPART(DAY,@DATE) AS CHAR(2)))+1
   -- Special case: Dec 29-31 may belong to the next year
   IF ((DATEPART(mm,@DATE)=12) AND
      ((DATEPART(dd,@DATE)-DATEPART(dw,@DATE))>= 28))
      SET @ISOweek=1
   RETURN(@ISOweek)
END
GO
