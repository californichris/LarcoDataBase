USE [Larco]
GO
/****** Object:  UserDefinedFunction [dbo].[GetNonWorkingDays]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetNonWorkingDays]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetNonWorkingDays]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetNonWorkingDays]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  FUNCTION [dbo].[GetNonWorkingDays](@STARTDATE AS DATE, @ENDDATE AS DATE) RETURNS INT
AS 
BEGIN

DECLARE @NONWD AS INT

SELECT @NONWD = COUNT(*) + (DATEDIFF(ww, @STARTDATE, @ENDDATE) * 2)
FROM tblNonWorkingDay 
WHERE NonWorkingDay BETWEEN @STARTDATE AND @ENDDATE

RETURN	@NONWD
END' 
END
GO
