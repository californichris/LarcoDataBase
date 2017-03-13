USE Larco

ALTER TABLE [tblEmpleados] DROP CONSTRAINT uc_EmpleadoNombre;
GO

ALTER TABLE [tblEmpleados]
ALTER COLUMN [Nombre] [varchar](150) NOT NULL
GO

ALTER TABLE [tblEmpleados]
ADD CONSTRAINT uc_EmpleadoNombre UNIQUE ([Nombre])
GO