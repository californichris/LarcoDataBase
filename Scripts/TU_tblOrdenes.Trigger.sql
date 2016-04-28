USE [Larco]
GO
/****** Object:  Trigger [TU_tblOrdenes]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TU_tblOrdenes] ON [dbo].[tblOrdenes]
AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON
    
	DECLARE @URGENT AS BIT
	DECLARE @ORDER AS VARCHAR(100)
	DECLARE @DATE AS VARCHAR(100)
	DECLARE @SCANBY AS VARCHAR(100)
	DECLARE @TASK AS VARCHAR(100)
	
	SELECT @URGENT = [Urgente], @ORDER = ITE_Nombre, @DATE = CONVERT(VARCHAR, Recibido, 101), @SCANBY = Nombre FROM INSERTED I

	SELECT TOP 1 @TASK = T.Nombre 
	FROM tblItemTasks IT
	INNER JOIN tblTareas T ON IT.TAS_Id = T.Id
	WHERE IT.ITE_Nombre = @ORDER
	AND IT.ITS_DTStart IS NOT NULL AND IT.ITS_DTStop IS NULL AND IT.ITS_Status NOT IN (9,3) 

	IF ((UPDATE (Urgente)) AND (@URGENT = 1) AND (@TASK IS NOT NULL)) BEGIN	
		INSERT INTO Banners(Message,IP,SessionId,DisplayTime,UpdatedDate)
		SELECT 'Orden Urgente: <b>' + @ORDER + '</b><br/>Estatus Actual: <b>' + 
		@TASK + '</b><br/>Fecha de Entrada: <b>' + @DATE + '</b><br/>Escaneado por: <b>' + @SCANBY + '</b>',
		IP,SessionId,NULL,GETDATE() FROM Subscribers WHERE UpdatedDate > DATEADD(MINUTE,-10,GETDATE()) 
	END
	
    SET NOCOUNT OFF
END
GO
