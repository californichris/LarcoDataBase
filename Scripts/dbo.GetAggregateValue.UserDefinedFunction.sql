USE [Larco]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAggregateValue]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[GetAggregateValue](@PRODUCT_ID AS INT, @TAS_ORDER AS INT) RETURNS DECIMAL(18,2)
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
GO
