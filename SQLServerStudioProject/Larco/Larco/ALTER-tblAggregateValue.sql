USE Larco
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tblAggreg__Befor__320C68B7]') AND type = 'D')
BEGIN
ALTER TABLE [tblAggregateValue] DROP CONSTRAINT [DF__tblAggreg__Befor__320C68B7]
END
GO


ALTER TABLE [tblAggregateValue] ADD  CONSTRAINT [DF_AggregateValue_BeforeDays]  DEFAULT ((0)) FOR [BeforeDays]
GO

ALTER TABLE [tblAggregateValue]
ALTER COLUMN [Product_ID] [int] NOT NULL

ALTER TABLE [tblAggregateValue]
ALTER COLUMN [Task_ID] [int] NOT NULL

ALTER TABLE [tblAggregateValue]
ALTER COLUMN [Value] [decimal](18, 2) NOT NULL

ALTER TABLE [tblAggregateValue]  WITH CHECK ADD  CONSTRAINT [FK_AggregateValue_TaskId] FOREIGN KEY([Task_Id])
REFERENCES [tblTareas] ([Id])
GO

ALTER TABLE [tblAggregateValue] CHECK CONSTRAINT [FK_AggregateValue_TaskId]
GO

ALTER TABLE [tblAggregateValue]  WITH CHECK ADD  CONSTRAINT [FK_AggregateValue_ProductId] FOREIGN KEY([Product_Id])
REFERENCES [tblProductos] ([Id])
GO

ALTER TABLE [tblAggregateValue] CHECK CONSTRAINT [FK_AggregateValue_ProductId]
GO


DELETE FROM tblAggregateValue 
WHERE ProdTaskId NOT IN (
	SELECT ProdTaskId 
	FROM tblAggregateValue A
	INNER JOIN [RoutingVW] R ON A.Product_ID = R.ProductId AND A.Task_ID = R.TaskID
)

--TODO: check java  code because the BeforeDays column is being updated there
-- Also check the following file G:\HP\Chris\Code\Larco\Cambios Proyecto Pantallas.sql
-- there some defaults for BeforeDays