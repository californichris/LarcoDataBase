ALTER TABLE tblEmpleados
ADD CONSTRAINT pk_EmpleadoId PRIMARY KEY (Id)

ALTER TABLE tblEmpleados
ADD CONSTRAINT uc_EmpleadoNombre UNIQUE (Nombre)

ALTER TABLE tblEmpleados
ADD Activo bit null

UPDATE tblEmpleados SET Activo = 1

ALTER TABLE tblEmpleados
alter column Activo bit not null

ALTER TABLE tblEmpleados ADD  CONSTRAINT [DF_Empleados_Activo]  DEFAULT ((1)) FOR [Activo]
GO

