USE [Larco]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAggregateValue]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAggregateValue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetAggregateValue]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAggregateValue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  FUNCTION [dbo].[GetAggregateValue](@PRODUCT_ID AS INT, @TAS_ORDER AS INT) RETURNS DECIMAL(18,2)
AS 
BEGIN

DECLARE @AGGREGATEVALUE AS DECIMAL(18,2)
DECLARE @VALUE AS DECIMAL(18,2)

SELECT @VALUE = A.Value
FROM tblAggregateValue A
INNER JOIN tblTareas T ON A.Task_ID = T.[Id]
WHERE A.Product_ID = @PRODUCT_ID AND TAS_Order = @TAS_ORDER


SELECT @AGGREGATEVALUE = SUM(A.Value)
FROM tblAggregateValue A
INNER JOIN tblTareas T ON A.Task_ID = T.[Id]
WHERE A.Product_ID = @PRODUCT_ID AND TAS_Order < @TAS_ORDER


RETURN	@VALUE - @AGGREGATEVALUE

END
' 
END
GO
