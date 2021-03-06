USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrdenes](
	[ITE_ID] [int] NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[TipoProceso] [varchar](50) NULL,
	[Requerida] [int] NULL,
	[Ordenada] [int] NULL,
	[Producto] [varchar](50) NULL,
	[Numero] [varchar](50) NULL,
	[Terminal] [varchar](50) NULL,
	[OrdenCompra] [varchar](50) NULL,
	[Recibido] [datetime] NULL,
	[Entrega] [datetime] NULL,
	[Interna] [datetime] NULL,
	[Nombre] [varchar](150) NULL,
	[Aprobacion] [bit] NULL CONSTRAINT [DF_tblOrdenes_Aprobacion]  DEFAULT (0),
	[Observaciones] [varchar](1000) NULL,
	[Otras] [varchar](500) NULL,
	[Unitario] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[Dolares] [bit] NULL CONSTRAINT [DF_tblOrdenes_Dolares]  DEFAULT (0),
	[FAC_Id] [int] NULL,
	[PN_Id] [int] NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL,
	[StockParcial] [bit] NULL,
	[StockParcialCantidad] [int] NULL,
	[ST_ID] [int] NULL,
	[Requisicion] [varchar](50) NULL,
	[Urgente] [bit] NULL CONSTRAINT [DF__tblOrdene__Urgen__30242045]  DEFAULT ((0)),
	[Alerta] [bit] NULL,
	[AlertaMsg] [nvarchar](50) NULL,
	[Instrucciones] [nvarchar](1000) NULL,
 CONSTRAINT [uc_ITENombre] UNIQUE NONCLUSTERED 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [INX_ITE_Nombre] ON [dbo].[tblOrdenes]
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TD_tblOrdenes] ON [dbo].[tblOrdenes]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	-- Delete Records from tblAggregateValue
    DELETE FROM tblItems
    WHERE ITE_NOMBRE IN (SELECT ITE_NOMBRE FROM DELETED)

    DELETE FROM tblItemTasks
    WHERE ITE_NOMBRE IN (SELECT ITE_NOMBRE FROM DELETED)


    SET NOCOUNT OFF
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TI_tblOrdenes] ON [dbo].[tblOrdenes]
FOR INSERT
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

	IF((@URGENT = 1) AND (@TASK IS NOT NULL)) BEGIN
		INSERT INTO Banners(Message,IP,SessionId,DisplayTime,UpdatedDate)
		SELECT 'Orden Urgente: <b>' + @ORDER + '</b><br/>Estatus Actual: <b>' + 
		@TASK + '</b><br/>Fecha de Entrada: <b>' + @DATE + '</b><br/>Escaneado por: <b>' + @SCANBY + '</b>',
		IP,SessionId,NULL,GETDATE() FROM Subscribers WHERE UpdatedDate > DATEADD(MINUTE,-10,GETDATE()) 
	END
	
    SET NOCOUNT OFF
END
GO
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
