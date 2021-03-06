USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEntradasSalidas](
	[ES_ID] [int] IDENTITY(1,1) NOT NULL,
	[ED_ID] [int] NULL,
	[ED_Cantidad] [decimal](18, 2) NULL,
	[SD_ID] [int] NULL,
	[ES_Costo] [decimal](18, 2) NULL,
 CONSTRAINT [pk_EntradasSalidasId] PRIMARY KEY CLUSTERED 
(
	[ES_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblEntradasSalidas]  WITH CHECK ADD  CONSTRAINT [FK_EntradasSalidas_EntradasDetalle] FOREIGN KEY([ED_ID])
REFERENCES [dbo].[tblEntradasDetalle] ([ED_ID])
GO
ALTER TABLE [dbo].[tblEntradasSalidas] CHECK CONSTRAINT [FK_EntradasSalidas_EntradasDetalle]
GO
ALTER TABLE [dbo].[tblEntradasSalidas]  WITH CHECK ADD  CONSTRAINT [FK_EntradasSalidas_SalidasDetalle] FOREIGN KEY([SD_ID])
REFERENCES [dbo].[tblSalidasDetalle] ([SD_ID])
GO
ALTER TABLE [dbo].[tblEntradasSalidas] CHECK CONSTRAINT [FK_EntradasSalidas_SalidasDetalle]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   TRIGGER [dbo].[TD_tblEntradasSalidas] ON [dbo].[tblEntradasSalidas]
after DELETE
AS 
BEGIN
    SET NOCOUNT ON
        
	DECLARE 
	@ED_ID			INT,
	@ED_CANTIDAD	DECIMAL(18,2)
	 
    --INSERT INTO tmpEmpleados(Nombre) SELECT 'Entro a TD_tblEntradasSalidas'

	/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
	DECLARE Salidas_Deleted CURSOR FOR
	
	SELECT ED_ID, ED_CANTIDAD FROM DELETED
	
	/*OPEN CURSOR*/
	OPEN Salidas_Deleted
	/*GET FIRST RECORD INTO VARIABLE*/
	FETCH NEXT FROM Salidas_Deleted INTO @ED_ID, @ED_CANTIDAD
	WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
	BEGIN
		/*INSERT INTO tmpEmpleados(Nombre) 
		SELECT 'Entro a TD_tblEntradasSalidas @ED_ID:' + CAST(@ED_ID AS varchar(10)) + ', @ED_CANTIDAD:' + 
		CAST(@ED_CANTIDAD AS varchar(10))
		*/

		UPDATE tblEntradasDetalle SET ED_Restante = ED_Restante + @ED_CANTIDAD
		WHERE ED_ID = @ED_ID

	   FETCH NEXT FROM Salidas_Deleted INTO @ED_ID, @ED_CANTIDAD
	END
	
	/*CLOSE CURSOR*/
	CLOSE Salidas_Deleted
	DEALLOCATE Salidas_Deleted
	
    SET NOCOUNT OFF
END











GO
