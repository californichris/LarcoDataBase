USE [Larco]
GO
/****** Object:  UserDefinedFunction [dbo].[GetDueDate]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDueDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetDueDate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDueDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  FUNCTION [dbo].[GetDueDate](@BEFOREDAYS AS INT, @INTDUEDATE AS DATE) RETURNS DATE
AS 
BEGIN

DECLARE @DUEDATE AS DATE

SELECT @DUEDATE = DATEADD(DAY,(-1 * (@BEFOREDAYS + dbo.GetNonWorkingDays(CONVERT(DATE, GETDATE()), @INTDUEDATE) ) ), @INTDUEDATE )

RETURN	@DUEDATE
END' 
END
GO
