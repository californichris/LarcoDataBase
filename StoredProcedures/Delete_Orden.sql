USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Orden]    Script Date: 09/06/2012 22:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SELECT * FROM tblStockOrdenes where ITE_ID = 4534
-- Insert_Orden '001-001-00','test',10,10,'Anvil AMP','12345','123435','03/20/2006','03/18/2006','Christian Beltran',1,'just a test','test again',12.0,200,'Ventas','System',''
ALTER    PROCEDURE [dbo].[Delete_Orden]
(
	@ITE_ID		INT,
	@STOCK		BIT
)
AS

IF (@STOCK = 0) BEGIN
	DECLARE @ITE_NOMBRE AS VARCHAR(50)
	SELECT @ITE_NOMBRE = ITE_Nombre FROM tblOrdenes WHERE ITE_ID = @ITE_ID

	--INSERT ITEM INTO tblitems
	DELETE FROM tblItems WHERE ITE_ID = @ITE_ID

	DELETE FROM tblItemTasks WHERE ITE_ID = @ITE_ID
				
	--INSERT INTO tblOrdenes
	DELETE FROM tblOrdenes WHERE ITE_ID = @ITE_ID
  
	DELETE FROM tblScrap WHERE ITE_Nombre = @ITE_NOMBRE

END
ELSE BEGIN
	DELETE FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID
END

SELECT 0 AS ERROR,'' AS MSG

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
