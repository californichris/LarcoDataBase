USE Larco
GO

DELETE from tblItemTasks where TAS_Id not in (select Id from tbltareas)

ALTER TABLE [dbo].[tblItemTasks]  WITH CHECK ADD  CONSTRAINT [FK_ItemTasks_TaskId] FOREIGN KEY([TAS_Id])
REFERENCES [dbo].[tblTareas] ([Id])
GO

ALTER TABLE [dbo].[tblItemTasks] CHECK CONSTRAINT [FK_ItemTasks_TaskId]
GO

ALTER TABLE [tblItemTasks]
ADD ItemTaskId INT IDENTITY(1, 1)
GO

ALTER TABLE [tblItemTasks]
ADD CONSTRAINT pk_ItemTaskId PRIMARY KEY (ItemTaskId)
GO


UPDATE tblItemTasks set USE_Login = 25 where USE_Login not in (select Id from tblEmpleados)

ALTER TABLE [tblItemTasks]
ALTER COLUMN [USE_Login] [int] NULL
GO

ALTER TABLE [dbo].[tblItemTasks]  WITH CHECK ADD  CONSTRAINT [FK_ItemTasks_EmployeeId] FOREIGN KEY([USE_Login])
REFERENCES [dbo].[tblEmpleados] ([Id])
GO

ALTER TABLE [dbo].[tblItemTasks] CHECK CONSTRAINT [FK_ItemTasks_EmployeeId]
GO

-- DELETE records that were inserted but are not used because of the product does not passed thru that tasks
DELETE FROM tblItemTasks WHERE ItemTaskId NOT IN (
SELECT ItemTaskId
FROM tblItemTasks IT
INNER JOIN tblOrdenes O ON IT.ITE_Nombre = O.ITE_Nombre
INNER JOIN RoutingVW R ON O.ProductId = R.ProductId AND IT.TAS_Id = R.TaskID
)


ALTER TABLE tblItemTasks
ADD OrdenId [int] null
GO

UPdATE tblItemTasks SET OrdenId = O.OrdenId
FROM tblItemTasks IT
INNER JOIN tblOrdenes O ON IT.ITE_Nombre = O.ITE_Nombre
GO

ALTER TABLE tblItemTasks
alter column OrdenId [int] not null
GO

ALTER TABLE [dbo].[tblItemTasks]  WITH CHECK ADD  CONSTRAINT [FK_ItemTasks_OrdenId] FOREIGN KEY([OrdenId])
REFERENCES [dbo].[tblOrdenes] ([OrdenId])
GO

ALTER TABLE [dbo].[tblItemTasks] CHECK CONSTRAINT [FK_ItemTasks_OrdenId]
GO

CREATE NONCLUSTERED INDEX [INX_ITEM_TASKS_DTSTOP_DTSTATUS_DTSTART]
ON [dbo].[tblItemTasks] ([ITS_Status],[ITS_DTStart],[ITS_DTStop])
INCLUDE ([TAS_Id],[USE_Login],[ITS_Machine],[ItemTaskId],[OrdenId])