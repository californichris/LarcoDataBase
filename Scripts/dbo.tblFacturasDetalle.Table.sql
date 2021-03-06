USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFacturasDetalle](
	[FC_ID] [int] IDENTITY(1,1) NOT NULL,
	[FAC_ID] [int] NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[FD_Cantidad] [int] NULL,
	[FD_Desc] [varchar](150) NULL,
	[FD_Numero] [varchar](50) NULL,
	[FD_Stock] [int] NULL,
	[FD_Dolares] [char](1) NULL,
	[FD_Unitario] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create         TRIGGER [dbo].[TD_tblFacturasDetalle] ON [dbo].[tblFacturasDetalle]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE 
	@ITE_NOMBRE	VARCHAR(50),
	@STOCK		BIT

	/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
	DECLARE Facturas_Deleted CURSOR FOR
	
	SELECT ITE_NOMBRE,FD_Stock FROM DELETED
	
	/*OPEN CURSOR*/
	OPEN Facturas_Deleted
	/*GET FIRST RECORD INTO VARIABLE*/
	FETCH NEXT FROM Facturas_Deleted INTO @ITE_NOMBRE,@STOCK
	WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
	BEGIN
	
		IF(@STOCK = 0)BEGIN
		UPDATE tblOrdenes SET FAC_ID = NULL WHERE ITE_NOMBRE = @ITE_NOMBRE
		END ELSE BEGIN
		UPDATE tblStockOrdenes SET FAC_ID = NULL WHERE ITE_NOMBRE = @ITE_NOMBRE
		END

	   FETCH NEXT FROM Facturas_Deleted INTO @ITE_NOMBRE,@STOCK
	END
	
	/*CLOSE CURSOR*/
	CLOSE Facturas_Deleted
	DEALLOCATE Facturas_Deleted

    SET NOCOUNT OFF
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create        TRIGGER [dbo].[TI_tblFacturasDetalle] ON [dbo].[tblFacturasDetalle]
FOR INSERT, UPDATE
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE 
	@ITE_NOMBRE	VARCHAR(50),
	@FAC_ID		INT,
	@STOCK		BIT

    SELECT @ITE_NOMBRE = I.ITE_NOMBRE, @STOCK = FD_Stock, @FAC_ID = FAC_ID  
    FROM INSERTED I

    IF(@STOCK = 0)BEGIN
	UPDATE tblOrdenes SET FAC_ID = @FAC_ID WHERE ITE_NOMBRE = @ITE_NOMBRE
    END ELSE BEGIN
	UPDATE tblStockOrdenes SET FAC_ID = @FAC_ID WHERE ITE_NOMBRE = @ITE_NOMBRE
    END

    SET NOCOUNT OFF
END


GO
