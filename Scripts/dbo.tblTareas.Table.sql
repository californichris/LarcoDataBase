USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTareas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TAS_Order] [smallint] NULL,
	[Grupo] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Tiempo] [decimal](18, 2) NULL,
	[Interno] [decimal](18, 2) NULL,
	[IsPutOnly] [bit] NULL CONSTRAINT [DF_tblTareas_IsPutOnly]  DEFAULT (0),
	[IsConjuncion] [bit] NULL CONSTRAINT [DF_tblTareas_IsConjuncion]  DEFAULT (0),
	[IsLast] [bit] NULL CONSTRAINT [DF_tblTareas_IsLast]  DEFAULT (0),
	[ConjuncionGrupo] [varchar](50) NULL,
 CONSTRAINT [PK_Tareas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [INX_Nombre] ON [dbo].[tblTareas]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TD_tblTareas] ON [dbo].[tblTareas]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	-- Delete Records from tblAggregateValue
	DELETE tblAggregateValue
    FROM tblAggregateValue A, DELETED D
    WHERE A.Task_ID = D.[ID]


    SET NOCOUNT OFF
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TI_tblTareas] ON [dbo].[tblTareas]
FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON
    
	DECLARE @TASK AS INT
	SELECT @TASK = [ID] FROM INSERTED I

	INSERT INTO tblAggregateValue(Product_ID, Task_ID, [Value]) 
    SELECT [ID], @TASK, 1.00 FROM tblProductos ORDER BY [ID]

    SET NOCOUNT OFF
END



GO
