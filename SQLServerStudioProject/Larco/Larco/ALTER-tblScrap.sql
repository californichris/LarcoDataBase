USE Larco
GO

ALTER TABLE [tblScrap]
ALTER COLUMN [SCR_EmpleadoRes] [int] NULL
GO

ALTER TABLE [tblScrap]
ALTER COLUMN [SCR_EmpleadoDetectado] [int] NULL
GO


--Deleting old orders
DELETE FROM tblScrap WHERE LEFT(ITE_Nombre, 2) IN ('06','07','08','09','10','11','12')


/*
SELECT * FROM tblScrap WHERE [SCR_EmpleadoRes] NOT IN (SELECT Id FROM tblEmpleados)
SELECT * FROM tblScrap WHERE [SCR_EmpleadoDetectado] NOT IN (SELECT Id FROM tblEmpleados)

SELECT distinct [SCR_EmpleadoRes] FROM tblScrap WHERE [SCR_EmpleadoRes] NOT IN (SELECT Id FROM tblEmpleados)
union
SELECT distinct [SCR_EmpleadoDetectado] FROM tblScrap WHERE [SCR_EmpleadoDetectado] NOT IN (SELECT Id FROM tblEmpleados)
*/

-- inserting 0 user 
SET IDENTITY_INSERT tblEmpleados ON

INSERT INTO [tblEmpleados]([Id],[Nombre],[Departamento],[Puesto],[Turno],[Percepciones],[CostoHora],[FechaNac],[Activo])
VALUES(0,'Desconocido','','','1',0.0,0.0,'01/01/1970',0)
GO

SET IDENTITY_INSERT tblEmpleados OFF
GO

--insert all unknown employees
DECLARE @EMPLOYEE_ID AS int

DECLARE Employee_Cursor CURSOR FOR

SELECT distinct [SCR_EmpleadoRes] FROM tblScrap WHERE [SCR_EmpleadoRes] NOT IN (SELECT Id FROM tblEmpleados)
union
SELECT distinct [SCR_EmpleadoDetectado] FROM tblScrap WHERE [SCR_EmpleadoDetectado] NOT IN (SELECT Id FROM tblEmpleados)


OPEN Employee_Cursor
FETCH NEXT FROM Employee_Cursor INTO @EMPLOYEE_ID
WHILE @@FETCH_STATUS = 0
BEGIN
	
		SET IDENTITY_INSERT tblEmpleados ON

		INSERT INTO [tblEmpleados]([Id],[Nombre],[Departamento],[Puesto],[Turno],[Percepciones],[CostoHora],[FechaNac],[Activo])
		VALUES(@EMPLOYEE_ID,'Desconocido ' + CAST(@EMPLOYEE_ID as varchar(10)),'','','1',0.0,0.0,'01/01/1970',0)
		--GO

		SET IDENTITY_INSERT tblEmpleados OFF
		--GO	
	
	
	FETCH NEXT FROM Employee_Cursor INTO @EMPLOYEE_ID
END
CLOSE Employee_Cursor
DEALLOCATE Employee_Cursor

GO

ALTER TABLE [dbo].[tblScrap]  WITH CHECK ADD  CONSTRAINT [FK_ScrapResp_EmployeeId] FOREIGN KEY([SCR_EmpleadoRes])
REFERENCES [dbo].[tblEmpleados] ([Id])
GO

ALTER TABLE [dbo].[tblScrap] CHECK CONSTRAINT [FK_ScrapResp_EmployeeId]
GO

ALTER TABLE [dbo].[tblScrap]  WITH CHECK ADD  CONSTRAINT [FK_ScrapDetectado_EmployeeId] FOREIGN KEY([SCR_EmpleadoDetectado])
REFERENCES [dbo].[tblEmpleados] ([Id])
GO

ALTER TABLE [dbo].[tblScrap] CHECK CONSTRAINT [FK_ScrapDetectado_EmployeeId]
GO


ALTER TABLE tblScrap
ADD SCR_TareaId [int] null
GO

ALTER TABLE tblScrap
ADD SCR_TareaDetectadoId [int] null
GO

UPDATE tblScrap SET SCR_TareaId = T.Id
FROM tblScrap S
INNER JOIN tblTareas T ON S.SCR_Tarea = T.Nombre

UPDATE tblScrap SET SCR_TareaDetectadoId = T.Id
FROM tblScrap S
INNER JOIN tblTareas T ON S.SCR_Detectado = T.Nombre


ALTER TABLE tblScrap
ALTER COLUMN SCR_TareaId [int] NOT null
GO

ALTER TABLE tblScrap
ALTER COLUMN SCR_TareaDetectadoId [int] NOT null
GO


ALTER TABLE [dbo].[tblScrap]  WITH CHECK ADD  CONSTRAINT [FK_ScrapResp_TareaId] FOREIGN KEY(SCR_TareaId)
REFERENCES [dbo].tblTareas ([Id])
GO

ALTER TABLE [dbo].[tblScrap] CHECK CONSTRAINT [FK_ScrapResp_TareaId]
GO

ALTER TABLE [dbo].[tblScrap]  WITH CHECK ADD  CONSTRAINT [FK_ScrapDetectado_TareaId] FOREIGN KEY(SCR_TareaDetectadoId)
REFERENCES [dbo].tblTareas ([Id])
GO

ALTER TABLE [dbo].[tblScrap] CHECK CONSTRAINT [FK_ScrapDetectado_TareaId]
GO