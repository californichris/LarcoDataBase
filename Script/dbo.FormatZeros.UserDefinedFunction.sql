USE [Larco]
GO
/****** Object:  UserDefinedFunction [dbo].[FormatZeros]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormatZeros]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[FormatZeros]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormatZeros]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE    Function [dbo].[FormatZeros](@NUMBER INT,@LEN AS INT) RETURNS VARCHAR(10)
AS
BEGIN
   DECLARE @ZEROS AS VARCHAR(10)
   DECLARE @STRNUM AS VARCHAR(10)
 	
   SET @ZEROS = ''000000000''	
   SELECT @STRNUM = CAST(@NUMBER AS VARCHAR(10))
 	
	
   RETURN(SELECT LEFT( @ZEROS,@LEN - LEN(@STRNUM) ) + @STRNUM  )
END
' 
END
GO
