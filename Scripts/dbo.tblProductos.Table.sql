USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProductos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Prioridad] [smallint] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__tblProdu__75E3EFCF4BCC3ABA] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TD_tblproductos] ON [dbo].[tblProductos]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	-- Delete Records from tblAggregateValue
	DELETE tblAggregateValue
    FROM tblAggregateValue A, DELETED D
    WHERE A.Product_ID = D.[ID]


    SET NOCOUNT OFF
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TI_tblproductos] ON [dbo].[tblProductos]
FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON
    
	DECLARE @PRODUCT AS INT
	SELECT @PRODUCT = [ID] FROM INSERTED I

	INSERT INTO tblAggregateValue(Product_ID, Task_ID, [Value]) 
    SELECT @PRODUCT,[ID],1.00 FROM tbltareas ORDER BY [ID]

    SET NOCOUNT OFF
END


GO
