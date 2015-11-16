USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Orden]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Delete_Orden]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Delete_Orden]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Delete_Orden]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- SELECT * FROM tblStockOrdenes where ITE_ID = 4534
-- Insert_Orden ''001-001-00'',''test'',10,10,''Anvil AMP'',''12345'',''123435'',''03/20/2006'',''03/18/2006'',''Christian Beltran'',1,''just a test'',''test again'',12.0,200,''Ventas'',''System'',''''
CREATE    PROCEDURE [dbo].[Delete_Orden]
(
	@ITE_ID		INT,
	@STOCK		BIT
)
AS
DECLARE @ST_ID      INT,
        @ITE_NOMBRE VARCHAR(50)

IF (@STOCK = 0) BEGIN
	
    		
	SELECT @ITE_NOMBRE = ITE_Nombre, @ST_ID = ST_Id FROM tblOrdenes WHERE ITE_ID = @ITE_ID

	--INSERT ITEM INTO tblitems
	DELETE FROM tblItems WHERE ITE_ID = @ITE_ID

	DELETE FROM tblItemTasks WHERE ITE_ID = @ITE_ID
				
	--INSERT INTO tblOrdenes
	DELETE FROM tblOrdenes WHERE ITE_ID = @ITE_ID
  
	DELETE FROM tblScrap WHERE ITE_Nombre = @ITE_NOMBRE

	IF (@ST_ID IS NOT NULL) BEGIN
	  DELETE FROM tblStock WHERE ST_Id = @ST_ID
	END
END
ELSE BEGIN
    SELECT @ITE_NOMBRE = ITE_Nombre, @ST_ID = ST_Id FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID
    
	DELETE FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID
    DELETE FROM tblStock WHERE ST_Id = @ST_ID
    DELETE FROM tblMergeOrdenes WHERE ITE_Nombre = @ITE_NOMBRE
END

SELECT 0 AS ERROR,'''' AS MSG

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
' 
END
GO
