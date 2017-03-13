USE Larco
Go

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblscreens]'))
DROP TRIGGER [dbo].[TD_tblscreens]
GO

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblCategories]'))
DROP TRIGGER [dbo].[TD_tblCategories]
GO



ALTER TABLE tblScreens
ADD CONSTRAINT pk_ScreenId PRIMARY KEY (SCR_ID)

ALTER TABLE tblScreens
ALTER COLUMN [SCR_Name] [varchar](50) NOT NULL

ALTER TABLE tblScreens
ADD [URL] [nvarchar](100) NULL,
[ModuleOrder] [int] NULL,
[ParentModule] [int] NULL

--TODO:SET UP ALL SCREENS AND THEN ADD THE NOT NULL RESTRICTION
UPDATE tblScreens SET URL = 'UnderConstruction.aspx'

INSERT INTO [tblScreens]([SCR_Name],[SCR_Description],[SCR_FormName],[URL],[ModuleOrder],[ParentModule],[SCR_Year])  
VALUES('Herramientas','Herramientas Generales','','',10,NULL,'')

INSERT INTO [tblScreens]([SCR_Name],[SCR_Description],[SCR_FormName],[URL],[ModuleOrder],[ParentModule],[SCR_Year])  
VALUES('Inventarios','Inventarios','','',20,NULL,'')

INSERT INTO [tblScreens]([SCR_Name],[SCR_Description],[SCR_FormName],[URL],[ModuleOrder],[ParentModule],[SCR_Year])  
VALUES('Stock','Stock','','',30,NULL,'')

INSERT INTO [tblScreens]([SCR_Name],[SCR_Description],[SCR_FormName],[URL],[ModuleOrder],[ParentModule],[SCR_Year])  
VALUES('Catalogos','Catalogos','','',40,NULL,'')

INSERT INTO [tblScreens]([SCR_Name],[SCR_Description],[SCR_FormName],[URL],[ModuleOrder],[ParentModule],[SCR_Year])  
VALUES('Reportes','Reportes','','',50,NULL,'')

INSERT INTO [tblScreens]([SCR_Name],[SCR_Description],[SCR_FormName],[URL],[ModuleOrder],[ParentModule],[SCR_Year])  
VALUES('Facturacion','Facturacion','','',60,NULL,'')

INSERT INTO [tblScreens]([SCR_Name],[SCR_Description],[SCR_FormName],[URL],[ModuleOrder],[ParentModule],[SCR_Year])  
VALUES('Admin','Administracion del Sistema','','',70,NULL,'')

UPDATE [tblScreens] 
SET ParentModule = (SELECT TOP 1 SCR_ID FROM [tblScreens] WHERE [SCR_Name] = 'Herramientas')
WHERE [SCR_FormName] IN ('frmEditorRetrabajo','frmScrapEditor','frmEditor','Form1','frmVentas')

UPDATE [tblScreens] 
SET ParentModule = (SELECT TOP 1 SCR_ID FROM [tblScreens] WHERE [SCR_Name] = 'Inventarios')
WHERE [SCR_FormName] IN ('frmInventariosConf','frmEntradas','frmSalidasAlmacen','frmSalidasLarco')

UPDATE [tblScreens] 
SET ParentModule = (SELECT TOP 1 SCR_ID FROM [tblScreens] WHERE [SCR_Name] = 'Stock')
WHERE [SCR_FormName] IN ('frmCatalogoPlanos','frmESStock','frmReporteTotalPiezasStock','frmReporteESPlano','frmReporteESStock','frmReportePiezasStock')

UPDATE [tblScreens] 
SET ParentModule = (SELECT TOP 1 SCR_ID FROM [tblScreens] WHERE [SCR_Name] = 'Facturacion')
WHERE [SCR_FormName] IN ('frmFacturacion','frmPendientesFact')

UPDATE [tblScreens] 
SET ParentModule = (SELECT TOP 1 SCR_ID FROM [tblScreens] WHERE [SCR_Name] = 'Catalogos')
WHERE [SCR_FormName] IN ('frmClientes','frmEmpleados','frmProductos','frmTareas',
'frmRutas','frmCatalogoCategories','frmCatalogoScreens','frmMenuEditor','frmCatalogoGrupos',
'frmCatalogoPermisos','frmContribuyente','frmMateriales','frmProductosTerminados','frmUnidadMedida',
'frmTipoMaterial','frmProvedores','frmPaises','frmDiasInhabiles')

UPDATE [tblScreens] 
SET ParentModule = (SELECT TOP 1 SCR_ID FROM [tblScreens] WHERE [SCR_Name] = 'Reportes')
WHERE [SCR_FormName] IN ('frmEntrega','frmRelacionOC','frmScrapDinero','frmScrapPorcen',
'frmRetrabajo','frmRetrabajoDinero','frmCumplimiento','frmPromCumpli','frmCargaTrabajo',
'frmProductividad','frmProdEmpleado','frmProdEmpleadoDinero','frmPiezasTerminadas','frmEntradasSalidasBorradas',
'frmEscasos','frmESLarco','frmESAlmacen','frmMaterialesPorOrden','frmCumplimientoTiempoEntrega')



ALTER TABLE tblScreens
ALTER COLUMN [ModuleOrder] [int] NOT NULL

