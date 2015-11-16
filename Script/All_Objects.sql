USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Categories]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Categories]
GO
/****** Object:  StoredProcedure [dbo].[PastDueOrdersBeforeTask]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PastDueOrdersBeforeTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PastDueOrdersBeforeTask]
GO
/****** Object:  StoredProcedure [dbo].[PastDueOrdersInTask]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PastDueOrdersInTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PastDueOrdersInTask]
GO
/****** Object:  UserDefinedFunction [dbo].[GetDueDate]    Script Date: 11/16/2015 14:41:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDueDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetDueDate]
GO
/****** Object:  StoredProcedure [dbo].[Grupos]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Grupos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Grupos]
GO
/****** Object:  StoredProcedure [dbo].[Screens]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Screens]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Screens]
GO
/****** Object:  StoredProcedure [dbo].[TiposMaterial]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TiposMaterial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TiposMaterial]
GO
/****** Object:  StoredProcedure [dbo].[Paises]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paises]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Paises]
GO
/****** Object:  StoredProcedure [dbo].[UnidadesMedida]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnidadesMedida]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UnidadesMedida]
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemTasksUserLogin]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateItemTasksUserLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateItemTasksUserLogin]
GO
/****** Object:  Table [dbo].[tblScreens]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblScreens]') AND type in (N'U'))
DROP TABLE [dbo].[tblScreens]
GO
/****** Object:  View [dbo].[PendingOrders_VW]    Script Date: 11/16/2015 14:41:52 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PendingOrders_VW]'))
DROP VIEW [dbo].[PendingOrders_VW]
GO
/****** Object:  StoredProcedure [dbo].[Productividad_Empleado]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Productividad_Empleado]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Productividad_Empleado]
GO
/****** Object:  StoredProcedure [dbo].[Productividad_Empleado_Dinero]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Productividad_Empleado_Dinero]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Productividad_Empleado_Dinero]
GO
/****** Object:  View [dbo].[Routing_VW]    Script Date: 11/16/2015 14:41:52 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Routing_VW]'))
DROP VIEW [dbo].[Routing_VW]
GO
/****** Object:  StoredProcedure [dbo].[SalidasLarcoBorrar]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalidasLarcoBorrar]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SalidasLarcoBorrar]
GO
/****** Object:  StoredProcedure [dbo].[SalidasLarcoEditar]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalidasLarcoEditar]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SalidasLarcoEditar]
GO
/****** Object:  StoredProcedure [dbo].[SalidasLarco]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalidasLarco]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SalidasLarco]
GO
/****** Object:  Table [dbo].[tblSalidas]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidas]') AND type in (N'U'))
DROP TABLE [dbo].[tblSalidas]
GO
/****** Object:  UserDefinedFunction [dbo].[GetNonWorkingDays]    Script Date: 11/16/2015 14:41:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetNonWorkingDays]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetNonWorkingDays]
GO
/****** Object:  StoredProcedure [dbo].[Carga_Trabajo]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carga_Trabajo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Carga_Trabajo]
GO
/****** Object:  StoredProcedure [dbo].[ExchangeRate]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExchangeRate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ExchangeRate]
GO
/****** Object:  Table [dbo].[tblGroups]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblGroups]') AND type in (N'U'))
DROP TABLE [dbo].[tblGroups]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 11/16/2015 14:41:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCategories]') AND type in (N'U'))
DROP TABLE [dbo].[tblCategories]
GO
/****** Object:  Table [dbo].[tblCategory_Screens]    Script Date: 11/16/2015 14:41:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCategory_Screens]') AND type in (N'U'))
DROP TABLE [dbo].[tblCategory_Screens]
GO
/****** Object:  StoredProcedure [dbo].[Upload_File]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Upload_File]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Upload_File]
GO
/****** Object:  Table [dbo].[tblClientes]    Script Date: 11/16/2015 14:41:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblClientes]') AND type in (N'U'))
DROP TABLE [dbo].[tblClientes]
GO
/****** Object:  Table [dbo].[tblContribuyente]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblContribuyente]') AND type in (N'U'))
DROP TABLE [dbo].[tblContribuyente]
GO
/****** Object:  StoredProcedure [dbo].[ItemTasks]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemTasks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ItemTasks]
GO
/****** Object:  Table [dbo].[tblDescriptions]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblDescriptions]') AND type in (N'U'))
DROP TABLE [dbo].[tblDescriptions]
GO
/****** Object:  Table [dbo].[tblEmpleados]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEmpleados]') AND type in (N'U'))
DROP TABLE [dbo].[tblEmpleados]
GO
/****** Object:  Table [dbo].[tblSalidasDetalle]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblSalidasDetalle_IS_SL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblSalidasDetalle] DROP CONSTRAINT [DF_tblSalidasDetalle_IS_SL]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidasDetalle]') AND type in (N'U'))
DROP TABLE [dbo].[tblSalidasDetalle]
GO
/****** Object:  Table [dbo].[tblMateriales]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblMateriales_MAT_Kilos]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblMateriales] DROP CONSTRAINT [DF_tblMateriales_MAT_Kilos]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMateriales]') AND type in (N'U'))
DROP TABLE [dbo].[tblMateriales]
GO
/****** Object:  Table [dbo].[tblEntradasDetalle]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasDetalle]') AND type in (N'U'))
DROP TABLE [dbo].[tblEntradasDetalle]
GO
/****** Object:  Table [dbo].[tblEntradasDetalle_History]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasDetalle_History]') AND type in (N'U'))
DROP TABLE [dbo].[tblEntradasDetalle_History]
GO
/****** Object:  Table [dbo].[tblEntradas]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblEntradas_Dolares]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblEntradas] DROP CONSTRAINT [DF_tblEntradas_Dolares]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradas]') AND type in (N'U'))
DROP TABLE [dbo].[tblEntradas]
GO
/****** Object:  Table [dbo].[tblEntradasSalidas]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasSalidas]') AND type in (N'U'))
DROP TABLE [dbo].[tblEntradasSalidas]
GO
/****** Object:  Table [dbo].[tblExchangeRate]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblExchangeRate]') AND type in (N'U'))
DROP TABLE [dbo].[tblExchangeRate]
GO
/****** Object:  Table [dbo].[tblFacturas]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblFacturas]') AND type in (N'U'))
DROP TABLE [dbo].[tblFacturas]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Orden]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Delete_Orden]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Delete_Orden]
GO
/****** Object:  StoredProcedure [dbo].[Update_Orden]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Update_Orden]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Update_Orden]
GO
/****** Object:  Table [dbo].[tblMergeOrdenes]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMergeOrdenes]') AND type in (N'U'))
DROP TABLE [dbo].[tblMergeOrdenes]
GO
/****** Object:  Table [dbo].[tblMonitor]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMonitor]') AND type in (N'U'))
DROP TABLE [dbo].[tblMonitor]
GO
/****** Object:  Table [dbo].[tblNonWorkingDay]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblNonWorkingDay]') AND type in (N'U'))
DROP TABLE [dbo].[tblNonWorkingDay]
GO
/****** Object:  Table [dbo].[tblGrupos]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblGrupos]') AND type in (N'U'))
DROP TABLE [dbo].[tblGrupos]
GO
/****** Object:  Table [dbo].[tblInventariosConf]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblInventariosConf]') AND type in (N'U'))
DROP TABLE [dbo].[tblInventariosConf]
GO
/****** Object:  StoredProcedure [dbo].[ChangeStatus]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ChangeStatus]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Orden]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Insert_Orden]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Insert_Orden]
GO
/****** Object:  StoredProcedure [dbo].[ActivarOrden]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActivarOrden]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ActivarOrden]
GO
/****** Object:  StoredProcedure [dbo].[ItemStatus]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ItemStatus]
GO
/****** Object:  StoredProcedure [dbo].[EntradasSalidasAlmacen]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EntradasSalidasAlmacen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[EntradasSalidasAlmacen]
GO
/****** Object:  StoredProcedure [dbo].[EntradasSalidasLarco]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EntradasSalidasLarco]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[EntradasSalidasLarco]
GO
/****** Object:  StoredProcedure [dbo].[crosstab_Original]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[crosstab_Original]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[crosstab_Original]
GO
/****** Object:  StoredProcedure [dbo].[Cumplimiento]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cumplimiento]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Cumplimiento]
GO
/****** Object:  StoredProcedure [dbo].[CumplimientoNoATiempo]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CumplimientoNoATiempo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CumplimientoNoATiempo]
GO
/****** Object:  UserDefinedFunction [dbo].[ISOweek]    Script Date: 11/16/2015 14:41:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ISOweek]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ISOweek]
GO
/****** Object:  StoredProcedure [dbo].[MaterialesEscasos]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MaterialesEscasos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MaterialesEscasos]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHours]    Script Date: 11/16/2015 14:41:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetHours]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetHours]
GO
/****** Object:  StoredProcedure [dbo].[Facturas_Ordenes_Compra]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facturas_Ordenes_Compra]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Facturas_Ordenes_Compra]
GO
/****** Object:  StoredProcedure [dbo].[Facturas_Ordenes_Trabajo]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facturas_Ordenes_Trabajo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Facturas_Ordenes_Trabajo]
GO
/****** Object:  UserDefinedFunction [dbo].[FormatZeros]    Script Date: 11/16/2015 14:41:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormatZeros]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[FormatZeros]
GO
/****** Object:  Table [dbo].[tblEntradas_History]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradas_History]') AND type in (N'U'))
DROP TABLE [dbo].[tblEntradas_History]
GO
/****** Object:  StoredProcedure [dbo].[Relacion_Orden_Compra]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Relacion_Orden_Compra]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Relacion_Orden_Compra]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAggregateValue]    Script Date: 11/16/2015 14:41:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAggregateValue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetAggregateValue]
GO
/****** Object:  Table [dbo].[tblProductos]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductos]') AND type in (N'U'))
DROP TABLE [dbo].[tblProductos]
GO
/****** Object:  Table [dbo].[tblStock]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblStock]') AND type in (N'U'))
DROP TABLE [dbo].[tblStock]
GO
/****** Object:  StoredProcedure [dbo].[Facturas_Detalle]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facturas_Detalle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Facturas_Detalle]
GO
/****** Object:  Table [dbo].[tblFacturasDetalle]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblFacturasDetalle]') AND type in (N'U'))
DROP TABLE [dbo].[tblFacturasDetalle]
GO
/****** Object:  StoredProcedure [dbo].[Traer_Ordenes]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Traer_Ordenes]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Traer_Ordenes]
GO
/****** Object:  Table [dbo].[tblStockOrdenes]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblStockOrdenes_Aprobacion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblStockOrdenes] DROP CONSTRAINT [DF_tblStockOrdenes_Aprobacion]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblStockOrdenes_Dolares]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblStockOrdenes] DROP CONSTRAINT [DF_tblStockOrdenes_Dolares]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblStockOrdenes_Stock]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblStockOrdenes] DROP CONSTRAINT [DF_tblStockOrdenes_Stock]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblStockOrdenes_Programado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblStockOrdenes] DROP CONSTRAINT [DF_tblStockOrdenes_Programado]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tblStockO__Urgen__3118447E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblStockOrdenes] DROP CONSTRAINT [DF__tblStockO__Urgen__3118447E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblStockOrdenes]') AND type in (N'U'))
DROP TABLE [dbo].[tblStockOrdenes]
GO
/****** Object:  Table [dbo].[tblSalidas_History]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidas_History]') AND type in (N'U'))
DROP TABLE [dbo].[tblSalidas_History]
GO
/****** Object:  Table [dbo].[tblSalidasDetalle_History]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidasDetalle_History]') AND type in (N'U'))
DROP TABLE [dbo].[tblSalidasDetalle_History]
GO
/****** Object:  Table [dbo].[tblSalidasLarco]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidasLarco]') AND type in (N'U'))
DROP TABLE [dbo].[tblSalidasLarco]
GO
/****** Object:  Table [dbo].[tblPaises]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPaises]') AND type in (N'U'))
DROP TABLE [dbo].[tblPaises]
GO
/****** Object:  Table [dbo].[tblPlano]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPlano]') AND type in (N'U'))
DROP TABLE [dbo].[tblPlano]
GO
/****** Object:  Table [dbo].[tblPlanoAlias]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPlanoAlias]') AND type in (N'U'))
DROP TABLE [dbo].[tblPlanoAlias]
GO
/****** Object:  Table [dbo].[tblProductosTerminados]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductosTerminados]') AND type in (N'U'))
DROP TABLE [dbo].[tblProductosTerminados]
GO
/****** Object:  Table [dbo].[tblProductosTerminadosDetalle]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductosTerminadosDetalle]') AND type in (N'U'))
DROP TABLE [dbo].[tblProductosTerminadosDetalle]
GO
/****** Object:  Table [dbo].[tblProvedores]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProvedores]') AND type in (N'U'))
DROP TABLE [dbo].[tblProvedores]
GO
/****** Object:  Table [dbo].[tblRetrabajo]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblRetrabajo]') AND type in (N'U'))
DROP TABLE [dbo].[tblRetrabajo]
GO
/****** Object:  Table [dbo].[ScreenConfig]    Script Date: 11/16/2015 14:41:49 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ScreenConfig_ShowPastDueInTask]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ScreenConfig] DROP CONSTRAINT [DF_ScreenConfig_ShowPastDueInTask]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ScreenConfig_ShowPastDueBeforeTask]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ScreenConfig] DROP CONSTRAINT [DF_ScreenConfig_ShowPastDueBeforeTask]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ScreenConfig_ShowUrgent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ScreenConfig] DROP CONSTRAINT [DF_ScreenConfig_ShowUrgent]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ScreenConfig_ShowBanner]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ScreenConfig] DROP CONSTRAINT [DF_ScreenConfig_ShowBanner]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ScreenConfig_BannerTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ScreenConfig] DROP CONSTRAINT [DF_ScreenConfig_BannerTime]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ScreenConfig_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ScreenConfig] DROP CONSTRAINT [DF_ScreenConfig_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ScreenCon__Minim__38B96646]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ScreenConfig] DROP CONSTRAINT [DF__ScreenCon__Minim__38B96646]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ScreenCon__Detai__39AD8A7F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ScreenConfig] DROP CONSTRAINT [DF__ScreenCon__Detai__39AD8A7F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScreenConfig]') AND type in (N'U'))
DROP TABLE [dbo].[ScreenConfig]
GO
/****** Object:  StoredProcedure [dbo].[Traer_Terminadas]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Traer_Terminadas]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Traer_Terminadas]
GO
/****** Object:  Table [dbo].[tblGroup_Screens]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblGroup_Screens]') AND type in (N'U'))
DROP TABLE [dbo].[tblGroup_Screens]
GO
/****** Object:  Table [dbo].[tblTiposMaterial]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTiposMaterial]') AND type in (N'U'))
DROP TABLE [dbo].[tblTiposMaterial]
GO
/****** Object:  Table [dbo].[tblUnidadesMedida]    Script Date: 11/16/2015 14:41:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUnidadesMedida]') AND type in (N'U'))
DROP TABLE [dbo].[tblUnidadesMedida]
GO
/****** Object:  Table [dbo].[tblUser_Groups]    Script Date: 11/16/2015 14:41:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUser_Groups]') AND type in (N'U'))
DROP TABLE [dbo].[tblUser_Groups]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 11/16/2015 14:41:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUsers]') AND type in (N'U'))
DROP TABLE [dbo].[tblUsers]
GO
/****** Object:  Table [dbo].[tblYear]    Script Date: 11/16/2015 14:41:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblYear]') AND type in (N'U'))
DROP TABLE [dbo].[tblYear]
GO
/****** Object:  Table [dbo].[tblScrap]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblScrap]') AND type in (N'U'))
DROP TABLE [dbo].[tblScrap]
GO
/****** Object:  Table [dbo].[tblOrdenes]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblOrdenes_Aprobacion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblOrdenes] DROP CONSTRAINT [DF_tblOrdenes_Aprobacion]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblOrdenes_Dolares]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblOrdenes] DROP CONSTRAINT [DF_tblOrdenes_Dolares]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tblOrdene__Urgen__30242045]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblOrdenes] DROP CONSTRAINT [DF__tblOrdene__Urgen__30242045]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblOrdenes]') AND type in (N'U'))
DROP TABLE [dbo].[tblOrdenes]
GO
/****** Object:  Table [dbo].[Subscribers]    Script Date: 11/16/2015 14:41:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subscribers]') AND type in (N'U'))
DROP TABLE [dbo].[Subscribers]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 11/16/2015 14:41:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banners]') AND type in (N'U'))
DROP TABLE [dbo].[Banners]
GO
/****** Object:  Table [dbo].[tblRouting]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblRouting]') AND type in (N'U'))
DROP TABLE [dbo].[tblRouting]
GO
/****** Object:  Table [dbo].[tblItemTasks]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblItemTasks]') AND type in (N'U'))
DROP TABLE [dbo].[tblItemTasks]
GO
/****** Object:  Table [dbo].[tblItems]    Script Date: 11/16/2015 14:41:50 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblItems_ITE_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblItems] DROP CONSTRAINT [DF_tblItems_ITE_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND type in (N'U'))
DROP TABLE [dbo].[tblItems]
GO
/****** Object:  StoredProcedure [dbo].[Ordenes_Antes_Tarea]    Script Date: 11/16/2015 14:41:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ordenes_Antes_Tarea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Ordenes_Antes_Tarea]
GO
/****** Object:  Table [dbo].[tblTareas]    Script Date: 11/16/2015 14:41:51 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblTareas_IsPutOnly]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblTareas] DROP CONSTRAINT [DF_tblTareas_IsPutOnly]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblTareas_IsConjuncion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblTareas] DROP CONSTRAINT [DF_tblTareas_IsConjuncion]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblTareas_IsLast]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblTareas] DROP CONSTRAINT [DF_tblTareas_IsLast]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTareas]') AND type in (N'U'))
DROP TABLE [dbo].[tblTareas]
GO
/****** Object:  Table [dbo].[tblAggregateValue]    Script Date: 11/16/2015 14:41:49 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tblAggreg__Befor__320C68B7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblAggregateValue] DROP CONSTRAINT [DF__tblAggreg__Befor__320C68B7]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAggregateValue]') AND type in (N'U'))
DROP TABLE [dbo].[tblAggregateValue]
GO
/****** Object:  Table [dbo].[tblAggregateValue]    Script Date: 11/16/2015 14:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAggregateValue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblAggregateValue](
	[Product_ID] [int] NULL,
	[Task_ID] [int] NULL,
	[Value] [decimal](18, 2) NULL,
	[BeforeDays] [int] NULL DEFAULT ((0)),
	[ProdTaskId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AggregateValue] PRIMARY KEY CLUSTERED 
(
	[ProdTaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblTareas]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTareas]') AND type in (N'U'))
BEGIN
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblTareas]') AND name = N'INX_Nombre')
CREATE NONCLUSTERED INDEX [INX_Nombre] ON [dbo].[tblTareas] 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Ordenes_Antes_Tarea]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ordenes_Antes_Tarea]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- Ordenes_Antes_Tarea ''VentasFinal'','' AND  SUBSTRING(I.ITE_Nombre,4,3)  = ''''036''''''
create   PROCEDURE [dbo].[Ordenes_Antes_Tarea]
  @TASK   AS VARCHAR(50),
  @FILTER AS VARCHAR(1000)
AS 

DECLARE @ISLAST AS BIT
DECLARE @SQL AS VARCHAR(8000)

SELECT @ISLAST = IsLast FROM tblTareas WHERE Nombre = @TASK

IF (@ISLAST = 0) BEGIN
		SET @SQL = ''SELECT COUNT(*) AS Antes '' + 
			   ''FROM tblItemTasks I '' +
			   ''INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] '' +
			   ''INNER JOIN tblOrdenes O ON I.ITE_ID = O.ITE_ID '' +
               ''INNER JOIN tblItems I2 ON I2.ITE_ID = I.ITE_ID '' +
			   ''INNER JOIN tblRouting R2 ON R2.Nombre = O.Producto AND R2.Rou_From = I.TAS_Id '' +
			   ''WHERE T.Nombre = '''''' + @TASK + '''''' AND I.ITS_Status IS NULL ''
END
ELSE BEGIN
		SET @SQL = ''SELECT COUNT(*) AS Antes '' + 
			   ''FROM tblItemTasks I '' +
			   ''INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] '' +
			   ''INNER JOIN tblOrdenes O ON I.ITE_ID = O.ITE_ID '' +
               ''INNER JOIN tblItems I2 ON I2.ITE_ID = I.ITE_ID '' +
			   ''INNER JOIN tblRouting R2 ON R2.Nombre = O.Producto AND R2.Rou_TO = I.TAS_Id '' +
			   ''WHERE T.Nombre = '''''' + @TASK + '''''' AND I.ITS_Status IS NULL ''
END

PRINT(@SQL + @FILTER) 
EXEC(@SQL + @FILTER)








' 
END
GO
/****** Object:  Table [dbo].[tblItems]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblItems](
	[ITE_ID] [int] IDENTITY(1,1) NOT NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[PRO_Nombre] [varchar](50) NULL,
	[CLI_Clave] [varchar](50) NULL,
	[ITE_Fecha] [datetime] NULL,
	[ITE_Priority] [decimal](18, 4) NULL,
	[ITE_Status] [bit] NULL CONSTRAINT [DF_tblItems_ITE_Status]  DEFAULT (0),
 CONSTRAINT [PK_ITE_ID] PRIMARY KEY CLUSTERED 
(
	[ITE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_Items_ITE_Nombre] UNIQUE NONCLUSTERED 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND name = N'INX_ITE_ID')
CREATE NONCLUSTERED INDEX [INX_ITE_ID] ON [dbo].[tblItems] 
(
	[ITE_ID] ASC
)
INCLUDE ( [ITE_Priority],
[ITE_Status]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND name = N'INX_ITE_Nombre')
CREATE NONCLUSTERED INDEX [INX_ITE_Nombre] ON [dbo].[tblItems] 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblItemTasks]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblItemTasks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblItemTasks](
	[ITE_Id] [int] NOT NULL,
	[TAS_Id] [int] NOT NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[ITS_Status] [tinyint] NULL,
	[ITS_DTStart] [datetime] NULL,
	[ITS_DTStop] [datetime] NULL,
	[USE_Login] [varchar](50) NULL,
	[ITS_Machine] [varchar](50) NULL,
 CONSTRAINT [UC_ID_TASK_Nombre] UNIQUE NONCLUSTERED 
(
	[ITE_Id] ASC,
	[ITE_Nombre] ASC,
	[TAS_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItemTasks]') AND name = N'INX_ITE_Nombre')
CREATE NONCLUSTERED INDEX [INX_ITE_Nombre] ON [dbo].[tblItemTasks] 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItemTasks]') AND name = N'INX_ITS_DTStop')
CREATE NONCLUSTERED INDEX [INX_ITS_DTStop] ON [dbo].[tblItemTasks] 
(
	[ITS_DTStop] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItemTasks]') AND name = N'INX_ITS_STATUS')
CREATE NONCLUSTERED INDEX [INX_ITS_STATUS] ON [dbo].[tblItemTasks] 
(
	[ITS_Status] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItemTasks]') AND name = N'INX_TAS_Id')
CREATE NONCLUSTERED INDEX [INX_TAS_Id] ON [dbo].[tblItemTasks] 
(
	[TAS_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblItemTasks]') AND name = N'INX_TUNE_RECO')
CREATE NONCLUSTERED INDEX [INX_TUNE_RECO] ON [dbo].[tblItemTasks] 
(
	[ITS_Status] ASC,
	[ITS_DTStop] ASC,
	[ITE_Id] ASC,
	[TAS_Id] ASC,
	[ITS_DTStart] ASC
)
INCLUDE ( [ITE_Nombre]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRouting]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblRouting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblRouting](
	[Rou_Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Rou_From] [int] NULL,
	[Rou_Code] [varchar](50) NULL,
	[Rou_To] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 11/16/2015 14:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banners]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Banners](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](500) NULL,
	[IP] [varchar](15) NOT NULL,
	[SessionId] [varchar](100) NOT NULL,
	[DisplayTime] [int] NULL,
	[UpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subscribers]    Script Date: 11/16/2015 14:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subscribers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Subscribers](
	[SubId] [int] IDENTITY(1,1) NOT NULL,
	[IP] [varchar](15) NOT NULL,
	[SessionId] [varchar](100) NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrdenes]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblOrdenes]') AND type in (N'U'))
BEGIN
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
	[Urgente] [bit] NULL DEFAULT ((0)),
 CONSTRAINT [uc_ITENombre] UNIQUE NONCLUSTERED 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblOrdenes]') AND name = N'INX_ITE_Nombre')
CREATE NONCLUSTERED INDEX [INX_ITE_Nombre] ON [dbo].[tblOrdenes] 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblScrap]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblScrap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblScrap](
	[SCR_ID] [int] IDENTITY(1,1) NOT NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[SCR_Motivo] [varchar](50) NULL,
	[SCR_Tarea] [varchar](50) NULL,
	[SCR_EmpleadoRes] [varchar](50) NULL,
	[SCR_Cantidad] [int] NULL,
	[SCR_Parcial] [bit] NULL,
	[SCR_Repro] [int] NULL,
	[USE_Login] [varchar](50) NULL,
	[SCR_Fecha] [datetime] NULL,
	[SCR_NewItem] [varchar](50) NULL,
	[SCR_Impreso] [bit] NULL,
	[SCR_Activo] [bit] NULL,
	[SCR_Detectado] [varchar](50) NULL,
	[SCR_EmpleadoDetectado] [int] NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL,
 CONSTRAINT [PK_SCR_ID] PRIMARY KEY CLUSTERED 
(
	[SCR_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_Scrap_ITE_Nombre] UNIQUE NONCLUSTERED 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblScrap]') AND name = N'INX_ITE_Nombre')
CREATE NONCLUSTERED INDEX [INX_ITE_Nombre] ON [dbo].[tblScrap] 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Trigger [TD_tblScrap]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblScrap]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TRIGGER [dbo].[TD_tblScrap] ON [dbo].[tblScrap]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON

    DELETE FROM tblOrdenes
    WHERE ITE_NOMBRE IN (SELECT SCR_NewItem FROM DELETED)   

    SET NOCOUNT OFF
END

'
GO
/****** Object:  Table [dbo].[tblYear]    Script Date: 11/16/2015 14:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblYear]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblYear](
	[Anio] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 11/16/2015 14:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblUsers](
	[USE_ID] [int] IDENTITY(1,1) NOT NULL,
	[USE_Login] [varchar](50) NULL,
	[USE_Password] [varchar](50) NULL,
	[USE_Name] [varchar](150) NULL,
	[USE_Role] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser_Groups]    Script Date: 11/16/2015 14:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUser_Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblUser_Groups](
	[USE_ID] [int] NULL,
	[Group_ID] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblUnidadesMedida]    Script Date: 11/16/2015 14:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUnidadesMedida]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblUnidadesMedida](
	[UNI_ID] [int] IDENTITY(1,1) NOT NULL,
	[UNI_Medida] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTiposMaterial]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTiposMaterial]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblTiposMaterial](
	[TIP_ID] [int] IDENTITY(1,1) NOT NULL,
	[TIP_Tipo] [varchar](50) NULL,
	[TIP_Descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGroup_Screens]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblGroup_Screens]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblGroup_Screens](
	[Group_Id] [int] NULL,
	[SCR_ID] [int] NULL,
	[Nuevo] [bit] NULL,
	[Editar] [bit] NULL,
	[Borrar] [bit] NULL,
	[Buscar] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[Traer_Terminadas]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Traer_Terminadas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create	PROCEDURE [dbo].[Traer_Terminadas]
(
  @TASK   AS VARCHAR(50),
  @FILTER AS VARCHAR(1000)
)
AS

	if exists (select * from tempdb..sysobjects where id = object_id(N''tempdb..#tmpTerminadas''))
	drop table #tmpTerminadas

	CREATE TABLE [#tmpTerminadas] (
		[ITE_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[ITE_Nombre] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[Late] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[ITE_Status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[ITS_DTStop] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	) ON [PRIMARY]

	DECLARE @SQL AS VARCHAR(8000)

	SET @SQL = ''INSERT INTO #tmpTerminadas SELECT I.ITE_ID,RTRIM(I.ITE_Nombre) AS ITE_Nombre, '' + 
	''CASE WHEN ITS_Status = 2 THEN 0 '' + 
	''WHEN dbo.GetHours(I.ITS_DTStart,GETDATE()) > T.Tiempo THEN 1 '' + 
	''WHEN dbo.GetHours(O.Interna,GETDATE()) > T.Interno THEN 1 '' + 
	''WHEN I2.ITE_Priority > 0.00 THEN 2 ELSE 0 END AS Late, '' +  
	''I2.ITE_Status, '' + 
	''I.ITS_DTStop '' +    
	''FROM tblItemTasks I '' + 
	''INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] '' + 
	''INNER JOIN tblItems I2 ON I2.ITE_ID = I.ITE_ID '' + 
	''INNER JOIN tblOrdenes O ON I.ITE_ID = O.ITE_ID '' + 
	''WHERE T.Nombre = '''''' + @TASK + '''''' AND I.ITS_Status = 2 '' + @FILTER + 
	'' ORDER BY I.ITS_DTStart Desc''

	PRINT(@SQL) 
    EXEC(@SQL)
    
	SELECT * FROM #tmpTerminadas WHERE ITS_DTStop > DATEADD(dd,-4,GETDATE())



' 
END
GO
/****** Object:  Table [dbo].[ScreenConfig]    Script Date: 11/16/2015 14:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScreenConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScreenConfig](
	[ScreenConfigId] [int] IDENTITY(1,1) NOT NULL,
	[PastDueText] [varchar](50) NOT NULL,
	[UrgentText] [varchar](50) NOT NULL,
	[TaskId] [int] NOT NULL,
	[ShowPastDueInTask] [bit] NOT NULL CONSTRAINT [DF_ScreenConfig_ShowPastDueInTask]  DEFAULT ((0)),
	[ShowPastDueBeforeTask] [bit] NOT NULL CONSTRAINT [DF_ScreenConfig_ShowPastDueBeforeTask]  DEFAULT ((0)),
	[ShowUrgent] [bit] NOT NULL CONSTRAINT [DF_ScreenConfig_ShowUrgent]  DEFAULT ((0)),
	[ShowBanner] [bit] NOT NULL CONSTRAINT [DF_ScreenConfig_ShowBanner]  DEFAULT ((0)),
	[BannerText] [varchar](100) NULL,
	[BannerTime] [int] NULL CONSTRAINT [DF_ScreenConfig_BannerTime]  DEFAULT ((0)),
	[UpdatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_ScreenConfig_UpdatedDate]  DEFAULT (getdate()),
	[MinimumTimeInTask] [int] NULL DEFAULT ((1)),
	[DetailTime] [int] NULL DEFAULT ((10)),
PRIMARY KEY CLUSTERED 
(
	[ScreenConfigId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [uc_TaskId] UNIQUE NONCLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRetrabajo]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblRetrabajo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblRetrabajo](
	[RET_ID] [int] IDENTITY(1,1) NOT NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[RET_Motivo] [varchar](50) NULL,
	[RET_Area] [varchar](50) NULL,
	[RET_Empleado] [varchar](50) NULL,
	[RET_Start] [datetime] NULL,
	[RET_Stop] [datetime] NULL,
	[RET_Detectado] [varchar](50) NULL,
	[RET_EmpleadoDetectado] [int] NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProvedores]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProvedores]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblProvedores](
	[PROV_ID] [int] IDENTITY(1,1) NOT NULL,
	[PROV_Nombre] [varchar](150) NULL,
	[PROV_Contacto] [varchar](150) NULL,
	[PROV_RFC] [varchar](50) NULL,
	[PROV_Calle] [varchar](150) NULL,
	[PROV_Numero] [varchar](50) NULL,
	[PROV_Colonia] [varchar](75) NULL,
	[PROV_CP] [varchar](10) NULL,
	[PROV_Ciudad] [varchar](50) NULL,
	[PROV_Estado] [varchar](50) NULL,
	[PROV_Telefono] [varchar](50) NULL,
	[PROV_Celular] [varchar](50) NULL,
	[PROV_Fax] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProductosTerminadosDetalle]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductosTerminadosDetalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblProductosTerminadosDetalle](
	[PTD_ID] [int] IDENTITY(1,1) NOT NULL,
	[PT_ID] [int] NULL,
	[MAT_ID] [int] NULL,
	[PTD_Cantidad] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblProductosTerminados]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductosTerminados]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblProductosTerminados](
	[PT_ID] [int] IDENTITY(1,1) NOT NULL,
	[PT_Fraccion] [varchar](50) NULL,
	[PT_Descripcion] [varchar](150) NULL,
	[PT_Unidad] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPlanoAlias]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPlanoAlias]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblPlanoAlias](
	[PA_Id] [int] IDENTITY(1,1) NOT NULL,
	[PN_Id] [int] NOT NULL,
	[PA_Alias] [varchar](50) NOT NULL,
	[PA_Tipo] [varchar](50) NOT NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL,
 CONSTRAINT [PK_tblPlanoAlias] PRIMARY KEY CLUSTERED 
(
	[PA_Alias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPlano]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPlano]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblPlano](
	[PN_Id] [int] IDENTITY(1,1) NOT NULL,
	[PN_Numero] [varchar](50) NOT NULL,
	[PN_Descripcion] [varchar](100) NULL,
	[PN_Imagen] [varchar](100) NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL,
 CONSTRAINT [PK_tblPlano] PRIMARY KEY CLUSTERED 
(
	[PN_Numero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPaises]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPaises]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblPaises](
	[PAIS_ID] [int] IDENTITY(1,1) NOT NULL,
	[PAIS_Nombre] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSalidasLarco]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidasLarco]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblSalidasLarco](
	[SL_ID] [int] IDENTITY(1,1) NOT NULL,
	[SL_Orden] [varchar](50) NULL,
	[SL_Fecha] [datetime] NULL,
	[USE_ID] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSalidasDetalle_History]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidasDetalle_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblSalidasDetalle_History](
	[SD_ID] [int] NOT NULL,
	[SAL_ID] [int] NULL,
	[MAT_ID] [int] NULL,
	[SD_Cantidad] [decimal](18, 2) NULL,
	[SL_Cantidad] [int] NULL,
	[SL_Pedimento] [varchar](50) NULL,
	[ED_ID] [int] NULL,
	[IS_SL] [bit] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSalidas_History]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidas_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblSalidas_History](
	[SAL_ID] [int] NULL,
	[SAL_Fecha] [datetime] NULL,
	[SAL_Orden] [varchar](50) NULL,
	[SAL_Solicitado] [int] NULL,
	[USE_ID] [int] NULL,
	[SALTH_Type] [varchar](50) NULL,
	[SALH_Fecha] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStockOrdenes]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblStockOrdenes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblStockOrdenes](
	[ITE_ID] [int] IDENTITY(1,1) NOT NULL,
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
	[Aprobacion] [bit] NULL CONSTRAINT [DF_tblStockOrdenes_Aprobacion]  DEFAULT (0),
	[Observaciones] [varchar](1000) NULL,
	[Otras] [varchar](500) NULL,
	[Unitario] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[Dolares] [bit] NULL CONSTRAINT [DF_tblStockOrdenes_Dolares]  DEFAULT (0),
	[Stock] [bit] NULL CONSTRAINT [DF_tblStockOrdenes_Stock]  DEFAULT (0),
	[Programado] [bit] NULL CONSTRAINT [DF_tblStockOrdenes_Programado]  DEFAULT (0),
	[Cantidad] [int] NULL,
	[FileName] [varchar](50) NULL,
	[AddBy] [varchar](50) NULL,
	[AddDate] [datetime] NULL,
	[FAC_Id] [int] NULL,
	[PN_Id] [int] NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL,
	[ST_ID] [int] NULL,
	[Mezclado] [bit] NULL,
	[Requisicion] [varchar](50) NULL,
	[Urgente] [bit] NULL DEFAULT ((0))
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Traer_Ordenes]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Traer_Ordenes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Traer_Ordenes ''07''
CREATE	PROCEDURE [dbo].[Traer_Ordenes]
(
	@ANIO	VARCHAR(2)
)
AS

	SELECT ITE_Id,ITE_Nombre,TipoProceso,Requerida,Ordenada,Numero,Terminal,
	Entrega,Interna,Recibido,Unitario,Observaciones,Otras,Total,Nombre,Producto,
	Aprobacion,Dolares,OrdenCompra,0 AS Stock,PN_Id,StockParcial,StockParcialCantidad,
	0 AS Mezclado, Requisicion, Urgente
	INTO #tmpOrdenes
	FROM tblOrdenes
	WHERE Left(ITE_Nombre,2) = @ANIO 
	ORDER BY ITE_ID
	
	
	INSERT INTO #tmpOrdenes
	SELECT ITE_Id,ITE_Nombre,TipoProceso,Requerida,Ordenada,Numero,Terminal,
	Entrega,Interna,Recibido,Unitario,Observaciones,Otras,Total,Nombre,Producto,
	Aprobacion,Dolares,OrdenCompra,Stock,PN_Id,0 AS StockParcial,NULL AS StockParcialCantidad,
	Mezclado, Requisicion, Urgente
	FROM tblStockOrdenes
	WHERE Left(ITE_Nombre,2) = @ANIO AND (Stock = 1 OR Mezclado = 1)
	ORDER BY ITE_ID
	
	SELECT ITE_Id,ITE_Nombre,TipoProceso,Requerida,Ordenada,Numero,Terminal,
	Entrega,Interna,Recibido,Unitario,Observaciones,Otras,Total,Nombre,Producto,
	Aprobacion,Dolares,OrdenCompra,Stock,PN_Id,StockParcial,StockParcialCantidad,
	Mezclado, Requisicion, Urgente
	FROM  #tmpOrdenes ORDER BY ITE_Nombre
' 
END
GO
/****** Object:  Table [dbo].[tblFacturasDetalle]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblFacturasDetalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblFacturasDetalle](
	[FC_ID] [int] IDENTITY(1,1) NOT NULL,
	[FAC_ID] [int] NULL,
	[ITE_Nombre] [varchar](50) NULL,
	[FD_Cantidad] [int] NULL,
	[FD_Desc] [varchar](150) NULL,
	[FD_Numero] [varchar](50) NULL,
	[FD_Stock] [int] NULL,
	[FD_Dolares] [char](1) NULL,
	[FD_Unitario] [decimal](18, 2) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [TI_tblFacturasDetalle]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblFacturasDetalle]'))
EXEC dbo.sp_executesql @statement = N'
create        TRIGGER [dbo].[TI_tblFacturasDetalle] ON [dbo].[tblFacturasDetalle]
FOR INSERT, UPDATE
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE 
	@ITE_NOMBRE	VARCHAR(50),
	@FAC_ID		INT,
	@STOCK		BIT

    SELECT @ITE_NOMBRE = I.ITE_NOMBRE, @STOCK = FD_Stock, @FAC_ID = FAC_ID  
    FROM INSERTED I

    IF(@STOCK = 0)BEGIN
	UPDATE tblOrdenes SET FAC_ID = @FAC_ID WHERE ITE_NOMBRE = @ITE_NOMBRE
    END ELSE BEGIN
	UPDATE tblStockOrdenes SET FAC_ID = @FAC_ID WHERE ITE_NOMBRE = @ITE_NOMBRE
    END

    SET NOCOUNT OFF
END

'
GO
/****** Object:  Trigger [TD_tblFacturasDetalle]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblFacturasDetalle]'))
EXEC dbo.sp_executesql @statement = N'
create         TRIGGER [dbo].[TD_tblFacturasDetalle] ON [dbo].[tblFacturasDetalle]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE 
	@ITE_NOMBRE	VARCHAR(50),
	@STOCK		BIT

	/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
	DECLARE Facturas_Deleted CURSOR FOR
	
	SELECT ITE_NOMBRE,FD_Stock FROM DELETED
	
	/*OPEN CURSOR*/
	OPEN Facturas_Deleted
	/*GET FIRST RECORD INTO VARIABLE*/
	FETCH NEXT FROM Facturas_Deleted INTO @ITE_NOMBRE,@STOCK
	WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
	BEGIN
	
		IF(@STOCK = 0)BEGIN
		UPDATE tblOrdenes SET FAC_ID = NULL WHERE ITE_NOMBRE = @ITE_NOMBRE
		END ELSE BEGIN
		UPDATE tblStockOrdenes SET FAC_ID = NULL WHERE ITE_NOMBRE = @ITE_NOMBRE
		END

	   FETCH NEXT FROM Facturas_Deleted INTO @ITE_NOMBRE,@STOCK
	END
	
	/*CLOSE CURSOR*/
	CLOSE Facturas_Deleted
	DEALLOCATE Facturas_Deleted

    SET NOCOUNT OFF
END

'
GO
/****** Object:  StoredProcedure [dbo].[Facturas_Detalle]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facturas_Detalle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- SELECT * FROM tblFacturas
-- SELECT * FROM tblOrdenes
-- SELECT * FROM tblStockOrdenes
-- Facturas_Detalle 2
CREATE       PROCEDURE [dbo].[Facturas_Detalle]
    @FAC_ID AS INT
AS

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id = OBJECT_ID(N''tempdb..#tmpFacturasDetalle''))
DROP TABLE #tmpFacturasDetalle

CREATE TABLE [#tmpFacturasDetalle] (
	[ITE_Nombre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FD_Cantidad] [int] NULL ,
	[FD_Desc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FD_Numero] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DllText] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Unitario] [decimal](18, 2) NULL,
	[Stock] [int] NULL
) ON [PRIMARY]


INSERT INTO #tmpFacturasDetalle
SELECT F.ITE_Nombre, F.FD_Cantidad, F.FD_Desc, F.FD_Numero,
CASE WHEN O.Dolares = 0 THEN ''N'' ELSE ''Y'' END AS DllText,
O.Unitario, 0
FROM tblFacturasDetalle F
INNER JOIN tblOrdenes O ON F.ITE_Nombre = O.ITE_Nombre AND F.FAC_ID = O.FAC_ID
WHERE F.FAC_ID = @FAC_ID AND F.FD_Stock = 0

INSERT INTO #tmpFacturasDetalle
SELECT F.ITE_Nombre, F.FD_Cantidad, F.FD_Desc, F.FD_Numero,
CASE WHEN O.Dolares = 0 THEN ''N'' ELSE ''Y'' END AS DllText,
O.Unitario, 1
FROM tblFacturasDetalle F
INNER JOIN tblStockOrdenes O ON F.ITE_Nombre = O.ITE_Nombre AND F.FAC_ID = O.FAC_ID
WHERE F.FAC_ID = @FAC_ID AND F.FD_Stock = 1 

INSERT INTO #tmpFacturasDetalle
SELECT F.ITE_Nombre, F.FD_Cantidad, F.FD_Desc, F.FD_Numero,F.FD_Dolares,F.FD_Unitario,2
FROM tblFacturasDetalle F
WHERE F.FAC_ID = @FAC_ID AND F.FD_Stock = 2 



SELECT * FROM #tmpFacturasDetalle




' 
END
GO
/****** Object:  Table [dbo].[tblStock]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblStock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblStock](
	[ST_ID] [int] IDENTITY(1,1) NOT NULL,
	[PN_Id] [int] NOT NULL,
	[ITE_Nombre] [varchar](50) NOT NULL,
	[ST_Cantidad] [int] NOT NULL,
	[ST_Fecha] [datetime] NOT NULL,
	[ST_Tipo] [varchar](50) NOT NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProductos]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblProductos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Prioridad] [smallint] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [TI_tblTareas]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblTareas]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TI_tblTareas] ON [dbo].[tblTareas]
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


'
GO
/****** Object:  Trigger [TI_tblproductos]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblproductos]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TI_tblproductos] ON [dbo].[tblProductos]
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

'
GO
/****** Object:  Trigger [TD_tblTareas]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblTareas]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TD_tblTareas] ON [dbo].[tblTareas]
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


'
GO
/****** Object:  Trigger [TD_tblproductos]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblproductos]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TD_tblproductos] ON [dbo].[tblProductos]
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
'
GO
/****** Object:  UserDefinedFunction [dbo].[GetAggregateValue]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAggregateValue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  FUNCTION [dbo].[GetAggregateValue](@PRODUCT_ID AS INT, @TAS_ORDER AS INT) RETURNS DECIMAL(18,2)
AS 
BEGIN

DECLARE @AGGREGATEVALUE AS DECIMAL(18,2)
DECLARE @VALUE AS DECIMAL(18,2)

SELECT @VALUE = A.Value
FROM tblAggregateValue A
INNER JOIN tblTareas T ON A.Task_ID = T.[Id]
WHERE A.Product_ID = @PRODUCT_ID AND TAS_Order = @TAS_ORDER


SELECT @AGGREGATEVALUE = SUM(A.Value)
FROM tblAggregateValue A
INNER JOIN tblTareas T ON A.Task_ID = T.[Id]
WHERE A.Product_ID = @PRODUCT_ID AND TAS_Order < @TAS_ORDER


RETURN	@VALUE - @AGGREGATEVALUE

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Relacion_Orden_Compra]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Relacion_Orden_Compra]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/**

Le agregue el parametro @WWHERE para que en la pantalla se pueda 
filtrar por fecha de recibido este cambio lo pidio 
Daria el 18 de abril del 2011
**/
CREATE        PROCEDURE [dbo].[Relacion_Orden_Compra]
	@CLIENTE AS VARCHAR(8000),
	@ORDEN AS VARCHAR(8000),
	@COMPRA AS VARCHAR(50),
	@PARTE AS VARCHAR(50),
	@PRODUCTO AS VARCHAR(50),
	@PLANO AS VARCHAR(50),
	@FIRST AS BIT,
    @YEAR AS VARCHAR(2),
	@WHERE AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)
DECLARE @SQLWHERE AS VARCHAR(8000)
-- ***************************************************************************************
-- ********************* Delete and create temporary tables ******************************
-- ***************************************************************************************
if exists (select * from tempdb..sysobjects where id = object_id(N''tempdb..#tmpOrdenCompra''))
drop table #tmpOrdenCompra

if exists (select * from tempdb..sysobjects where id = object_id(N''tempdb..#tmpOrdenes''))
drop table #tmpOrdenes

CREATE TABLE [#tmpOrdenCompra] (
	[Orden] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Recibido] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OrdenCompra] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cantidad] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cliente] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Descripcion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Numero] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Entrega] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Interna] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Tarea] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Stock] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Programado] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Total] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Dolares] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Plano] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StockParcial] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StockParcialCantidad] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mezclado] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Revision] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Requisicion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL		
) ON [PRIMARY]

CREATE TABLE [#tmpOrdenes] (
	[Orden] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Recibido] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OrdenCompra] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cantidad] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cliente] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Descripcion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Numero] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Entrega] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Interna] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Tarea] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Stock] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Programado] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Total] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Dolares] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Plano] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StockParcial] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StockParcialCantidad] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mezclado] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MO_ITE_NOmbre] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Revision] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Requisicion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL									
) ON [PRIMARY]


PRINT(''Temporary Table created.'')
-- ***************************************************************************************
-- ****** Insert data into temporary table #tmpEmpData From .csv File ********************
-- ***************************************************************************************
SET @SQL = ''INSERT INTO #tmpOrdenCompra '' +
           ''SELECT RIGHT(O.ITE_Nombre,LEN(O.ITE_Nombre) - 3) AS Orden,CONVERT(VARCHAR(10),O.Recibido,101) AS Recibido,'' +
	   ''O.OrdenCompra,O.Ordenada As Cantidad, O.Requerida As Cliente, '' +
	   ''O.Producto As Descripcion,O.Numero,CONVERT(VARCHAR(10),O.Entrega,101) AS Entrega,CONVERT(VARCHAR(10),O.Interna,101) AS Interna, '' +
	   ''T.Nombre AS Tarea,CASE WHEN I.ITS_Status = 0 THEN ''''Listo'''' '' +
	   ''WHEN I.ITS_Status = 1 THEN ''''Activo'''' '' +
	   ''WHEN I.ITS_Status = 2 THEN ''''Terminado'''' END AS Status,'''''''',0,'''''''', '' +
	   ''O.Total,O.Dolares,O.PN_Id,StockParcial,StockParcialCantidad,0,O.Terminal,O.Requisicion '' +	
	   ''FROM tblOrdenes O '' +
	   ''INNER JOIN tblItemTasks I ON O.ITE_ID = I.ITE_ID AND ITS_DTStart IS NOT NULL AND ITS_DTStop IS NULL '' +
	   ''INNER JOIN tblTareas T ON T.[ID] = I.TAS_ID '' +
	   ''LEFT OUTER JOIN tblEmpleados E ON I.[USE_Login] = E.[ID] ''


    SET @SQLWHERE = '' I.ITS_Status <> 9 AND LEFT(O.ITE_Nombre,2) = '''''' + @YEAR + '''''' ''
    IF (@CLIENTE <> ''Todos'')
    BEGIN
        if (@SQLWHERE <> '''') 
		SET @SQLWHERE = @SQLWHERE + '' AND ''

        SET @SQLWHERE = @SQLWHERE + '' SUBSTRING(O.ITE_Nombre,4,3) IN ('''''' + REPLACE(@CLIENTE,'','','''''','''''') + '''''') ''

    END

    IF (@ORDEN <> ''Todos'')
    BEGIN
        if (@SQLWHERE <> '''') 
		SET @SQLWHERE = @SQLWHERE + '' AND ''

        SET @SQLWHERE = @SQLWHERE + '' SUBSTRING(O.ITE_Nombre,8,3) IN ('''''' + REPLACE(@ORDEN,'','','''''','''''') + '''''') ''

    END

    IF (@COMPRA <> ''Todos'')
    BEGIN
        if (@SQLWHERE <> '''') 
		SET @SQLWHERE = @SQLWHERE + '' AND ''

        SET @SQLWHERE = @SQLWHERE + ''O.OrdenCompra = '''''' + @COMPRA + ''''''''
    END

    IF (@PARTE <> ''Todos'')
    BEGIN
        IF (@SQLWHERE <> '''') 
		SET @SQLWHERE = @SQLWHERE + '' AND ''

        IF CHARINDEX(''*'', @PARTE) = 0 BEGIN
          SET @SQLWHERE = @SQLWHERE + ''O.Numero = '''''' + @PARTE + ''''''''
        END
        ELSE BEGIN
          SET @SQLWHERE = @SQLWHERE + ''O.Numero LIKE '''''' + REPLACE(@PARTE,''*'',''%'') + ''''''''
        END        
    END

    IF (@PRODUCTO <> ''Todos'')
    BEGIN
        IF (@SQLWHERE <> '''') 
		SET @SQLWHERE = @SQLWHERE + '' AND ''

        IF CHARINDEX(''*'', @PRODUCTO) = 0 BEGIN
          SET @SQLWHERE = @SQLWHERE + ''O.Producto = '''''' + @PRODUCTO + ''''''''
        END
        ELSE BEGIN
          SET @SQLWHERE = @SQLWHERE + ''O.Producto LIKE '''''' + REPLACE(@PRODUCTO,''*'',''%'') + ''''''''
        END        
    END

    IF (@FIRST = 0) BEGIN
	    IF (@WHERE <> '''')
	    BEGIN
	        if (@SQLWHERE <> '''') 
			SET @SQLWHERE = @SQLWHERE + '' AND ''
	
	        SET @SQLWHERE = @SQLWHERE + @WHERE
	    END
    END

    IF (@SQLWHERE <> '''')
    BEGIN
	 SET @SQL = @SQL + '' WHERE '' + @SQLWHERE
    END

PRINT(@SQL)
EXEC(@SQL)

-- INSERT LOS QUE ESTAN TERMINADOS EN VENTAS FINAL
PRINT(''@FIRST : '')
PRINT(@FIRST)
IF (@FIRST = 0) BEGIN

SET @SQL = ''INSERT INTO #tmpOrdenCompra '' +
           ''SELECT RIGHT(O.ITE_Nombre,LEN(O.ITE_Nombre) - 3) AS Orden,CONVERT(VARCHAR(10),O.Recibido,101) AS Recibido,'' +
	   ''O.OrdenCompra,O.Ordenada As Cantidad, O.Requerida As Cliente, '' +
     	   ''O.Producto As Descripcion,O.Numero,CONVERT(VARCHAR(10),O.Entrega,101) AS Entrega,CONVERT(VARCHAR(10),O.Interna,101) AS Interna, '' +
	   ''T.Nombre AS Tarea,CASE WHEN I.ITS_Status = 0 THEN ''''Listo'''' '' +
	   ''WHEN I.ITS_Status = 1 THEN ''''Activo'''' '' +
	   ''WHEN I.ITS_Status = 2 THEN ''''Terminado'''' END AS Status,'''''''',0,'''''''', '' +
	   ''O.Total,O.Dolares, O.PN_Id,StockParcial,StockParcialCantidad,0,O.Terminal,O.Requisicion '' +	
	   ''FROM tblOrdenes O '' +
	   ''INNER JOIN tblItemTasks I ON O.ITE_ID = I.ITE_ID AND ITS_DTStart IS NOT NULL AND ITS_DTStop IS NOT NULL '' +
	   ''INNER JOIN tblTareas T ON T.[ID] = I.TAS_ID AND T.Nombre = ''''VentasFinal'''' '' +
	   ''LEFT OUTER JOIN tblEmpleados E ON I.[USE_Login] = E.[ID] ''


    if (@SQLWHERE <> '''')
	 SET @SQL = @SQL + '' WHERE '' + @SQLWHERE

print(''ventas final....'')
PRINT(''Ventas Final :'' + @SQL)
EXEC(@SQL)

--- ******************************************************************

SET @SQL = ''INSERT INTO #tmpOrdenCompra '' +
           ''SELECT RIGHT(O.ITE_Nombre,LEN(O.ITE_Nombre) - 3) AS Orden,CONVERT(VARCHAR(10),O.Recibido,101) AS Recibido,'' +
	   ''O.OrdenCompra,O.Ordenada As Cantidad, O.Requerida As Cliente, '' +
	   ''O.Producto As Descripcion,O.Numero,CONVERT(VARCHAR(10),O.Entrega,101) AS Entrega,CONVERT(VARCHAR(10),O.Interna,101) AS Interna, '' +
	   '' '''''''' AS Tarea,'''''''' Status,FileName,Stock,Programado, '' +
	   ''O.Total,O.Dolares, O.PN_Id,0,'''''''',Mezclado,Terminal,Requisicion '' +	
	   ''FROM tblStockOrdenes O ''

    SET @SQLWHERE = '' LEFT(O.ITE_Nombre,2) = '''''' + @YEAR + '''''' ''
    IF (@CLIENTE <> ''Todos'')
    BEGIN
        if (@SQLWHERE <> '''') 
		SET @SQLWHERE = @SQLWHERE + '' AND ''

        SET @SQLWHERE = @SQLWHERE + '' SUBSTRING(O.ITE_Nombre,4,3) IN ('''''' + REPLACE(@CLIENTE,'','','''''','''''') + '''''') ''

    END

    IF (@ORDEN <> ''Todos'')
    BEGIN
        if (@SQLWHERE <> '''') 
		SET @SQLWHERE = @SQLWHERE + '' AND ''

        SET @SQLWHERE = @SQLWHERE + '' SUBSTRING(O.ITE_Nombre,8,3) IN ('''''' + REPLACE(@ORDEN,'','','''''','''''') + '''''') ''

    END

    IF (@COMPRA <> ''Todos'')
    BEGIN
        if (@SQLWHERE <> '''') 
		SET @SQLWHERE = @SQLWHERE + '' AND ''

        SET @SQLWHERE = @SQLWHERE + ''O.OrdenCompra = '''''' + @COMPRA + ''''''''
    END

    IF (@PARTE <> ''Todos'')
    BEGIN
        if (@SQLWHERE <> '''') 
		SET @SQLWHERE = @SQLWHERE + '' AND ''

        IF CHARINDEX(''*'', @PARTE) = 0 BEGIN
          SET @SQLWHERE = @SQLWHERE + ''O.Numero = '''''' + @PARTE + ''''''''
        END
        ELSE BEGIN
          SET @SQLWHERE = @SQLWHERE + ''O.Numero LIKE '''''' + REPLACE(@PARTE,''*'',''%'') + ''''''''
        END        
    END
   
    IF (@PRODUCTO <> ''Todos'')
    BEGIN
        IF (@SQLWHERE <> '''') 
		SET @SQLWHERE = @SQLWHERE + '' AND ''

        IF CHARINDEX(''*'', @PRODUCTO) = 0 BEGIN
          SET @SQLWHERE = @SQLWHERE + ''O.Producto = '''''' + @PRODUCTO + ''''''''
        END
        ELSE BEGIN
          SET @SQLWHERE = @SQLWHERE + ''O.Producto LIKE '''''' + REPLACE(@PRODUCTO,''*'',''%'') + ''''''''
        END        
    END    

IF (@SQLWHERE <> '''') 
	SET @SQLWHERE = @SQLWHERE + '' AND ''

SET @SQLWHERE = @SQLWHERE + '' Programado = 0 ''

IF (@WHERE <> '''') 
	SET @SQLWHERE = @SQLWHERE + ''AND '' + @WHERE


SET @SQL = @SQL + '' WHERE '' + @SQLWHERE

PRINT(@SQL)
EXEC(@SQL)


END -- Termina IF (@FIRST = 0)

SET @SQL = ''INSERT INTO #tmpOrdenes '' +
           ''SELECT O.Orden,O.Recibido,O.OrdenCompra,O.Cantidad,O.Cliente,O.Descripcion,O.Numero, '' +
           ''O.Entrega,O.Interna,O.Tarea,O.Status,O.FileName,O.Stock,O.Programado, '' +
           ''O.Total,O.Dolares,P.PN_Numero,StockParcial,StockParcialCantidad,Mezclado, '' + 
           ''RIGHT(M.MO_ITE_NOmbre,LEN(M.MO_ITE_NOmbre) - 3) AS MO_ITE_NOmbre,Revision,Requisicion '' +
           ''FROM #tmpOrdenCompra O '' +
           ''LEFT OUTER JOIN tblPlano P ON O.Plano = P.PN_Id '' +
           ''LEFT OUTER JOIN tblMergeOrdenes M ON O.Orden = RIGHT(M.ITE_Nombre,LEN(M.ITE_Nombre) - 3) ''

IF (@PLANO <> ''Todos'')
BEGIN
	SET @SQL = @SQL + '' WHERE ''

    IF CHARINDEX(''*'', @PLANO) = 0 BEGIN
      SET @SQL = @SQL + ''P.PN_Numero = '''''' + @PLANO + ''''''''
    END
    ELSE BEGIN
      SET @SQL = @SQL + ''P.PN_Numero LIKE '''''' + REPLACE(@PLANO,''*'',''%'') + ''''''''
    END        
END

print(''Test'')
PRINT(@SQL)
EXEC(@SQL)

SELECT * FROM #tmpOrdenes ORDER BY Orden

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
' 
END
GO
/****** Object:  Table [dbo].[tblEntradas_History]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradas_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblEntradas_History](
	[ENT_ID] [int] NULL,
	[ENT_Pedimento] [varchar](50) NULL,
	[ENT_ClavePedimento] [varchar](50) NULL,
	[ENT_Fecha] [datetime] NULL,
	[ENT_PaisOrigen] [int] NULL,
	[ENT_Nacional] [varchar](50) NULL,
	[ENT_TipoImp] [varchar](50) NULL,
	[ENT_Factura] [varchar](50) NULL,
	[ENT_OrdenCompra] [varchar](50) NULL,
	[PROV_ID] [int] NULL,
	[ENT_IVA] [int] NULL,
	[USE_ID] [int] NULL,
	[ENT_Dolares] [bit] NULL,
	[ENT_TipoCambio] [decimal](18, 2) NULL,
	[ENT_Desp] [int] NULL,
	[ENTH_Type] [varchar](50) NULL,
	[ENTH_Fecha] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[FormatZeros]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormatZeros]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE    Function [dbo].[FormatZeros](@NUMBER INT,@LEN AS INT) RETURNS VARCHAR(10)
AS
BEGIN
   DECLARE @ZEROS AS VARCHAR(10)
   DECLARE @STRNUM AS VARCHAR(10)
 	
   SET @ZEROS = ''000000000''	
   SELECT @STRNUM = CAST(@NUMBER AS VARCHAR(10))
 	
	
   RETURN(SELECT LEFT( @ZEROS,@LEN - LEN(@STRNUM) ) + @STRNUM  )
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Facturas_Ordenes_Trabajo]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facturas_Ordenes_Trabajo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- Facturas_Ordenes_Trabajo ''07'',''067'',''021'',''''
CREATE       PROCEDURE [dbo].[Facturas_Ordenes_Trabajo]
    @ANIO AS VARCHAR(2),
    @CLIENTE AS VARCHAR(3),
    @ORDENES_TRABAJO AS VARCHAR(8000),
    @ORDENES AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id = OBJECT_ID(N''tempdb..#tmpOrdenesTrabajo''))
DROP TABLE #tmpOrdenesTrabajo

CREATE TABLE [#tmpOrdenesTrabajo] (
	[ITE_Nombre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FD_Cantidad] [int] NULL ,
	[FD_Desc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FD_Numero] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DllText] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Unitario] [decimal](18, 2) NULL,
	[Stock] [bit] NULL
) ON [PRIMARY]

SET @SQL = ''INSERT INTO #tmpOrdenesTrabajo '' +
	   ''SELECT O.ITE_Nombre, O.Requerida, O.Otras,O.Numero,  '' +
           ''CASE WHEN O.Dolares = 0 THEN ''''N'''' ELSE ''''Y'''' END AS DllText,O.Unitario,0  '' +
	   ''FROM tblItemTasks I '' +
	   ''INNER JOIN tblTareas T ON I.TAS_ID = T.ID '' +
	   ''INNER JOIN tblOrdenes O ON O.ITE_Nombre = I.ITE_Nombre '' +
	   ''WHERE T.Nombre = ''''VentasFinal'''' AND I.ITS_STATUS = 2 AND LEFT(O.ITE_Nombre,2) = '' + @ANIO + '' '' +
	   ''AND O.FAC_Id IS NULL AND SUBSTRING(O.ITE_NOMBRE,5,2) = '' + RIGHT(@CLIENTE,2) + '' ''

IF('''' <> @ORDENES_TRABAJO AND ''Todos'' <> @ORDENES_TRABAJO)BEGIN
	SET @SQL = @SQL + '' AND SUBSTRING(O.ITE_NOMBRE,8,3) IN ('''''' + REPLACE(@ORDENES_TRABAJO,'','','''''','''''') + '''''') '' 
END

IF('''' <> @ORDENES)BEGIN
	SET @SQL = @SQL + '' AND O.ITE_Nombre NOT IN ('''''' + REPLACE(@ORDENES,'','','''''','''''') + '''''') '' 
END

PRINT(@SQL)
EXEC(@SQL)

SET @SQL = ''INSERT INTO #tmpOrdenesTrabajo '' +
	   ''SELECT O.ITE_Nombre, O.Requerida, O.Otras,O.Numero,  '' +
           ''CASE WHEN O.Dolares = 0 THEN ''''N'''' ELSE ''''Y'''' END AS DllText,O.Unitario,1  '' +
	   ''FROM tblStockOrdenes O '' +
	   ''WHERE LEFT(O.ITE_Nombre,2) = '' + @ANIO + '' '' +
	   ''AND O.FAC_Id IS NULL AND O.Programado = 0 AND SUBSTRING(O.ITE_NOMBRE,5,2) = '' + RIGHT(@CLIENTE,2) + '' ''

IF('''' <> @ORDENES_TRABAJO AND ''Todos'' <> @ORDENES_TRABAJO)BEGIN
	SET @SQL = @SQL + '' AND SUBSTRING(O.ITE_NOMBRE,8,3) IN ('''''' + REPLACE(@ORDENES_TRABAJO,'','','''''','''''') + '''''') '' 
END

IF('''' <> @ORDENES)BEGIN
	SET @SQL = @SQL + '' AND O.ITE_Nombre NOT IN ('''''' + REPLACE(@ORDENES,'','','''''','''''') + '''''') '' 
END

PRINT(@SQL)
EXEC(@SQL)

SELECT * FROM #tmpOrdenesTrabajo ORDER BY ITE_Nombre





' 
END
GO
/****** Object:  StoredProcedure [dbo].[Facturas_Ordenes_Compra]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facturas_Ordenes_Compra]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- Facturas_Ordenes_Compra ''07'',''007'',''07-007-007-02,07-007-004-02,07-007-007-04,07-007-007-05,07-007-007-12,07-007-007-14,07-007-007-19,07-007-007-01''
CREATE       PROCEDURE [dbo].[Facturas_Ordenes_Compra]
    @ANIO AS VARCHAR(2),
    @CLIENTE AS VARCHAR(3),
    @ORDENES AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id = OBJECT_ID(N''tempdb..#tmpOrdenesCompra''))
DROP TABLE #tmpOrdenesCompra

CREATE TABLE [#tmpOrdenesCompra] (
	[OrdenCompra] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]


SET @SQL = ''INSERT INTO #tmpOrdenesCompra '' +
	   ''SELECT DISTINCT SUBSTRING(O.ITE_NOMBRE,8,3) AS OrdenCompra  '' +
	   ''FROM tblItemTasks I '' +
	   ''INNER JOIN tblTareas T ON I.TAS_ID = T.ID '' +
	   ''INNER JOIN tblOrdenes O ON O.ITE_Nombre = I.ITE_Nombre '' +
	   ''WHERE T.Nombre = ''''VentasFinal'''' AND I.ITS_STATUS = 2 AND LEFT(O.ITE_Nombre,2) = '' + @ANIO + '' '' +
	   ''AND O.FAC_Id IS NULL AND SUBSTRING(O.ITE_NOMBRE,5,2) = '' + RIGHT(@CLIENTE,2) + '' ''

IF('''' <> @ORDENES)BEGIN
	SET @SQL = @SQL + '' AND O.ITE_Nombre NOT IN ('''''' + REPLACE(@ORDENES,'','','''''','''''') + '''''') '' 
END

PRINT(@SQL)
EXEC(@SQL)

SET @SQL = ''INSERT INTO #tmpOrdenesCompra '' +
	   ''SELECT DISTINCT SUBSTRING(O.ITE_NOMBRE,8,3) AS OrdenCompra  '' +
	   ''FROM tblStockOrdenes O '' +
	   ''WHERE LEFT(O.ITE_Nombre,2) = '' + @ANIO + '' '' +
	   ''AND O.FAC_Id IS NULL AND O.Programado = 0 AND SUBSTRING(O.ITE_NOMBRE,5,2) = '' + RIGHT(@CLIENTE,2) + '' ''

IF('''' <> @ORDENES)BEGIN
	SET @SQL = @SQL + '' AND O.ITE_Nombre NOT IN ('''''' + REPLACE(@ORDENES,'','','''''','''''') + '''''') '' 
END

PRINT(@SQL)
EXEC(@SQL)

SELECT DISTINCT OrdenCompra FROM #tmpOrdenesCompra ORDER BY OrdenCompra





' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetHours]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetHours]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- SELECT dbo.GetHours(''2006-04-18 00:00:00.000'',''2006-04-18 08:00:00.000'')

CREATE FUNCTION [dbo].[GetHours](@START AS DATETIME,@CURRENTDATE AS DATETIME) RETURNS DECIMAL(18,2)
AS 
BEGIN

DECLARE @STARTTIME AS VARCHAR(10)
DECLARE @ENDTIME AS VARCHAR(10)

SELECT @STARTTIME = ''07:00:00'', @ENDTIME = ''01:00:00''

DECLARE @DIFSTART AS INT
DECLARE @DIFEND AS INT
DECLARE @TIMEDIFF AS DECIMAL(18,2)
DECLARE @DAYS AS INT
DECLARE @HOURSLEFT AS DECIMAL(18,2)
DECLARE @DIFSTART2 AS INT
DECLARE @DIFEND2 AS INT
-- DECLARE @START AS DATETIME
-- DECLARE @CURRENTDATE AS DATETIME
-- 
-- SELECT @START = ''2006-04-11 01:00:00.000'', @CURRENTDATE = ''2006-04-12 08:30:00''

SELECT @TIMEDIFF = DATEDIFF(mi,@START,@CURRENTDATE )/60.00

SELECT @DAYS = (DATEDIFF(mi,@START,@CURRENTDATE) / 60 ) / 24
SELECT @HOURSLEFT = @TIMEDIFF - ( 24.00 * @DAYS)

SELECT @DIFSTART = DATEDIFF(mi, CONVERT(VARCHAR(10),@CURRENTDATE,101) + '' '' + @ENDTIME, @CURRENTDATE)
SELECT @DIFEND = DATEDIFF(mi, CONVERT(VARCHAR(10),@CURRENTDATE,101) + '' '' + @STARTTIME, @CURRENTDATE)

SELECT @DIFSTART2 = DATEDIFF(mi, CONVERT(VARCHAR(10),@START,101), @START)
SELECT @DIFEND2 = DATEDIFF(mi, CONVERT(VARCHAR(10),@START,101) + '' 01:00:00'', @START)

-- SI EL TIEMPO EN EL QUE LO ESTA CHECANDO ESTA ENTRE LA 1 AM Y LAS 7 AM
IF ( ( @DIFSTART > 0 ) AND ( @DIFEND < 0 ) )
BEGIN
	SET @TIMEDIFF = @TIMEDIFF - ( @DIFSTART / 60.00 )
END
ELSE IF ( @HOURSLEFT > 18.00 )
BEGIN
	SET @TIMEDIFF = @TIMEDIFF - 6.00
END
ELSE IF ( (@HOURSLEFT < 18.00) AND ( @DIFSTART2 >= 0 ) AND ( @DIFEND2 <= 0 ) AND ( @HOURSLEFT > 6.0 ) )
BEGIN
	SET @TIMEDIFF = @TIMEDIFF - 6.00
END

SELECT @TIMEDIFF = @TIMEDIFF - (@DAYS * 6.00)

RETURN	@TIMEDIFF

END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[MaterialesEscasos]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MaterialesEscasos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

--exec EntradasSalidasAlmacen ''Entradas'',''12/11/2007'',''12/11/2007 23:59:59.99'',0,''''


CREATE       PROCEDURE [dbo].[MaterialesEscasos]
    @TYPE AS VARCHAR(100),
    @WHERE AS VARCHAR(8000),
    @VALOR AS VARCHAR(25)
AS

DECLARE @SQL AS VARCHAR(8000)

IF (@TYPE = ''Menor a Cantidad Ideal'') BEGIN
	SET @SQL = ''SELECT MAT_Numero AS [Material ID],
		   MAT_Descripcion AS [Descripcion], MAT_Cantidad AS [Existencia],
		   MAT_Minimo AS [Minima], MAT_Maximo AS [Maxima], MAT_Stock AS [Ideal] 
		   FROM tblMateriales M WHERE MAT_Cantidad < MAT_Stock ''

END
ELSE IF (@TYPE = ''Menor a Cantidad Minima'') BEGIN
	SET @SQL = ''SELECT MAT_Numero AS [Material ID],
		   MAT_Descripcion AS [Descripcion], MAT_Cantidad AS [Existencia],
		   MAT_Minimo AS [Minima], MAT_Maximo AS [Maxima], MAT_Stock AS [Ideal] 
		   FROM tblMateriales M WHERE MAT_Cantidad < MAT_Minimo ''
END
ELSE BEGIN -- Menor a Valor Especifico
	SET @SQL = ''SELECT MAT_Numero AS [Material ID],
		   MAT_Descripcion AS [Descripcion], MAT_Cantidad AS [Existencia],
		   MAT_Minimo AS [Minima], MAT_Maximo AS [Maxima], MAT_Stock AS [Ideal] 
		   FROM tblMateriales M WHERE MAT_Cantidad < '' + @VALOR
END

PRINT(@SQL + @WHERE)
EXECUTE(@SQL + @WHERE)




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[ISOweek]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ISOweek]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[ISOweek]  (@DATE DATETIME)
RETURNS INT
AS
BEGIN
   DECLARE @ISOweek INT
   SET @ISOweek = DATEPART(wk,@DATE) 
                  +1 
                  -DATEPART(wk,CAST(DATEPART(yy,@DATE) AS CHAR(4))+''0104'')
   -- Special cases: Jan 1-3 may belong to the previous year
   IF (@ISOweek=0)
      SET @ISOweek = dbo.ISOweek(CAST(DATEPART(yy,@DATE) - 1
                     AS CHAR(4))+''12''+ CAST(24+DATEPART(DAY,@DATE) AS CHAR(2)))+1
   -- Special case: Dec 29-31 may belong to the next year
   IF ((DATEPART(mm,@DATE)=12) AND
      ((DATEPART(dd,@DATE)-DATEPART(dw,@DATE))>= 28))
      SET @ISOweek=1
   RETURN(@ISOweek)
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[CumplimientoNoATiempo]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CumplimientoNoATiempo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE     PROCEDURE [dbo].[CumplimientoNoATiempo]
	@FROM AS VARCHAR(50),
	@TO AS VARCHAR(50),
	@CLIENT AS VARCHAR(8000),
	@TYPE AS VARCHAR(50)
AS 

DECLARE @SQL AS VARCHAR(8000)
DECLARE @TASK AS VARCHAR(25)
IF (@CLIENT <> '''') BEGIN
	SELECT @CLIENT = '''''''' + REPLACE(@CLIENT,'','','''''','''''') + ''''''''
END

IF (@TYPE = ''Larco'') BEGIN
	SELECT @TYPE = ''Interna'', @TASK = ''Calidad''
END
ELSE BEGIN
	SELECT @TYPE = ''Entrega'', @TASK = ''VentasFinal''
END

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N''tempdb..#tmpOrdenes''))
DROP TABLE #tmpOrdenes

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N''tempdb..#tmpCump''))
DROP TABLE #tmpCump

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N''tempdb..#tmpItemTasks''))
DROP TABLE #tmpItemTasks

CREATE TABLE [#tmpCump] (
	[ITE_Nombre] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]


CREATE TABLE [#tmpOrdenes] (
	[ITE_ID] [int] NULL ,
	[ITE_Nombre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TipoProceso] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Requerida] [int] NULL ,
	[Ordenada] [int] NULL ,
	[Producto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Numero] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Terminal] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OrdenCompra] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Recibido] [datetime] NULL ,
	[Entrega] [datetime] NULL ,
	[Interna] [datetime] NULL ,
	[Nombre] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Aprobacion] [bit] NULL CONSTRAINT [DF_tblOrdenes_Aprobacion] DEFAULT (0),
	[Observaciones] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Otras] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Unitario] [decimal](18, 2) NULL ,
	[Total] [decimal](18, 2) NULL ,
	[Dolares] [bit] NULL CONSTRAINT [DF_tblOrdenes_Dolares] DEFAULT (0),
	[FAC_Id] [int] NULL 
) ON [PRIMARY]


CREATE TABLE [#tmpItemTasks] (
	[ITE_Nombre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ITS_Status] [tinyint] NULL ,
	[ITS_DTStart] [datetime] NULL ,
	[ITS_DTStop] [datetime] NULL ,
	[Nombre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

SET @SQL = ''INSERT INTO #tmpCump '' +
           ''SELECT I.ITE_Nombre '' +
           ''FROM tblItemTasks I '' +
	   ''INNER JOIN tblTareas T ON I.TAS_Id = T.[Id] '' + 
	   ''INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre '' +
           ''WHERE T.Nombre = '''''' + @TASK + '''''' AND ITS_Status IS NOT NULL '' +
           ''AND ITS_Status <> 9 AND ITS_DTStop <= CONVERT(VARCHAR(10),'' + @TYPE + '',101) + '''' 23:59:59.99'''' '' + 
	   ''AND ('' + @TYPE + '' >= '''''' + @FROM + '''''' AND '' + @TYPE + '' <= '''''' + @TO + '''''') '' +
	   ''AND I.ITE_NOMBRE NOT IN (SELECT ITE_NOMBRE FROM tblScrap) ''
	
IF (@CLIENT <> '''') BEGIN
	SET @SQL = @SQL + '' AND SUBSTRING(I.ITE_Nombre,4,3) IN ('' + @CLIENT + '') ''
END


EXEC(@SQL)


SET @SQL = ''INSERT INTO #tmpOrdenes SELECT ITE_ID,ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,'' + 
           ''Numero,Terminal,OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,'' + 
           ''Otras,Unitario,Total,Dolares,FAC_Id '' +
	       ''FROM tblOrdenes O  '' +
	       ''WHERE ('' + @TYPE + '' >= '''''' + @FROM + '''''' AND '' + @TYPE + '' <= '''''' + @TO + '''''') '' +
	       ''AND O.ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpCump) '' + 
           ''AND O.ITE_Nombre NOT IN (SELECT ITE_Nombre FROM tblScrap) ''

IF (@CLIENT <> '''') BEGIN
	SET @SQL = @SQL + '' AND SUBSTRING(O.ITE_Nombre,4,3) IN ('' + @CLIENT + '') ''
END

SET @SQL = @SQL + '' ORDER BY O.ITE_Nombre''

EXEC(@SQL)

SET @SQL = ''INSERT INTO #tmpItemTasks SELECT IT.ITE_Nombre, IT.ITS_Status, IT.ITS_DTStart, IT.ITS_DTStop, T.Nombre '' +
	   ''FROM tblItemTasks IT '' +
       ''INNER JOIN tblTareas T ON T.Id = IT.Tas_Id '' +
	   ''WHERE T.Nombre IN (''''Calidad'''', ''''VentasFinal'''')  '' +
	   ''AND ITE_NOMBRE IN (SELECT ITE_NOMBRE FROM #tmpOrdenes)''

EXEC(@SQL)

SELECT O.*, IT.ITS_DTStop AS Calidad, IT2.ITS_DTStop AS VentasFinal   
FROM #tmpOrdenes O
LEFT OUTER JOIN #tmpItemTasks IT ON O.ITE_Nombre = IT.ITE_Nombre AND IT.Nombre = ''Calidad''
LEFT OUTER JOIN #tmpItemTasks IT2 ON O.ITE_Nombre = IT2.ITE_Nombre AND IT2.Nombre = ''VentasFinal''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Cumplimiento]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cumplimiento]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE        PROCEDURE [dbo].[Cumplimiento]
	@FROM AS VARCHAR(50),
	@TO AS VARCHAR(50),
	@CLIENT AS VARCHAR(8000),
	@TYPE AS VARCHAR(50)
AS 

DECLARE @SQL AS VARCHAR(8000)
DECLARE @TASK AS VARCHAR(25)
IF (@CLIENT <> '''') BEGIN
	SELECT @CLIENT = '''''''' + REPLACE(@CLIENT,'','','''''','''''') + ''''''''
END

IF (@TYPE = ''Larco'') BEGIN
	SELECT @TYPE = ''Interna'', @TASK = ''Calidad''
END
ELSE BEGIN
	SELECT @TYPE = ''Entrega'', @TASK = ''VentasFinal''
END


IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N''tempdb..#tmpCump''))
DROP TABLE #tmpCump

CREATE TABLE [#tmpCump] (
	[ITE_Nombre] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Fecha] [datetime] NULL
) ON [PRIMARY]

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N''tempdb..#tmpCump1''))
DROP TABLE #tmpCump1

CREATE TABLE [#tmpCump1] (
	[Fecha] [datetime] NULL,
	[Liberadas] [int] NULL
) ON [PRIMARY]

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N''tempdb..#tmpCump2''))
DROP TABLE #tmpCump2

CREATE TABLE [#tmpCump2] (
	[Fecha] [datetime] NULL,
	[NoLiberadas] [int] NULL
) ON [PRIMARY]


SET @SQL = ''INSERT INTO #tmpCump '' +
           ''SELECT I.ITE_Nombre,'' + @TYPE + '' '' +
           ''FROM tblItemTasks I INNER JOIN tblTareas T '' +
           ''ON I.TAS_Id = T.[Id] INNER JOIN tblOrdenes O '' +
           ''ON I.ITE_Nombre = O.ITE_Nombre '' +
           ''WHERE T.Nombre = '''''' + @TASK + '''''' AND ITS_Status IS NOT NULL '' +
           ''AND ITS_Status <> 9 AND ITS_DTStop <= CONVERT(VARCHAR(10),'' + @TYPE + '',101) + '''' 23:59:59.99'''' '' + 
	   ''AND '' + @TYPE + '' >= '''''' + @FROM + '''''' AND '' + @TYPE + '' <= '''''' + @TO + '''''' '' +
	   ''AND I.ITE_NOMBRE NOT IN (SELECT ITE_NOMBRE FROM tblScrap) ''
	
IF (@CLIENT <> '''') BEGIN
	SET @SQL = @SQL + '' AND SUBSTRING(I.ITE_Nombre,4,3) IN ('' + @CLIENT + '') ''
END


EXEC(@SQL)


INSERT INTO #tmpCump1 
SELECT Fecha,Count(Fecha) FROM #tmpCump GROUP BY Fecha

-- SELECT * FROM #tmpCump1

SET @SQL = ''INSERT INTO #tmpCump2 '' +
		   ''SELECT '' + @TYPE + '',Count(*)  '' +
		   ''FROM tblOrdenes O  '' +
		   ''WHERE '' + @TYPE + '' >= '''''' + @FROM + '''''' AND '' + @TYPE + '' <= '''''' + @TO + '''''' '' +
		   ''AND O.ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpCump) '' + 
                   ''AND O.ITE_Nombre NOT IN (SELECT ITE_Nombre FROM tblScrap) ''

IF (@CLIENT <> '''') BEGIN
	SET @SQL = @SQL + '' AND SUBSTRING(O.ITE_Nombre,4,3) IN ('' + @CLIENT + '') ''
END

SET @SQL = @SQL + '' GROUP BY '' + @TYPE + '' ''


EXEC(@SQL)

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N''tempdb..#tmpCump3''))
DROP TABLE #tmpCump3

CREATE TABLE [#tmpCump3] (
	[Fecha] [datetime] NULL,
	[Liberadas] [int] NULL,
	[NoLiberadas] [int] NULL
) ON [PRIMARY]

INSERT INTO #tmpCump3
SELECT C.Fecha,Liberadas,NoLiberadas
FROM #tmpCump1 C
INNER JOIN #tmpCump2 N ON C.Fecha = N.Fecha
ORDER BY C.Fecha

INSERT INTO #tmpCump3
SELECT Fecha,Liberadas,0 FROM #tmpCump1 WHERE Fecha NOT IN (SELECT Fecha FROM #tmpCump2)

INSERT INTO #tmpCump3
SELECT Fecha,0,NoLiberadas FROM #tmpCump2 WHERE Fecha NOT IN (SELECT Fecha FROM #tmpCump1)
 
SELECT * FROM #tmpCump3 ORDER BY Fecha


' 
END
GO
/****** Object:  StoredProcedure [dbo].[crosstab_Original]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[crosstab_Original]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE      PROCEDURE [dbo].[crosstab_Original] 
@select varchar(8000),
@sumfunc varchar(100), 
@pivot varchar(100), 
@table varchar(100), 
@where varchar(100)
AS

DECLARE @sql varchar(8000), @delim varchar(1)
SET NOCOUNT ON
SET ANSI_WARNINGS OFF

if exists (select * from tempdb..sysobjects where id = object_id(N''tempdb..##pivot''))
drop table ##pivot

EXEC (''SELECT '' + @pivot + '' AS pivot INTO ##pivot FROM '' + @table + '' WHERE 1=2'')
EXEC (''INSERT INTO ##pivot SELECT DISTINCT '' + @pivot + '' FROM '' + @table + '' WHERE '' 
+ @pivot + '' Is Not Null'' + @where)
print (''INSERT INTO ##pivot SELECT DISTINCT '' + @pivot + '' FROM '' + @table + '' WHERE '' 
+ @pivot + '' Is Not Null'' + @where)
SELECT @sql='''',  @sumfunc=stuff(@sumfunc, len(@sumfunc), 1, '' END)'' )

SELECT @delim=CASE Sign( CharIndex(''char'', data_type)+CharIndex(''date'', data_type) ) 
WHEN 0 THEN '''' ELSE '''''''' END 
FROM tempdb.information_schema.columns 
WHERE table_name=''##pivot'' AND column_name=''pivot''

SELECT @sql=@sql + '''''''' + convert(varchar(100), pivot) + '''''' = CASE WHEN '' + 
stuff(@sumfunc,charindex( ''('', @sumfunc )+1, 0, '' CASE '' + @pivot + '' WHEN '' 
+ @delim + convert(varchar(100), pivot) + @delim + '' THEN '' ) + '' IS NULL THEN 0 ELSE '' +
stuff(@sumfunc,charindex( ''('', @sumfunc )+1, 0, '' CASE '' + @pivot + '' WHEN '' 
+ @delim + convert(varchar(100), pivot) + @delim + '' THEN '' ) + '' END , '' FROM ##pivot

DROP TABLE ##pivot

SELECT @sql=left(@sql, len(@sql)-1)
SELECT @select=stuff(@select, charindex('' FROM '', @select)+1, 0, '', '' + @sql + '' '')
print (@select)
EXEC (@select)
SET ANSI_WARNINGS ON











' 
END
GO
/****** Object:  StoredProcedure [dbo].[EntradasSalidasLarco]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EntradasSalidasLarco]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



--exec EntradasSalidasAlmacen ''Entradas'',''12/11/2007'',''12/11/2007 23:59:59.99'',0,''''


CREATE         PROCEDURE [dbo].[EntradasSalidasLarco]
    @TYPE AS VARCHAR(100),
    @FROM AS VARCHAR(100),
    @TO AS VARCHAR(100),
    @DLLS AS BIT,
    @WHERE AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)

IF (@TYPE = ''Entradas'') BEGIN
	SET @SQL = ''SELECT CONVERT(VARCHAR(10),E.ENT_Fecha,101) AS [FechaEntrada], M.MAT_Numero AS [IDMaterial],
		M.MAT_Fraccion AS [FraccionAran.], ED.ED_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], ED.ED_Costo AS [PrecioUnitario],
		ED.ED_Costo * ED.ED_Cantidad AS [Total], M.MAT_Cantidad AS [SaldoAlmacen],
		P.PROV_Nombre AS [Proveedor], E.ENT_OrdenCompra AS [OrdenCompra],
		E.ENT_Factura AS [Factura], E.ENT_Nacional AS [TipoEntrada],
		E.ENT_TipoImp AS [TipoImp.], PA.PAIS_Nombre AS [PaisOrigen], E.ENT_Pedimento AS [Pedimento]
		FROM tblEntradasDetalle ED
		INNER JOIN tblEntradas E ON ED.ENT_ID = E.ENT_ID
		LEFT OUTER JOIN tblMateriales M ON ED.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblPaises PA ON E.ENT_PaisOrigen = PA.PAIS_ID
		LEFT OUTER JOIN tblProvedores P ON E.PROV_ID = P.PROV_ID
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID ''

	SET @SQL = @SQL + '' WHERE (E.ENT_Fecha >= '''''' + @FROM + '''''' AND E.ENT_Fecha <= '''''' + @TO + '''''') ''
	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE)
END
ELSE IF (@TYPE = ''Salidas'') BEGIN
	SET @SQL = ''SELECT CONVERT(VARCHAR(10),SL.SL_Fecha,101) AS [FechaSalida],
		   P.PT_Fraccion AS [FraccionAranProd.], P.PT_Descripcion AS [DescripcionProd],
		   S.SAL_Orden AS [OrdenTrabajo], M.MAT_Numero AS [IDMaterial],
		   M.MAT_Descripcion AS [DescripcionMat], M.MAT_Fraccion AS [FraccionAranMat.],
		   SD.SD_Cantidad AS [CantidadOrden], U.UNI_Medida AS [UnidadMedida],
		   SD.SL_Cantidad AS [Descargado], (SD.SD_Cantidad - SD.SL_Cantidad) AS [Desperdicio],
		   SD.SL_Pedimento AS [Pedimento] 
		   FROM tblSalidasDetalle SD
		   INNER JOIN tblSalidas S ON SD.SAL_ID = S.SAL_ID
		   INNER JOIN tblSalidasLarco SL ON S.SAL_Orden = SL.SL_Orden
		   LEFT OUTER JOIN tblMateriales M ON SD.MAT_ID = M.MAT_ID
		   LEFT OUTER JOIN tblProductosTerminadosDetalle PD ON PD.MAT_ID = M.MAT_ID
		   LEFT OUTER JOIN tblProductosTerminados P ON P.PT_ID = PD.PT_ID
		   LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID
		   LEFT OUTER JOIN tblUnidadesMedida U ON U.UNI_ID = M.MAT_Unidad ''

	SET @SQL = @SQL + '' WHERE (SL.SL_Fecha >= '''''' + @FROM + '''''' AND SL.SL_Fecha <= '''''' + @TO + '''''') ''
	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE)
END
ELSE BEGIN -- Entradas vs Salidas
	SET @SQL = ''SELECT ED.ED_ID AS [Id], CONVERT(VARCHAR(10),E.ENT_Fecha,101) AS [FechaEntrada], M.MAT_Numero AS [IDMaterial],
		M.MAT_Fraccion AS [FraccionAran.], ED.ED_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], ED.ED_Costo AS [PrecioUnitario],
		ED.ED_Costo * ED.ED_Cantidad AS [Total],
		P.PROV_Nombre AS [Proveedor], E.ENT_OrdenCompra AS [OrdenCompra],
		E.ENT_Factura AS [Factura], E.ENT_Nacional AS [TipoEntrada],
		E.ENT_TipoImp AS [TipoImp.], PA.PAIS_Nombre AS [PaisOrigen],E.ENT_Pedimento AS [Pedimento],
		ES.ED_Cantidad AS [Cant.TomadaDeEntrada], CONVERT(VARCHAR(10),SL.SL_Fecha,101) AS [FechaSalida], S.SAL_Orden AS [OrdenTrabajo],
		SD.SD_Cantidad AS [CantidadOrden], U.UNI_Medida AS [UnidadMedida],
		SD.SL_Cantidad AS [Descargado], (SD.SD_Cantidad - SD.SL_Cantidad) AS [Desperdicio],
		SD.SL_Pedimento AS [Pedimento] 
		FROM tblEntradasDetalle ED
		INNER JOIN tblEntradas E ON ED.ENT_ID = E.ENT_ID
		LEFT OUTER JOIN tblEntradasSalidas ES ON ED.ED_ID = ES.ED_ID
		LEFT OUTER JOIN tblSalidasDetalle SD ON ES.SD_ID = SD.SD_ID AND SL_CANTIDAD IS NOT NULL
		LEFT OUTER JOIN tblSalidas S ON SD.SAL_ID = S.SAL_ID
		LEFT OUTER JOIN tblSalidasLarco SL ON S.SAL_Orden = SL.SL_Orden
		LEFT OUTER JOIN tblMateriales M ON ED.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblProvedores P ON E.PROV_ID = P.PROV_ID
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID
		LEFT OUTER JOIN tblPaises PA ON E.ENT_PaisOrigen = PA.Pais_ID
		LEFT OUTER JOIN tblUnidadesMedida U ON U.UNI_ID = M.MAT_Unidad ''


	SET @SQL = @SQL + '' WHERE (E.ENT_Fecha >= '''''' + @FROM + '''''' AND E.ENT_Fecha <= '''''' + @TO + '''''') ''
	
	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE + '' ORDER BY M.MAT_Numero, ED.ED_ID, E.ENT_Fecha, CONVERT(VARCHAR(10),SL.SL_Fecha,101) DESC'')
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[EntradasSalidasAlmacen]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EntradasSalidasAlmacen]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



--exec EntradasSalidasAlmacen ''Entradas'',''12/11/2007'',''12/11/2007 23:59:59.99'',0,''''


CREATE          PROCEDURE [dbo].[EntradasSalidasAlmacen]
    @TYPE AS VARCHAR(100),
    @FROM AS VARCHAR(100),
    @TO AS VARCHAR(100),
    @DLLS AS BIT,
    @WHERE AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)

IF (@TYPE = ''Entradas'') BEGIN
	SET @SQL = ''SELECT CONVERT(VARCHAR(10),E.ENT_Fecha,101) AS [FechaEntrada], M.MAT_Numero AS [IDMaterial],
		ED.ED_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], ED.ED_Costo AS [PrecioUnitario],
		ED.ED_Costo * ED.ED_Cantidad AS [Total], M.MAT_Cantidad AS [SaldoAlmacen],
		P.PROV_Nombre AS [Proveedor], E.ENT_OrdenCompra AS [OrdenCompra],
		E.ENT_Factura AS [Factura], E.ENT_Nacional AS [TipoEntrada],
		E.ENT_TipoImp AS [TipoImp.], E.ENT_Pedimento AS [Pedimento]
		FROM tblEntradasDetalle ED
		INNER JOIN tblEntradas E ON ED.ENT_ID = E.ENT_ID
		LEFT OUTER JOIN tblMateriales M ON ED.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblProvedores P ON E.PROV_ID = P.PROV_ID
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID ''

	SET @SQL = @SQL + '' WHERE (E.ENT_Fecha >= '''''' + @FROM + '''''' AND E.ENT_Fecha <= '''''' + @TO + '''''') ''

	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE)

END
ELSE IF (@TYPE = ''Salidas'') BEGIN
	SET @SQL = ''SELECT CONVERT(VARCHAR(10),S.SAL_Fecha,101) AS [FechaSalida], M.MAT_Numero AS [IDMaterial],
		SD.SD_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], M.MAT_Cantidad AS [SaldoAlmacen],
		EM.Nombre AS [SolicitadoPor], '''''''' AS [FechaSalidaLarco], '''''''' AS [SaldoLarco]
		FROM tblSalidasDetalle SD
		INNER JOIN tblSalidas S ON SD.SAL_ID = S.SAL_ID
		LEFT OUTER JOIN tblMateriales M ON SD.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblEmpleados EM ON EM.[ID] = S.SAL_Solicitado
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID ''

	SET @SQL = @SQL + '' WHERE (S.SAL_Fecha >= '''''' + @FROM + '''''' AND S.SAL_Fecha <= '''''' + @TO + '''''') ''

	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE)

END
ELSE IF (@TYPE = ''Salidas Costos'') BEGIN
	SET @SQL = ''SELECT CONVERT(VARCHAR(10),S.SAL_Fecha,101) AS [FechaSalida], M.MAT_Numero AS [IDMaterial],
		SD.SD_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], ES.ES_Costo AS [PrecioUnitario],
		ES.ES_Costo * SD.SD_Cantidad AS [Total], M.MAT_Cantidad AS [SaldoAlmacen],
		EM.Nombre AS [SolicitadoPor], E.ENT_OrdenCompra AS [OrdenCompra],
		E.ENT_Factura AS [Factura], '''''''' AS [FechaSalidaLarco], '''''''' AS [SaldoLarco]
		FROM tblSalidasDetalle SD
		INNER JOIN tblSalidas S ON SD.SAL_ID = S.SAL_ID
		INNER JOIN tblEntradasSalidas ES ON SD.SD_ID = ES.SD_ID
		INNER JOIN tblEntradasDetalle ED ON ES.ED_ID = ED.ED_ID
		INNER JOIN tblEntradas E ON ED.ENT_ID = E.ENT_ID
		LEFT OUTER JOIN tblMateriales M ON SD.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblEmpleados EM ON EM.[ID] = S.SAL_Solicitado
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID ''

	SET @SQL = @SQL + '' WHERE (S.SAL_Fecha >= '''''' + @FROM + '''''' AND S.SAL_Fecha <= '''''' + @TO + '''''') ''

	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE)

END
ELSE BEGIN -- Entradas vs Salidas
	SET @SQL = ''SELECT ED.ED_ID AS [Id], CONVERT(VARCHAR(10),E.ENT_Fecha,101) AS [FechaEntrada], M.MAT_Numero AS [IDMaterial],
		ED.ED_Cantidad AS [Cantidad], T.TIP_Descripcion AS [TipoMaterial],
		M.MAT_Descripcion AS [Descripcion], ED.ED_Costo AS [PrecioUnitario],
		ED.ED_Costo * ED.ED_Cantidad AS [Total],
		P.PROV_Nombre AS [Proveedor], E.ENT_OrdenCompra AS [OrdenCompra],
		E.ENT_Factura AS [Factura], E.ENT_Nacional AS [TipoEntrada],
		E.ENT_TipoImp AS [TipoImp.], E.ENT_Pedimento AS [Pedimento],
		CONVERT(VARCHAR(10),S.SAL_Fecha,101) AS [FechaSalida],
		ES.ED_Cantidad AS [CantidadSalida], ES.ES_Costo AS [PrecioUnitarioSalida], 
		ES.ES_Costo * ES.ED_Cantidad AS [TotalSalida], 
		ED.ED_Restante AS [SaldoAlmacen], ED.ED_Restante * ED.ED_Costo AS [SaldoAlmacenDinero]
		FROM tblEntradasDetalle ED
		INNER JOIN tblEntradas E ON ED.ENT_ID = E.ENT_ID
		LEFT OUTER JOIN tblEntradasSalidas ES ON ED.ED_ID = ES.ED_ID
		LEFT OUTER JOIN tblSalidasDetalle SD ON ES.SD_ID = SD.SD_ID
		LEFT OUTER JOIN tblSalidas S ON SD.SAL_ID = S.SAL_ID
		LEFT OUTER JOIN tblMateriales M ON ED.MAT_ID = M.MAT_ID
		LEFT OUTER JOIN tblProvedores P ON E.PROV_ID = P.PROV_ID
		LEFT OUTER JOIN tblTiposMaterial T ON M.MAT_Tipo = T.TIP_ID ''


	SET @SQL = @SQL + '' WHERE (E.ENT_Fecha >= '''''' + @FROM + '''''' AND E.ENT_Fecha <= '''''' + @TO + '''''') ''

	PRINT(@SQL + @WHERE)
	EXECUTE(@SQL + @WHERE + '' ORDER BY M.MAT_Numero, E.ENT_Fecha'')

END







' 
END
GO
/****** Object:  Trigger [TU_tblOrdenes]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TU_tblOrdenes]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TU_tblOrdenes] ON [dbo].[tblOrdenes]
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
		SELECT ''Orden Urgente: <b>'' + @ORDER + ''</b><br/>Estatus Actual: <b>'' + 
		@TASK + ''</b><br/>Fecha de Entrada: <b>'' + @DATE + ''</b><br/>Escaneado por: <b>'' + @SCANBY + ''</b>'',
		IP,SessionId,NULL,GETDATE() FROM Subscribers WHERE UpdatedDate > DATEADD(MINUTE,-10,GETDATE()) 
	END
	
    SET NOCOUNT OFF
END'
GO
/****** Object:  Trigger [TI_tblOrdenes]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblOrdenes]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TI_tblOrdenes] ON [dbo].[tblOrdenes]
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
		SELECT ''Orden Urgente: <b>'' + @ORDER + ''</b><br/>Estatus Actual: <b>'' + 
		@TASK + ''</b><br/>Fecha de Entrada: <b>'' + @DATE + ''</b><br/>Escaneado por: <b>'' + @SCANBY + ''</b>'',
		IP,SessionId,NULL,GETDATE() FROM Subscribers WHERE UpdatedDate > DATEADD(MINUTE,-10,GETDATE()) 
	END
	
    SET NOCOUNT OFF
END'
GO
/****** Object:  StoredProcedure [dbo].[ItemStatus]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemStatus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- ItemStatus ''06-002-002-05'',''Calidad''
-- ItemStatus ''06-044-007-15'',''Almacen''
CREATE    PROCEDURE [dbo].[ItemStatus]
	@ITE_NOMBRE AS VARCHAR(50),
	@TASK AS VARCHAR(50)
AS 

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N''tempdb..#tmpTasks''))
DROP TABLE #tmpTasks

CREATE TABLE [#tmpTasks] (
	[TAS_ID] [int] NULL
) ON [PRIMARY]

DECLARE @NOMBRE AS VARCHAR(50)
DECLARE @STATUS AS INT
DECLARE @RES AS INT
DECLARE @CURRENTTASK AS VARCHAR(50)
DECLARE @PRODUCTO AS VARCHAR(50)
DECLARE @MSG AS VARCHAR(150)

SELECT @NOMBRE = ITE_Nombre,@PRODUCTO = Producto FROM tblOrdenes WHERE ITE_Nombre = @ITE_NOMBRE

IF( @NOMBRE IS NULL) BEGIN
	print(''entro'')
	SELECT @RES = 0,@MSG = ''La Orden no existe en el sistema.'',@CURRENTTASK = '''',@STATUS = 0
	GOTO LBLMSG
END

INSERT INTO #tmpTasks
SELECT ROU_From FROM tblRouting WHERE Nombre = @PRODUCTO

INSERT INTO #tmpTasks
SELECT ROU_To FROM tblRouting WHERE Nombre = @PRODUCTO
AND Rou_To NOT IN ( SELECT TAS_ID FROM #tmpTasks)

SELECT @CURRENTTASK = T2.Nombre 
FROM #tmpTasks T
INNER JOIN tblTareas T2 ON T.TAS_ID = T2.ID
WHERE T2.Nombre = @TASK

IF( @CURRENTTASK IS NULL) BEGIN
	SELECT @CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
	FROM tblItemTasks I
	INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
	WHERE I.ITE_Nombre = @ITE_NOMBRE
	AND I.ITS_Status IS NOT NULL AND I.ITS_DTStop IS NULL

	IF( @CURRENTTASK IS NULL) BEGIN
		SELECT TOP 1 @CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
		FROM tblItemTasks I 
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE ITE_Nombre = @ITE_NOMBRE AND I.ITS_Status IS NOT NULL
		ORDER BY TAS_Order DESC
	END

	SELECT @RES = 0,@MSG = ''La Orden es un '' + @PRODUCTO + '' no le corresponde esta tarea.''
	GOTO LBLMSG
END


SELECT @STATUS = I.ITS_STATUS FROM tblItemTasks I
INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
WHERE I.ITE_Nombre = @ITE_NOMBRE AND T.Nombre = @TASK

IF (@STATUS = 2) BEGIN
	SELECT @CURRENTTASK = NULL

	SELECT @CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
	FROM tblItemTasks I
	INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
	WHERE I.ITE_Nombre = @ITE_NOMBRE
	AND I.ITS_Status IS NOT NULL AND I.ITS_DTStop IS NULL

	IF( @CURRENTTASK IS NULL) BEGIN
		SELECT TOP 1 @CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
		FROM tblItemTasks I 
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE ITE_Nombre = @ITE_NOMBRE AND I.ITS_Status IS NOT NULL
		ORDER BY TAS_Order DESC

		SELECT @RES = 0,@MSG = ''La Orden ya esta completa en esta tarea.''
		GOTO LBLMSG		
	END
	ELSE BEGIN
		SELECT @RES = 0,@MSG = ''La Orden ya esta completa en esta tarea.''
		GOTO LBLMSG
	END
END
ELSE IF ( (@STATUS = 0) OR (@STATUS = 1) ) BEGIN
	SELECT @RES = 1,@MSG = '''',@CURRENTTASK = @TASK
	GOTO LBLMSG
END
ELSE IF ( @STATUS = 9 ) BEGIN
	SELECT TOP 1 @RES = 0,@MSG = ''La orden fue scrapeada el dia '' + CONVERT(VARCHAR(10),SCR_Fecha,101),
	@CURRENTTASK = ''''
        FROM tblScrap WHERE ITE_Nombre = ''06-002-002-05''

	-- SELECT @RES = 0,@MSG = ''La orden fue scrapeada.'',@CURRENTTASK = ''''
	GOTO LBLMSG
END
ELSE BEGIN
	SELECT @CURRENTTASK = NULL

	SELECT @RES = 1,@MSG = '''',@CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
	FROM tblItemTasks I
	INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
	WHERE I.ITE_Nombre = @ITE_NOMBRE
	AND I.ITS_Status IS NOT NULL AND I.ITS_DTStop IS NULL

	IF( @CURRENTTASK IS NULL) BEGIN
		SELECT TOP 1 @CURRENTTASK = T.Nombre,@STATUS = I.ITS_Status
		FROM tblItemTasks I 
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE ITE_Nombre = @ITE_NOMBRE AND I.ITS_Status IS NOT NULL
		ORDER BY TAS_Order DESC

		SELECT @RES = 0,@MSG = ''''
		GOTO LBLMSG		
	END

	GOTO LBLMSG
END


LBLMSG:
	SELECT @RES AS Res,@MSG AS Msg,@CURRENTTASK AS Task,@STATUS AS Status





set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


' 
END
GO
/****** Object:  StoredProcedure [dbo].[ActivarOrden]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActivarOrden]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ActivarOrden ''06-044-007-15'',''Calidad''
-- ItemTasks ''06-044-007-15


CREATE  PROCEDURE [dbo].[ActivarOrden]
	@ITE_NOMBRE AS VARCHAR(50),
	@TASK AS VARCHAR(50),
	@USER AS VARCHAR(50),
	@MACHINE AS VARCHAR(50)
AS 

DECLARE
	@TAS_ID		INT,
	@TAREA		VARCHAR(50),
        @STATUS         VARCHAR(50),
        @START          DATETIME,
	@STOP		DATETIME,
	@ENTRO		BIT

SET @ENTRO = 0

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N''tempdb..#tmpTasks''))
DROP TABLE #tmpTasks

CREATE TABLE [#tmpTasks] (
	[TAS_ID] [int] NULL
) ON [PRIMARY]


DECLARE @PRODUCTO AS VARCHAR(50)
SELECT @PRODUCTO = Producto FROM tblOrdenes WHERE ITE_Nombre = @ITE_NOMBRE

INSERT INTO #tmpTasks
SELECT ROU_From FROM tblRouting WHERE Nombre = @PRODUCTO

INSERT INTO #tmpTasks
SELECT ROU_To FROM tblRouting WHERE Nombre = @PRODUCTO
AND Rou_To NOT IN ( SELECT TAS_ID FROM #tmpTasks)


/**************************************************************************************************/
DECLARE Task_Cursor CURSOR FOR

	SELECT I.TAS_ID,T.Nombre AS Tarea,
	CASE WHEN I.ITS_Status = 0 THEN ''Listo''
	WHEN I.ITS_Status = 1 THEN ''Activo''
	WHEN I.ITS_Status = 2 THEN ''Terminado'' END AS Status,
	ITS_DTStart AS Start,ITS_DTStop AS Stop
	from tblitemtasks I
	INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
	WHERE I.ITE_Nombre = @ITE_NOMBRE
	AND T.[ID] IN (SELECT TAS_ID FROM #tmpTasks)
	ORDER BY TAS_Order

OPEN Task_Cursor
/*GET FIRST RECORD INTO VARIABLE*/
FETCH NEXT FROM Task_Cursor INTO @TAS_ID,@TAREA,@STATUS,@START,@STOP
WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
BEGIN

	IF ( @ENTRO = 0) BEGIN

		IF( @TAREA = @TASK) BEGIN
			UPDATE tblItemTasks SET ITS_Status = 1,ITS_DTStart = GETDATE(),
			USE_LOGIN = @USER,ITS_Machine = @MACHINE
			WHERE TAS_ID = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE
			
			SET @ENTRO = 1
		END
	
		IF( @STATUS = ''Listo'') BEGIN
			UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStart = GETDATE(), 
			ITS_DTStop = GETDATE(),USE_LOGIN = @USER,ITS_Machine = @MACHINE
			WHERE TAS_ID = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE
		END
	
		IF( @STATUS = ''Activo'') AND (@ENTRO = 0) BEGIN
			print (''entro activo'')
			UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStop = GETDATE(),
			USE_LOGIN = @USER,ITS_Machine = @MACHINE
			WHERE TAS_ID = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE
			
		END
	
		IF( @STATUS IS NULL ) AND (@ENTRO = 0) BEGIN
			UPDATE tblItemTasks SET ITS_Status = 2, ITS_DTStart = GETDATE(), 
			ITS_DTStop = GETDATE(),USE_LOGIN = @USER,ITS_Machine = @MACHINE
			WHERE TAS_ID = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE
		END
	END

   FETCH NEXT FROM Task_Cursor INTO @TAS_ID,@TAREA,@STATUS,@START,@STOP
 END
/*CLOSE CURSOR*/
CLOSE Task_Cursor
DEALLOCATE Task_Cursor

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


' 
END
GO
/****** Object:  Trigger [TD_tblOrdenes]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblOrdenes]'))
EXEC dbo.sp_executesql @statement = N'
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

'
GO
/****** Object:  Trigger [ReprogramarOrden]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ReprogramarOrden]'))
EXEC dbo.sp_executesql @statement = N'CREATE  TRIGGER [dbo].[ReprogramarOrden]
ON [dbo].[tblScrap]
FOR INSERT
NOT FOR REPLICATION
AS
BEGIN
	
        DECLARE 
		@ITE_NOMBRE		VARCHAR(50),
		@SCR_PARCIAL		BIT,
		@SCR_REPRO		INT,
		@NEW_ITE_NOMBRE		VARCHAR(50),
		@NEW			CHAR(1),
		@ITE_ID	  	        INT,
		@TAS_ID		   	INT,
		@TAS_ID2  		INT,
		@PRO_NOMBRE		VARCHAR(50),
		@SCR_DETECTADO	VARCHAR(50),
		@TAS_ORDER		   	INT

	SET NOCOUNT ON


	SELECT @ITE_NOMBRE = ITE_Nombre,@SCR_PARCIAL = SCR_Parcial,@SCR_REPRO = SCR_Repro, @SCR_DETECTADO = SCR_Detectado FROM INSERTED
	SELECT @PRO_NOMBRE = PRO_Nombre FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE
 
	SELECT @NEW = SUBSTRING(@ITE_NOMBRE,4,1)
	IF (@NEW = ''0'') 
		SET @NEW = ''9''
	ELSE
		SELECT @NEW = CAST( CAST(@NEW AS INT) - 1 AS CHAR(1) )

	SELECT @NEW_ITE_NOMBRE = SUBSTRING(@ITE_NOMBRE,1,3) + @NEW + SUBSTRING(@ITE_NOMBRE,5,9)

	UPDATE tblScrap SET SCR_NewItem = @NEW_ITE_NOMBRE WHERE ITE_Nombre = @ITE_NOMBRE 

	--INSERT INTO tblItems
	INSERT INTO tblItems(ITE_Nombre,PRO_Nombre,ITE_Fecha,ITE_Priority)
	SELECT @NEW_ITE_NOMBRE,PRO_NOMBRE,GETDATE(),0 FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE

	--GET ITE_ID FROM THE NEW ITEM
	SELECT @ITE_ID = ITE_ID FROM tblItems WHERE ITE_Nombre = @NEW_ITE_NOMBRE

	--INSERT INTO tblItemTasks
	INSERT INTO tblItemTasks(ITE_ID,TAS_ID,ITE_Nombre)
	SELECT @ITE_ID,[ID],@NEW_ITE_NOMBRE FROM TBLTAREAS

	--UPDATE ITEM STATUS
	SELECT @TAS_ID = [Id] FROM tblTareas WHERE Nombre = ''Ventas''

	UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStart = GETDATE(), ITS_DTStop = GETDATE()
        WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @NEW_ITE_NOMBRE

	SELECT @TAS_ID2 = Rou_To FROM tblRouting WHERE Nombre = @PRO_NOMBRE AND Rou_From = @TAS_ID

	UPDATE tblItemTasks SET ITS_Status = 0,ITS_DTStart = GETDATE()
        WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID2 AND ITE_Nombre = @NEW_ITE_NOMBRE


	--INSERT INTO tblOrdenes
	IF (@SCR_PARCIAL = 0) BEGIN -- si es total
		INSERT INTO tblOrdenes(ITE_ID,ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
		OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,Otras,Unitario,Total,
		Dolares,Urgente)
		SELECT @ITE_ID,@NEW_ITE_NOMBRE,TipoProceso,Requerida,Ordenada,Producto,Numero,
		Terminal,OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,
		Otras,Unitario,Total,Dolares,Urgente
		FROM tblOrdenes WHERE ITE_Nombre = @ITE_NOMBRE  

	    -- ACTUALIAR ES STATUS DE LA ORDEN RECIEN SCRAPEADA
	    UPDATE tblItemTasks SET ITS_Status = 9 WHERE ITE_Nombre = @ITE_NOMBRE AND ITS_Status IS NOT NULL

	END
	ELSE BEGIN -- si es parcial	
		INSERT INTO tblOrdenes(ITE_ID,ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
		OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,Otras,Unitario,Total,
		Dolares,Urgente)
		SELECT @ITE_ID,@NEW_ITE_NOMBRE,TipoProceso,@SCR_REPRO,@SCR_REPRO,Producto,Numero,
		Terminal,OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,
		Otras,Unitario,Total,Dolares,Urgente
		FROM tblOrdenes WHERE ITE_Nombre = @ITE_NOMBRE  

		-- Update Cantidad Larco = Cantidad Larco - Reprogramada
		UPDATE tblOrdenes SET Ordenada = (Ordenada - @SCR_REPRO) WHERE ITE_Nombre = @ITE_NOMBRE
		
	    SELECT @TAS_ID = [Id], @TAS_ORDER = TAS_Order FROM tblTareas WHERE Nombre = @SCR_DETECTADO

		UPDATE tblItemTasks 
		SET ITS_Status = NULL, ITS_DTStart = NULL, ITS_DTStop = NULL, 
		USE_Login = NULL, ITS_Machine = NULL
		WHERE ITE_Nombre = @ITE_NOMBRE 
		AND TAS_ID IN (SELECT ID FROM tblTareas WHERE TAS_Order > @TAS_ORDER)

		UPDATE tblItemTasks SET ITS_Status = 1, ITS_DTStart = GETDATE(), ITS_DTStop = NULL
		WHERE ITE_Nombre = @ITE_NOMBRE AND TAS_ID = @TAS_ID        
		
	END
	
	
END
'
GO
/****** Object:  StoredProcedure [dbo].[Insert_Orden]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Insert_Orden]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE       PROCEDURE [dbo].[Insert_Orden]
(
	@ITE_NOMBRE	VARCHAR(50),
	@PROCESO        VARCHAR(50),
	@REQUERIDA	INT,
	@ORDENADA	INT,
	@PRO_NOMBRE	VARCHAR(50),	
	@NUMERO		VARCHAR(50),
	@TERMINAL	VARCHAR(50),
	@ENTREGA	DATETIME,
	@RECIBIDO	DATETIME,
	@INTERNA	DATETIME,
	@NOMBRE		VARCHAR(150),
	@APROBACION	BIT,
	@OBSERVACIONES  VARCHAR(1000),
	@OTRAS		VARCHAR(500),
	@UNITARIO	DECIMAL(18,2),
	@TOTAL		DECIMAL(18,2),
	@TAREA		VARCHAR(50),
	@USE_LOGIN	VARCHAR(50),
	@ITS_MACHINE	VARCHAR(50),
	@ORDENCOMPRA	VARCHAR(50),
	@DOLARES	BIT,
	@STOCK		BIT,
	@PLANO      INT,
	@STOCKPARCIAL   BIT,
	@STOCKPARCIALCANTIDAD INT,
	@MEZCLADO   BIT,
	@INSERTSTOCK BIT,
	@REQUISICION VARCHAR(50),
	@URGENTE BIT
)
AS
DECLARE 
	@RES 	  	INT,
	@TAS_ID   	INT,
	@TAS_ID2  	INT,
	@ITE_ID	  	INT,
	@ISPUTONLY  	BIT,
	@ISLAST  	BIT,
	@ERROR		VARCHAR(200),
	@ITEMEXISTS     VARCHAR(50),
	@ST_ID      INT

IF (@INSERTSTOCK = 0) BEGIN

	SELECT @TAS_ID = [Id], @ISPUTONLY = IsPutOnly,@ISLAST = IsLast FROM tblTareas WHERE Nombre = @TAREA
	IF (@@ERROR <> 0 OR @TAS_ID IS NULL OR @ISPUTONLY = 0) BEGIN		
		SELECT @ERROR = ''La Tarea '' + @TAREA + '' no existe.''
		GOTO LBLERROR
	END

	SELECT @ITEMEXISTS = ITE_Nombre FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE
	IF (@ITEMEXISTS IS NOT NULL) BEGIN		
		SELECT @ERROR = ''Ya existe una orden con el nombre: '' + @ITE_NOMBRE + ''.''
		GOTO LBLERROR
	END
	SET @ITEMEXISTS = NULL

	SELECT @ITEMEXISTS = ITE_Nombre FROM tblStockOrdenes WHERE ITE_Nombre = @ITE_NOMBRE
	IF (@ITEMEXISTS IS NOT NULL) BEGIN		
		SELECT @ERROR = ''Ya existe una orden con el nombre: '' + @ITE_NOMBRE + ''.''
		GOTO LBLERROR
	END
	

	IF( @ISPUTONLY = 1 ) BEGIN
		--INSERT ITEM INTO tblitems
		INSERT INTO tblItems(ITE_Nombre,PRO_Nombre,ITE_Fecha,ITE_Priority)
		SELECT @ITE_NOMBRE,@PRO_NOMBRE,GETDATE(),0

		--GET ITE_ID FROM THE NEW ITEM
		SELECT @ITE_ID = ITE_ID FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE

		--INSERT INTO tblItemTasks
		INSERT INTO tblItemTasks(ITE_ID,TAS_ID,ITE_Nombre)
		SELECT @ITE_ID,[ID],@ITE_NOMBRE FROM TBLTAREAS
					
		--UPDATE ITEM STATUS
		--select * from mcpItemTasks
		IF (@PLANO IS NOT NULL) BEGIN
		    -- if plano is not null order will be completed in ventas and move to the next task as ready
			UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStart = GETDATE(), ITS_DTStop = GETDATE(), USE_Login = @USE_LOGIN
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE

			SELECT @TAS_ID2 = Rou_To FROM tblRouting WHERE Nombre = @PRO_NOMBRE AND Rou_From = @TAS_ID

			UPDATE tblItemTasks SET ITS_Status = 0,ITS_DTStart = GETDATE()
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID2 AND ITE_Nombre = @ITE_NOMBRE				
		END
		ELSE BEGIN
		    -- if plano is null order will remain in ventas as Active
			UPDATE tblItemTasks SET ITS_Status = 1,ITS_DTStart = GETDATE(), ITS_DTStop = NULL, USE_Login = @USE_LOGIN
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE		
		END

		--INSERT INTO tblOrdenes
		INSERT INTO tblOrdenes(ITE_ID,ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
		OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,Otras,Unitario,
		Total,Dolares,PN_Id,Update_Date,Update_User,StockParcial,StockParcialCantidad,Requisicion,Urgente)
		SELECT @ITE_ID,@ITE_NOMBRE,@PROCESO,@REQUERIDA,@ORDENADA,@PRO_NOMBRE,@NUMERO,@TERMINAL,
	        @ORDENCOMPRA,@RECIBIDO,@ENTREGA,@INTERNA,@NOMBRE,@APROBACION,@OBSERVACIONES,@OTRAS,@UNITARIO,
	        @TOTAL,@DOLARES,@PLANO,GETDATE(),@USE_LOGIN,@STOCKPARCIAL,@STOCKPARCIALCANTIDAD,@REQUISICION,@URGENTE
	        
        IF @STOCKPARCIAL = 1 BEGIN
			-- RECORD Salida IN STOCK
			INSERT INTO tblStock(PN_Id,ITE_Nombre,ST_Cantidad,ST_Fecha,ST_Tipo,Update_Date,Update_User)
			VALUES (@PLANO,@ITE_NOMBRE,@STOCKPARCIALCANTIDAD,CONVERT (date, GETDATE()),''Salida'',GETDATE(),@USE_LOGIN) 
		    
			SELECT @ST_ID = @@IDENTITY
		    
			-- UPDATE tblOrdenes RECORD WITH THE STOCK ID RECORD
			IF (@ITE_ID IS NOT NULL AND @ST_ID IS NOT NULL) BEGIN
			  UPDATE tblOrdenes SET ST_Id = @ST_ID WHERE ITE_ID = @ITE_ID
			END
        
        END         	        
	END


	SELECT 0 AS ERROR,'''' AS MSG
END
ELSE BEGIN
	SET @ITEMEXISTS = NULL

	SELECT @ITEMEXISTS = ITE_Nombre FROM tblStockOrdenes WHERE ITE_Nombre = @ITE_NOMBRE
	IF (@ITEMEXISTS IS NOT NULL) BEGIN		
		SELECT @ERROR = ''Ya existe una orden con el nombre: '' + @ITE_NOMBRE + ''.''
		GOTO LBLERROR
	END

	INSERT INTO tblStockOrdenes(ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
	OrdenCompra,Recibido,Entrega,Interna,Nombre,Aprobacion,Observaciones,Otras,Unitario,Total,
	Dolares,Stock,Programado,Cantidad,FileName,AddBy, AddDate,PN_Id,Update_Date,Update_User,Mezclado,Requisicion,Urgente)
	SELECT @ITE_NOMBRE,@PROCESO,@REQUERIDA,@ORDENADA,@PRO_NOMBRE,@NUMERO,@TERMINAL,
        @ORDENCOMPRA,@RECIBIDO,@ENTREGA,@INTERNA,@NOMBRE,@APROBACION,@OBSERVACIONES,@OTRAS,@UNITARIO,@TOTAL,
	@DOLARES,@STOCK,0,NULL,''Ventas'',''Ventas'',GETDATE(),@PLANO,GETDATE(),@USE_LOGIN,@MEZCLADO,@REQUISICION,@URGENTE
    
    -- GET ID OF THE INSERTED RECORD
    SELECT @ITE_ID = @@IDENTITY
    
    IF @MEZCLADO = 0 BEGIN
		-- RECORD Salida IN STOCK
		INSERT INTO tblStock(PN_Id,ITE_Nombre,ST_Cantidad,ST_Fecha,ST_Tipo,Update_Date,Update_User)
		VALUES (@PLANO,@ITE_NOMBRE,@REQUERIDA,CONVERT (date, GETDATE()),''Salida'',GETDATE(),@USE_LOGIN) 
	    
		SELECT @ST_ID = @@IDENTITY
	    
		-- UPDATE tblStockOrdenes RECORD WITH THE STOCK ID RECORD
		IF (@ITE_ID IS NOT NULL AND @ST_ID IS NOT NULL) BEGIN
		  UPDATE tblStockOrdenes SET ST_Id = @ST_ID WHERE ITE_ID = @ITE_ID
		END
	END
	    
	SELECT 0 AS ERROR,'''' AS MSG
END

LBLERROR:
	SELECT -1 AS ERROR,@ERROR AS MSG
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ChangeStatus]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeStatus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- ChangeStatus ''06-001-001-07'',''Calidad'',3,''14'',''Localhost''
-- SELECT * FROM TBLtareas
-- Insert_Orden ''001-001-00'',''test'',10,10,''Anvil AMP'',''12345'',''123435'',''03/20/2006'',''03/18/2006'',''Christian Beltran'',1,''just a test'',''test again'',12.0,200,''Ventas'',''System'',''''
CREATE     PROCEDURE [dbo].[ChangeStatus]
(
	@ITE_NOMBRE 		VARCHAR(50),-- ORDEN
	@TAS_NOMBRE 		VARCHAR(50),-- TAREA
	@ITS_STATUS		INT,        -- STATUS ACTUAL
	@USE_LOGIN		VARCHAR(50),-- EMPLEADO
	@ITS_MACHINE		VARCHAR(50) -- MAQUINA
)
AS

DECLARE
	@TAS_ID   	INT,
	@TAS_ID2  	INT,
	@ITE_ID         INT,
	@PRO_NOMBRE     VARCHAR(50)

        --SELECT * FROM tblItemTasks
	-- SELECT * FROM tblitems
	IF (@ITS_STATUS = 0) BEGIN
		UPDATE tblItemTasks SET ITS_Status = 1, USE_Login = @USE_LOGIN, 
		ITS_Machine = @ITS_MACHINE, ITS_DTStart = GETDATE()
		FROM tblItemTasks I
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE T.Nombre = @TAS_NOMBRE AND I.ITE_Nombre = @ITE_NOMBRE 
	END
	ELSE IF ( (@ITS_STATUS = 1) OR (@ITS_STATUS = 3) ) BEGIN
		print(''entro'')
		UPDATE tblItemTasks SET ITS_Status = 2, USE_Login = @USE_LOGIN, 
		ITS_Machine = @ITS_MACHINE, ITS_DTStop = GETDATE()
		FROM tblItemTasks I
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE T.Nombre = @TAS_NOMBRE AND I.ITE_Nombre = @ITE_NOMBRE 

		SELECT @TAS_ID = [ID] FROM tblTareas WHERE Nombre = @TAS_NOMBRE		
		SELECT @PRO_NOMBRE = PRO_Nombre, @ITE_ID = ITE_Id FROM tblItems WHERE ITE_NOMBRE = @ITE_NOMBRE
		
		SELECT @TAS_ID2 = Rou_To FROM tblRouting WHERE Nombre = @PRO_NOMBRE AND Rou_From = @TAS_ID
		DECLARE @TAS_NOMBRE2 AS VARCHAR(50)

		SELECT @TAS_NOMBRE2 = Nombre FROM tblTareas WHERE Id = @TAS_ID2
	
                DECLARE @NEWTASK_STATUS AS INT
		SELECT @NEWTASK_STATUS = 0
		
		IF ( @TAS_NOMBRE2 = ''Corte'') BEGIN
			SELECT @NEWTASK_STATUS = 1
		END

		UPDATE tblItemTasks SET ITS_Status = @NEWTASK_STATUS,ITS_DTStart = GETDATE()
	        WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID2 AND ITE_Nombre = @ITE_NOMBRE
		
		IF (@ITS_STATUS = 3)
		BEGIN
 			UPDATE tblRetrabajo SET RET_Stop = GETDATE() WHERE ITE_Nombre = @ITE_NOMBRE
		END
	END
	ELSE BEGIN
		UPDATE tblItemTasks SET ITS_Status = 3, USE_Login = @USE_LOGIN, 
		ITS_Machine = @ITS_MACHINE, ITS_DTStart = GETDATE()
		FROM tblItemTasks I
		INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
		WHERE T.Nombre = @TAS_NOMBRE AND I.ITE_Nombre = @ITE_NOMBRE 
	END



	IF (@@ERROR <> 0)
		SELECT 1 AS ERROR,''Ocurrio un error mientras se cambiaba la orden de status.'' AS MSG
	ELSE 	
		SELECT 0 AS ERROR,@TAS_NOMBRE2   AS MSG





set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON



' 
END
GO
/****** Object:  Table [dbo].[tblInventariosConf]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblInventariosConf]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblInventariosConf](
	[CONF_Inventarios] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGrupos]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblGrupos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblGrupos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNonWorkingDay]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblNonWorkingDay]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblNonWorkingDay](
	[NonWorkingDay] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblMonitor]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMonitor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblMonitor](
	[MType] [varchar](50) NULL,
	[MName] [varchar](50) NULL,
	[MValue] [varchar](4096) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMergeOrdenes]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMergeOrdenes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblMergeOrdenes](
	[MO_ID] [int] IDENTITY(1,1) NOT NULL,
	[ITE_Nombre] [varchar](50) NOT NULL,
	[MO_ITE_Nombre] [varchar](50) NOT NULL,
	[MO_Cantidad] [int] NOT NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Update_Orden]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Update_Orden]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Update_Orden 10809,''07-036-009-06'',''212'',10,10,''Anvil'',''11212'',''1212'',''5/4/2007'',''10/10/2007'',''5/3/2007'',''Edgar Lara A'',0,''121211112'',''Anvil'',12,120,''Ventas'',''System'',''192.168.1.70'',''12345'',0
CREATE         PROCEDURE [dbo].[Update_Orden]
(
	@ITE_ID		INT,
	@ITE_NOMBRE	VARCHAR(50),
	@PROCESO        VARCHAR(50),
	@REQUERIDA	INT,
	@ORDENADA	INT,
	@PRO_NOMBRE	VARCHAR(50),	
	@NUMERO		VARCHAR(50),
	@TERMINAL	VARCHAR(50),
	@ENTREGA	DATETIME,
	@RECIBIDO	DATETIME,
	@INTERNA	DATETIME,
	@NOMBRE		VARCHAR(150),
	@APROBACION	BIT,
	@OBSERVACIONES  VARCHAR(1000),
	@OTRAS		VARCHAR(500),
	@UNITARIO	DECIMAL(18,2),
	@TOTAL		DECIMAL(18,2),
	@TAREA		VARCHAR(50),
	@USE_LOGIN	VARCHAR(50),
	@ITS_MACHINE	VARCHAR(50),
	@ORDENCOMPRA	VARCHAR(50),
	@DOLARES	BIT,
	@CAMBIO		BIT,
	@STOCK		BIT,
	@PLANO		INT,
	@STOCKPARCIAL   BIT,
	@STOCKPARCIALCANTIDAD INT,
	@MEZCLADO   BIT,
	@REQUISICION VARCHAR(50),
	@URGENTE BIT		
)
AS
DECLARE
	@RES 	  	INT,
	@ERROR		VARCHAR(200),
	@ITEMEXISTS VARCHAR(50),
    @OLD_PLANO  INT ,
	@TAS_ID   	INT,
	@TAS_ID2  	INT,
    @ST_ID      INT,
    @OLDREQUERIDA INT,
    @CURRENTTASK VARCHAR(50),
    @CURRENTSTATUS     VARCHAR(50)  

	IF @STOCK = 1 OR @MEZCLADO = 1 BEGIN		
		DECLARE @ITE_NOMBRE_OLD AS VARCHAR(50)
        SET @ITE_NOMBRE_OLD = NULL
		
		SELECT @ITE_NOMBRE_OLD = ITE_Nombre FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID
		IF @ITE_NOMBRE_OLD IS NULL BEGIN
		    PRINT(''DELETE FROM ALL TABLES BECAUSE USE TO BE A PRODUCTION ORDER SO INSERT THE NEW ONE AS STOCK'')
		     -- DELETE FROM ALL TABLES BECAUSE IT WAS IN tblOrdenes	    		
			DELETE FROM tblItems WHERE ITE_ID = @ITE_ID
			DELETE FROM tblItemTasks WHERE ITE_ID = @ITE_ID
			DELETE FROM tblOrdenes WHERE ITE_ID = @ITE_ID	  
			DELETE FROM tblScrap WHERE ITE_Nombre = @ITE_NOMBRE_OLD		
 			DELETE FROM tblStock WHERE ST_Id = @ST_ID

			-- USE TO BE A PRODUCTION ORDER SO INSERT THE NEW ONE AS STOCK 
			EXEC Insert_Orden @ITE_NOMBRE,@PROCESO,@REQUERIDA,@ORDENADA,@PRO_NOMBRE,@NUMERO,
					  @TERMINAL,@ENTREGA,@RECIBIDO,@INTERNA,@NOMBRE,@APROBACION,@OBSERVACIONES,
					  @OTRAS,@UNITARIO,@TOTAL,@TAREA,@USE_LOGIN,@ITS_MACHINE,@ORDENCOMPRA,@DOLARES,@STOCK,
					  @PLANO,@STOCKPARCIAL,@STOCKPARCIALCANTIDAD,@MEZCLADO,1, @REQUISICION, @URGENTE		

		END
		ELSE BEGIN	
		    PRINT(''EXISTING ORDER IN tblStockOrdenes UPDATE DATA'')		
			SET @ITEMEXISTS = NULL

			PRINT(''@ITE_NOMBRE = '' + @ITE_NOMBRE + '' @ITE_ID = '')
			PRINT(@ITE_ID)
			SELECT @ITEMEXISTS = ITE_Nombre FROM tblStockOrdenes WHERE ITE_Nombre = @ITE_NOMBRE AND ITE_ID <> @ITE_ID
		
			IF (@ITEMEXISTS IS NOT NULL) BEGIN		
				SELECT @ERROR = ''Ya existe una orden con el nombre: '' + @ITE_NOMBRE + ''.''
				GOTO LBLERROR
			END
			
			SELECT @ST_ID = ST_Id FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID	    
			
			--UPDATE INTO tblStockOrdenes
			UPDATE tblStockOrdenes SET ITE_Nombre = @ITE_NOMBRE,
			TipoProceso = @PROCESO, Requerida = @REQUERIDA, Ordenada = @ORDENADA,
			Producto = @PRO_NOMBRE, Numero = @NUMERO, Terminal = @TERMINAL,
			OrdenCompra = @ORDENCOMPRA, Recibido = @RECIBIDO, Entrega = @ENTREGA, Interna = @INTERNA, 
			Nombre = @NOMBRE, Aprobacion = @APROBACION, Observaciones = @OBSERVACIONES,
			Otras =  @OTRAS, Unitario = @UNITARIO, Total = @TOTAL, 
			Dolares = @DOLARES, Stock = @STOCK, PN_Id = @PLANO, Update_Date = GETDATE(), 
			Update_User = @USE_LOGIN, Mezclado = @MEZCLADO, Requisicion = @REQUISICION,
			Urgente = @URGENTE
			WHERE ITE_ID = @ITE_ID
			
		    UPDATE tblStock SET PN_Id = @PLANO, ITE_Nombre = @ITE_NOMBRE, 
		    ST_Cantidad = @REQUERIDA, Update_Date = GETDATE(),Update_User = @USE_LOGIN
		    WHERE ST_ID = @ST_ID		    
		   			
   			DELETE FROM tblMergeOrdenes WHERE ITE_Nombre = @ITE_NOMBRE_OLD		
		END	
	END
	ELSE BEGIN
		SELECT @ITEMEXISTS = ITE_Nombre FROM tblItems WHERE ITE_ID = @ITE_ID
		IF (@ITEMEXISTS IS NOT NULL) BEGIN --ALREADY EXISTS JUST NEED TO UPDATE THE RECORDS
			SET @ITEMEXISTS = NULL
					
			SELECT @ITEMEXISTS = ITE_Nombre FROM tblItems WHERE ITE_Nombre = @ITE_NOMBRE AND ITE_ID <> @ITE_ID
			IF (@ITEMEXISTS IS NOT NULL) BEGIN		
				SELECT @ERROR = ''Ya existe una orden con el nombre: '' + @ITE_NOMBRE + ''.''
				GOTO LBLERROR
			END
				
			UPDATE tblItems SET ITE_Nombre = @ITE_NOMBRE, PRO_NOMBRE = @PRO_NOMBRE WHERE ITE_ID = @ITE_ID
			UPDATE tblItemTasks SET ITE_Nombre = @ITE_NOMBRE WHERE ITE_ID = @ITE_ID
			
			SELECT @OLD_PLANO = PN_ID, @ST_ID = ST_Id 
			FROM tblOrdenes WHERE ITE_ID = @ITE_ID
						
			--UPDATE INTO tblOrdenes
			UPDATE tblOrdenes SET ITE_Nombre = @ITE_NOMBRE,
			TipoProceso = @PROCESO, Requerida = @REQUERIDA, Ordenada = @ORDENADA,
			Producto = @PRO_NOMBRE, Numero = @NUMERO, Terminal = @TERMINAL,
			Recibido = @RECIBIDO, Entrega = @ENTREGA, Interna = @INTERNA, 
			Nombre = @NOMBRE, Aprobacion = @APROBACION, Observaciones = @OBSERVACIONES,
			Otras =  @OTRAS, Unitario = @UNITARIO, Total = @TOTAL, 
			OrdenCompra = @ORDENCOMPRA, Dolares = @DOLARES, PN_Id = @PLANO, Update_Date = GETDATE(), 
			Update_User = @USE_LOGIN, StockParcial = @STOCKPARCIAL, 
			StockParcialCantidad = @STOCKPARCIALCANTIDAD, Requisicion = @REQUISICION,
			Urgente = @URGENTE
			WHERE ITE_ID = @ITE_ID
		    
			-- BORRAR EL REGISTRO DEL STOCK SI ES QUE TENIA
   		    DELETE FROM tblStock WHERE ST_Id = @ST_ID
		    	    
			-- SI TIENE STOCK PARCIAL
			IF (@STOCKPARCIAL = 1) BEGIN	
				INSERT INTO tblStock(PN_Id,ITE_Nombre,ST_Cantidad,ST_Fecha,ST_Tipo,Update_Date,Update_User)
				VALUES (@PLANO,@ITE_NOMBRE,@STOCKPARCIALCANTIDAD,CONVERT (date, GETDATE()),''Salida'',GETDATE(),@USE_LOGIN) 
			    
				SELECT @ST_ID = @@IDENTITY
			    
				-- UPDATE tblOrdenes RECORD WITH THE STOCK ID RECORD
				IF (@ITE_ID IS NOT NULL AND @ST_ID IS NOT NULL) BEGIN
				  UPDATE tblOrdenes SET ST_Id = @ST_ID WHERE ITE_ID = @ITE_ID
				END	        
			END

			SELECT TOP 1 @CURRENTTASK = T.Nombre, @CURRENTSTATUS = (CASE WHEN I.ITS_Status = 0 THEN ''Listo''
			WHEN I.ITS_Status = 1 THEN ''Activo''
			WHEN I.ITS_Status = 2 THEN ''Terminado''
			WHEN I.ITS_Status = 9 THEN ''Scrap'' END)
			FROM tblitemtasks I
			INNER JOIN tbltareas T on I.TAS_ID = T.ID
			WHERE ITE_ID = @ITE_ID AND ITS_Status IS NOT NULL

			PRINT(''@CURRENTTASK = ['' + @CURRENTTASK + ''] @CURRENTSTATUS = ['' + @CURRENTSTATUS + '']'')
		     
			IF (@OLD_PLANO IS NULL AND @PLANO IS NOT NULL  AND (''VentasFinal'' <> @CURRENTTASK AND ''Terminado'' <> @CURRENTSTATUS)) BEGIN	
				print(''MOVE ORDER TO NEXT TASK AS READY'')
				--MOVE ORDER TO NEXT TASK AS READY    
				SELECT @TAS_ID = [Id] FROM tblTareas WHERE Nombre = @TAREA
		      
				UPDATE tblItemTasks SET ITS_Status = 2,ITS_DTStart = GETDATE(), ITS_DTStop = GETDATE(), USE_Login = @USE_LOGIN
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE

				SELECT @TAS_ID2 = Rou_To FROM tblRouting WHERE Nombre = @PRO_NOMBRE AND Rou_From = @TAS_ID

				UPDATE tblItemTasks SET ITS_Status = 0,ITS_DTStart = GETDATE()
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID2 AND ITE_Nombre = @ITE_NOMBRE					      	      
			END
			ELSE IF (@OLD_PLANO IS NOT NULL AND @PLANO IS NULL) BEGIN
				print(''MOVE ORDER TO VENTAS AS ACTIVE'')
				--MOVE ORDER TO VENTAS AS ACTIVE 
   				SELECT @TAS_ID = [Id] FROM tblTareas WHERE Nombre = @TAREA

				UPDATE tblItemTasks SET ITS_Status = NULL,ITS_DTStart = NULL, ITS_DTStop = NULL, USE_Login = NULL
				WHERE ITE_Id = @ITE_ID AND ITE_Nombre = @ITE_NOMBRE
					
				UPDATE tblItemTasks SET ITS_Status = 1,ITS_DTStart = GETDATE(), ITS_DTStop = NULL, USE_Login = @USE_LOGIN
				WHERE ITE_Id = @ITE_ID AND TAS_Id = @TAS_ID AND ITE_Nombre = @ITE_NOMBRE			
			END
		END	
		ELSE BEGIN -- DOES NOT EXISTS, SO USE TO BE A STOCK ORDER
		    SELECT @ITE_NOMBRE_OLD = ITE_Nombre, @ST_ID = ST_Id FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID
			DELETE FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID		
   			DELETE FROM tblStock WHERE ST_Id = @ST_ID
   			DELETE FROM tblMergeOrdenes WHERE ITE_Nombre = @ITE_NOMBRE_OLD

			EXEC Insert_Orden @ITE_NOMBRE,@PROCESO,@REQUERIDA,@ORDENADA,@PRO_NOMBRE,@NUMERO,
					  @TERMINAL,@ENTREGA,@RECIBIDO,@INTERNA,@NOMBRE,@APROBACION,@OBSERVACIONES,
					  @OTRAS,@UNITARIO,@TOTAL,@TAREA,@USE_LOGIN,@ITS_MACHINE,@ORDENCOMPRA,@DOLARES,@STOCK,
					  @PLANO,@STOCKPARCIAL,@STOCKPARCIALCANTIDAD,@MEZCLADO,0, @REQUISICION, @URGENTE		
		END
	END

	SELECT 0 AS ERROR,'''' AS MSG
LBLERROR:
	SELECT -1 AS ERROR,@ERROR AS MSG
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Orden]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Delete_Orden]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- SELECT * FROM tblStockOrdenes where ITE_ID = 4534
-- Insert_Orden ''001-001-00'',''test'',10,10,''Anvil AMP'',''12345'',''123435'',''03/20/2006'',''03/18/2006'',''Christian Beltran'',1,''just a test'',''test again'',12.0,200,''Ventas'',''System'',''''
CREATE    PROCEDURE [dbo].[Delete_Orden]
(
	@ITE_ID		INT,
	@STOCK		BIT
)
AS
DECLARE @ST_ID      INT,
        @ITE_NOMBRE VARCHAR(50)

IF (@STOCK = 0) BEGIN
	
    		
	SELECT @ITE_NOMBRE = ITE_Nombre, @ST_ID = ST_Id FROM tblOrdenes WHERE ITE_ID = @ITE_ID

	--INSERT ITEM INTO tblitems
	DELETE FROM tblItems WHERE ITE_ID = @ITE_ID

	DELETE FROM tblItemTasks WHERE ITE_ID = @ITE_ID
				
	--INSERT INTO tblOrdenes
	DELETE FROM tblOrdenes WHERE ITE_ID = @ITE_ID
  
	DELETE FROM tblScrap WHERE ITE_Nombre = @ITE_NOMBRE

	IF (@ST_ID IS NOT NULL) BEGIN
	  DELETE FROM tblStock WHERE ST_Id = @ST_ID
	END
END
ELSE BEGIN
    SELECT @ITE_NOMBRE = ITE_Nombre, @ST_ID = ST_Id FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID
    
	DELETE FROM tblStockOrdenes WHERE ITE_ID = @ITE_ID
    DELETE FROM tblStock WHERE ST_Id = @ST_ID
    DELETE FROM tblMergeOrdenes WHERE ITE_Nombre = @ITE_NOMBRE
END

SELECT 0 AS ERROR,'''' AS MSG

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
' 
END
GO
/****** Object:  Table [dbo].[tblFacturas]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblFacturas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblFacturas](
	[FAC_Id] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_Id] [int] NULL,
	[FAC_Folio] [int] NULL,
	[FAC_Fecha] [datetime] NULL,
	[FAC_Expedicion] [varchar](100) NULL,
	[FAC_Pedimento] [varchar](100) NULL,
	[FAC_Dolares] [bit] NULL,
	[FAC_TipoCambio] [decimal](18, 2) NULL,
	[FAC_IVA] [int] NULL,
	[FAC_Req] [varchar](100) NULL,
	[FAC_OrdenCompra] [varchar](25) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblExchangeRate]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblExchangeRate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblExchangeRate](
	[Rate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Rate_Date] [datetime] NULL,
	[Rate_Amount] [decimal](18, 5) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblEntradasSalidas]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasSalidas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblEntradasSalidas](
	[ES_ID] [int] IDENTITY(1,1) NOT NULL,
	[ED_ID] [int] NULL,
	[ED_Cantidad] [decimal](18, 2) NULL,
	[SD_ID] [int] NULL,
	[ES_Costo] [decimal](18, 2) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblEntradas]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblEntradas](
	[ENT_ID] [int] IDENTITY(1,1) NOT NULL,
	[ENT_Pedimento] [varchar](50) NULL,
	[ENT_ClavePedimento] [varchar](50) NULL,
	[ENT_Fecha] [datetime] NULL,
	[ENT_PaisOrigen] [int] NULL,
	[ENT_Nacional] [varchar](50) NULL,
	[ENT_TipoImp] [varchar](50) NULL,
	[ENT_Factura] [varchar](50) NULL,
	[ENT_OrdenCompra] [varchar](50) NULL,
	[PROV_ID] [int] NULL,
	[ENT_IVA] [int] NULL,
	[USE_ID] [int] NULL,
	[ENT_Dolares] [bit] NULL CONSTRAINT [DF_tblEntradas_Dolares]  DEFAULT (0),
	[ENT_TipoCambio] [decimal](18, 2) NULL,
	[ENT_Desp] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEntradasDetalle_History]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasDetalle_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblEntradasDetalle_History](
	[ED_ID] [int] NULL,
	[ENT_ID] [int] NULL,
	[MAT_ID] [int] NULL,
	[ED_Cantidad] [decimal](18, 2) NULL,
	[ED_Costo] [decimal](18, 2) NULL,
	[ED_Restante] [decimal](18, 2) NULL,
	[SL_Desp] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblEntradasDetalle]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntradasDetalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblEntradasDetalle](
	[ED_ID] [int] IDENTITY(1,1) NOT NULL,
	[ENT_ID] [int] NULL,
	[MAT_ID] [int] NULL,
	[ED_Cantidad] [decimal](18, 2) NULL,
	[ED_Costo] [decimal](18, 2) NULL,
	[ED_Restante] [decimal](18, 2) NULL,
	[SL_Desp] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblMateriales]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMateriales]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblMateriales](
	[MAT_ID] [int] IDENTITY(1,1) NOT NULL,
	[MAT_Fraccion] [varchar](50) NULL,
	[MAT_Numero] [varchar](50) NULL,
	[MAT_Descripcion] [varchar](150) NULL,
	[MAT_Unidad] [int] NULL,
	[MAT_Tipo] [int] NULL,
	[MAT_Cantidad] [decimal](18, 2) NULL,
	[MAT_Costo] [decimal](18, 2) NULL,
	[MAT_UltimoCosto] [decimal](18, 2) NULL,
	[MAT_CostoPromedio] [decimal](18, 2) NULL,
	[MAT_Minimo] [decimal](18, 2) NULL,
	[MAT_Maximo] [decimal](18, 2) NULL,
	[MAT_Stock] [decimal](18, 2) NULL,
	[MAT_UltimoProvedor] [int] NULL,
	[MAT_Usuario] [int] NULL,
	[MAT_Fecha] [datetime] NULL,
	[MAT_Ubicacion] [varchar](50) NULL,
	[MAT_Total] [decimal](18, 2) NULL,
	[MAT_ProvNumero] [varchar](50) NULL,
	[MAT_Kilos] [bit] NULL CONSTRAINT [DF_tblMateriales_MAT_Kilos]  DEFAULT (0),
	[MAT_Densidad] [decimal](18, 2) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSalidasDetalle]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidasDetalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblSalidasDetalle](
	[SD_ID] [int] IDENTITY(1,1) NOT NULL,
	[SAL_ID] [int] NULL,
	[MAT_ID] [int] NULL,
	[SD_Cantidad] [decimal](18, 2) NULL,
	[SL_Cantidad] [int] NULL,
	[SL_Pedimento] [varchar](50) NULL,
	[ED_ID] [int] NULL,
	[IS_SL] [bit] NULL CONSTRAINT [DF_tblSalidasDetalle_IS_SL]  DEFAULT (0)
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [TD_tblSalidasDetalle]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblSalidasDetalle]'))
EXEC dbo.sp_executesql @statement = N'



CREATE   TRIGGER [dbo].[TD_tblSalidasDetalle] ON [dbo].[tblSalidasDetalle]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE 
	@SD_ID			INT,
	@ED_ID			INT,
	@ED_CANTIDAD		DECIMAL(18,2)

	/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
	DECLARE Salidas_Deleted CURSOR FOR
	
	SELECT SD_ID FROM DELETED
	
	/*OPEN CURSOR*/
	OPEN Salidas_Deleted
	/*GET FIRST RECORD INTO VARIABLE*/
	FETCH NEXT FROM Salidas_Deleted INTO @SD_ID
	WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
	BEGIN
	

		/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
		DECLARE SalidasEntradas_Deleted CURSOR FOR
		
			SELECT ED_ID, ED_Cantidad FROM tblEntradasSalidas WHERE SD_ID = @SD_ID
		
		/*OPEN CURSOR*/
		OPEN SalidasEntradas_Deleted
		/*GET FIRST RECORD INTO VARIABLE*/
		FETCH NEXT FROM SalidasEntradas_Deleted INTO @ED_ID, @ED_CANTIDAD
		WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
		BEGIN

			UPDATE tblEntradasDetalle SET ED_Restante = ED_Restante + @ED_CANTIDAD
			WHERE ED_ID = @ED_ID


		   FETCH NEXT FROM SalidasEntradas_Deleted INTO @ED_ID, @ED_CANTIDAD
		END
		
		--DROP TABLE ##TBLEXPORTBU
		/*CLOSE CURSOR*/
		CLOSE SalidasEntradas_Deleted
		DEALLOCATE SalidasEntradas_Deleted


		DELETE FROM tblEntradasSalidas WHERE SD_ID = @SD_ID

	   FETCH NEXT FROM Salidas_Deleted INTO @SD_ID
	END
	
	--DROP TABLE ##TBLEXPORTBU
	/*CLOSE CURSOR*/
	CLOSE Salidas_Deleted
	DEALLOCATE Salidas_Deleted

	INSERT INTO tblSalidasDetalle_History
	SELECT * FROM DELETED

    SET NOCOUNT OFF
END










'
GO
/****** Object:  Table [dbo].[tblEmpleados]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEmpleados]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblEmpleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NULL,
	[Departamento] [varchar](150) NULL,
	[Puesto] [varchar](150) NULL,
	[Turno] [char](1) NULL,
	[Percepciones] [decimal](18, 2) NULL,
	[CostoHora] [decimal](18, 2) NULL,
	[FechaNac] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDescriptions]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblDescriptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblDescriptions](
	[DES_GROUP] [varchar](50) NOT NULL,
	[DES_CODE] [int] NOT NULL,
	[DEC_NOTE] [varchar](128) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ItemTasks]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemTasks]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- ItemTasks ''06-067-310-01''
CREATE     PROCEDURE [dbo].[ItemTasks]
	@ITE_NOMBRE AS VARCHAR(50)
AS 


IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE ID = OBJECT_ID(N''tempdb..#tmpTasks''))
DROP TABLE #tmpTasks

CREATE TABLE [#tmpTasks] (
	[TAS_ID] [int] NULL
) ON [PRIMARY]


DECLARE @PRODUCTO AS VARCHAR(50)

SELECT @PRODUCTO = Producto FROM tblOrdenes WHERE ITE_Nombre = @ITE_NOMBRE

INSERT INTO #tmpTasks
SELECT ROU_From FROM tblRouting WHERE Nombre = @PRODUCTO

INSERT INTO #tmpTasks
SELECT ROU_To FROM tblRouting WHERE Nombre = @PRODUCTO
AND Rou_To NOT IN ( SELECT TAS_ID FROM #tmpTasks)

-- select * from #tmpTasks

SELECT I.TAS_ID,T.Nombre AS Tarea,
DEC_NOTE AS Status,
--CASE WHEN I.ITS_Status = 0 THEN ''Listo''
--WHEN I.ITS_Status = 1 THEN ''Activo''
--WHEN I.ITS_Status = 2 THEN ''Terminado'' END AS Status,
ITS_DTStart AS Start,ITS_DTStop AS Stop,I.USE_Login AS Login
from tblitemtasks I
INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
LEFT OUTER JOIN tblDescriptions D ON D.DES_CODE = I.ITS_Status
WHERE I.ITE_Nombre = @ITE_NOMBRE
AND T.[ID] IN (SELECT TAS_ID FROM #tmpTasks)
ORDER BY TAS_Order







set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


' 
END
GO
/****** Object:  Table [dbo].[tblContribuyente]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblContribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblContribuyente](
	[CON_ID] [int] IDENTITY(1,1) NOT NULL,
	[CON_RazonSocial] [varchar](250) NULL,
	[CON_RFC] [char](13) NULL,
	[CON_Registro] [varchar](50) NULL,
	[CON_Calle] [varchar](150) NULL,
	[CON_Numero] [varchar](50) NULL,
	[CON_CP] [varchar](10) NULL,
	[CON_Colonia] [varchar](100) NULL,
	[CON_Entidad] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblClientes]    Script Date: 11/16/2015 14:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblClientes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblClientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](5) NULL,
	[Nombre] [varchar](150) NULL,
	[Contacto] [varchar](150) NULL,
	[RFC] [varchar](50) NULL,
	[Calle] [varchar](150) NULL,
	[Numero] [varchar](50) NULL,
	[Colonia] [varchar](75) NULL,
	[CP] [varchar](10) NULL,
	[Ciudad] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
	[Recordar] [varchar](5) NULL,
	[Update_Date] [datetime] NULL,
	[Update_User] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Upload_File]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Upload_File]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- truncate table tblstockordenes
-- select * from tblempdata order by lastupdate
-- Upload_File ''C:\Chris\Code\Larco\uploadtest.csv'',''uploadtest.xls'',''sa'',''06''
-- select * from tblStockOrdenes where [filename] = ''uploadtest.xls''
-- select * from tblStockOrdenes where [filename] is null
-- delete from tblStockOrdenes where [filename] is null
-- delete from tblStockOrdenes where [filename] = ''uploadtest.xls''

CREATE    PROCEDURE [dbo].[Upload_File]
	@FILENAME AS VARCHAR(1000),
	@FILE AS VARCHAR(50),
	@ADDBY AS VARCHAR(50),
	@ANIO AS VARCHAR(2)
AS

DECLARE @SQL AS VARCHAR(8000)

-- ***************************************************************************************
-- ********************* Delete and create temporary tables ******************************
-- ***************************************************************************************
if exists (select * from tempdb..sysobjects where id = object_id(N''tempdb..#tmpOrdenes''))
drop table #tmpOrdenes

CREATE TABLE [#tmpOrdenes] (
	[ITE_Nombre] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TipoProceso] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Requerida] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Ordenada] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Producto] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Numero] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Terminal] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OrdenCompra] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Recibido] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Interna] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Entrega] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Nombre] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Aprobacion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Unitario] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Total] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Dolares] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Observaciones] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Otras] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

if exists (select * from tempdb..sysobjects where id = object_id(N''tempdb..#tmpRejected''))
drop table #tmpRejected

CREATE TABLE [#tmpRejected] (
	[ITE_Nombre] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TipoProceso] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Requerida] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Ordenada] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Producto] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Numero] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Terminal] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OrdenCompra] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Recibido] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Interna] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Entrega] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Nombre] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Aprobacion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Unitario] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Total] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Dolares] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Observaciones] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Otras] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Razon] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

PRINT(''Temporary Tables created.'')

-- ***************************************************************************************
-- ****** Insert data into temporary table #tmpEmpData From .csv File ********************
-- ***************************************************************************************
SET @SQL = ''BULK INSERT #tmpOrdenes FROM '''''' + @FILENAME + ''''''
WITH ( FIRSTROW = 2, FIELDTERMINATOR = '''','''', ROWTERMINATOR = ''''\n'''')''

EXEC(@SQL)

PRINT(''Bulk insert done.'')

-- -- ***************************************************************************************
-- -- ********************** Remove the character " from fields *****************************
-- -- ***************************************************************************************
UPDATE #tmpOrdenes SET ITE_Nombre = REPLACE(ITE_Nombre,''"'',''''),
TipoProceso = REPLACE(TipoProceso,''"'',''''),
Requerida = REPLACE(Requerida,''"'',''''),
Ordenada = REPLACE(Ordenada,''"'',''''),
Producto = REPLACE(Producto,''"'',''''),
Numero = REPLACE(Numero,''"'',''''),
Terminal = REPLACE(Terminal,''"'',''''),
OrdenCompra = REPLACE(OrdenCompra,''"'',''''),
Recibido = REPLACE(Recibido,''"'',''''),
Interna = REPLACE(Interna,''"'',''''),
Entrega = REPLACE(Entrega,''"'',''''),
Nombre = REPLACE(Nombre,''"'',''''),
Aprobacion = REPLACE(Aprobacion,''"'',''''),
Unitario = REPLACE(Unitario,''"'',''''),
Total = REPLACE(Total,''"'',''''),
Dolares = REPLACE(Dolares,''"'',''''),
Observaciones = REPLACE(Observaciones,''"'',''''),
Otras = REPLACE(Otras,''"'','''')

-- select * from #tmpOrdenes

UPDATE #tmpOrdenes SET Observaciones = NULL WHERE Observaciones = '' ''
UPDATE #tmpOrdenes SET Otras = NULL WHERE Otras = '' ''

PRINT(''Replace done.'')

-- *********************************************************************************************
-- Validate data
-- *********************************************************************************************

INSERT INTO #tmpRejected SELECT *,''Orden ya existente.'' 
FROM #tmpOrdenes WHERE ITE_Nombre IN (SELECT RIGHT(ITE_Nombre,10) FROM tblOrdenes)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''El cliente no existe.'' 
FROM #tmpOrdenes WHERE LEFT(ITE_Nombre,3) NOT IN (SELECT Clave FROM tblClientes)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La longitud de la orden debe de ser de 10 caracteres.'' 
FROM #tmpOrdenes WHERE LEN( RTRIM(ITE_Nombre) ) > 10
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La orden no esta en el formato correcto. xxx-xxx-xx.'' 
FROM #tmpOrdenes WHERE SUBSTRING(ITE_Nombre,4,1) <> ''-''
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La orden no esta en el formato correcto. xxx-xxx-xx.'' 
FROM #tmpOrdenes WHERE SUBSTRING(ITE_Nombre,8,1) <> ''-''
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La longitud del Tipo de Proceso debe de ser de 50 caracteres.'' 
FROM #tmpOrdenes WHERE LEN( RTRIM(TipoProceso) ) > 50
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La cantidad Requerida debe de ser numerica.'' 
FROM #tmpOrdenes WHERE ISNUMERIC(Requerida) = 0
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La cantidad Ordenada debe de ser numerica.'' 
FROM #tmpOrdenes WHERE ISNUMERIC(Ordenada) = 0
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''No es una Descripcion valida.'' 
FROM #tmpOrdenes WHERE UPPER(Producto) NOT IN (SELECT UPPER(Nombre) FROM tblProductos)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La longitud de la Descripcion debe de ser de 50 caracteres.'' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Producto) ) > 50
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La longitud del Numero debe de ser de 50 caracteres.'' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Numero) ) > 50
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La longitud del Terminal debe de ser de 50 caracteres.'' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Terminal) ) > 50
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La longitud de la Orden de Compra debe de ser de 50 caracteres.'' 
FROM #tmpOrdenes WHERE LEN( RTRIM(OrdenCompra) ) > 50
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La fecha interna no es un tipo de fecha valido.'' 
FROM #tmpOrdenes WHERE ISDATE(Interna) = 0
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La fecha de Entrega no es un tipo de fecha valido.'' 
FROM #tmpOrdenes WHERE ISDATE(Entrega) = 0
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''No es un Nombre d empleado valido.'' 
FROM #tmpOrdenes WHERE UPPER(Nombre) NOT IN (SELECT UPPER(Nombre) FROM tblEmpleados)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)


INSERT INTO #tmpRejected SELECT *,''La longitud del Nombre debe de ser de 150 caracteres.'' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Nombre) ) > 150
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La Aprobacion debe de ser 1 o 0.'' 
FROM #tmpOrdenes WHERE Aprobacion NOT IN (0,1)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La longitud de las Observaciones debe de ser de 1000 caracteres.'' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Observaciones) ) > 1000
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La longitud de otra descripcion debe de ser de 500 caracteres.'' 
FROM #tmpOrdenes WHERE LEN( RTRIM(Otras) ) > 500
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''La el precio unitario debe de ser numerico.'' 
FROM #tmpOrdenes WHERE ISNUMERIC(Unitario) = 0
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

INSERT INTO #tmpRejected SELECT *,''Los Dolares debe de ser 1 o 0.'' 
FROM #tmpOrdenes WHERE Dolares NOT IN (0,1)
AND ITE_Nombre NOT IN (SELECT ITE_Nombre FROM #tmpRejected)

DELETE FROM #tmpOrdenes WHERE ITE_Nombre IN ( SELECT ITE_Nombre FROM #tmpRejected )

DELETE FROM tblStockOrdenes WHERE FileName = @FILE AND Programado = 0

-- SELECT @ANIO + ''-'' + ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
-- OrdenCompra,Recibido,Interna,Entrega,Nombre,Aprobacion,Unitario,Total,Dolares,Observaciones,
-- Otras,@FILE,@ADDBY,GETDATE() FROM #tmpOrdenes


INSERT INTO tblStockOrdenes(ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
OrdenCompra,Recibido,Interna,Entrega,Nombre,Aprobacion,Unitario,Total,Dolares,Observaciones,
Otras,FileName,AddBy,AddDate)
SELECT @ANIO + ''-'' + ITE_Nombre,TipoProceso,Requerida,Ordenada,Producto,Numero,Terminal,
OrdenCompra,Convert(varchar(10),GETDATE(),101),Interna,Entrega,Nombre,Aprobacion,Unitario,
CAST(Unitario AS DECIMAL(12,2))* CAST(Requerida AS DECIMAL(12,2)),Dolares,Observaciones,
Otras,@FILE,@ADDBY,GETDATE() 
FROM #tmpOrdenes


-- -- ***************************************************************************************
-- -- ************* Delete file from server and drop temporary table ************************


DROP TABLE #tmpOrdenes

-- ***************************************************************************************
SET @SQL = ''master..xp_cmdshell ''''del '' + @FILENAME + '''''',no_output''
EXEC(@SQL)

PRINT(''File deleted.'')

SELECT * FROM #tmpRejected ORDER BY ITE_Nombre






' 
END
GO
/****** Object:  Table [dbo].[tblCategory_Screens]    Script Date: 11/16/2015 14:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCategory_Screens]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCategory_Screens](
	[Category_ID] [int] NULL,
	[SCR_ID] [int] NULL,
	[SCR_Order] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 11/16/2015 14:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCategories](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](50) NULL,
	[Category_Order] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGroups]    Script Date: 11/16/2015 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblGroups](
	[Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ExchangeRate]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExchangeRate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



--EXEC Screens 2,'''','''','''',1
CREATE    PROCEDURE [dbo].[ExchangeRate]
  @TYPE   AS INT,
  @DATE   AS VARCHAR(10) = NULL,
  @AMOUTN AS DECIMAL(18,5) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblExchangeRate(Rate_Date,Rate_Amount)
	SELECT @DATE,@AMOUTN
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblExchangeRate SET Rate_Date = @DATE, Rate_Amount = @AMOUTN
        WHERE Rate_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblExchangeRate WHERE Rate_ID = @ID
END





' 
END
GO
/****** Object:  StoredProcedure [dbo].[Carga_Trabajo]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carga_Trabajo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE       PROCEDURE [dbo].[Carga_Trabajo]
    @ROWNAME AS VARCHAR(100),
    @COLUMNNAME AS VARCHAR(100),
    @WHERE AS VARCHAR(8000),
    @PIEZAS AS BIT
AS

DECLARE @SQL AS VARCHAR(8000)
DECLARE @COUNT AS INTEGER

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id = OBJECT_ID(N''tempdb..#tmpCarga''))
DROP TABLE #tmpCarga

CREATE TABLE [#tmpCarga] (
	[Columna] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Amount] int,
	[ColumnName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]


SET @SQL = ''INSERT INTO #tmpCarga SELECT '' + @ROWNAME + '',''

IF(@PIEZAS = 0) BEGIN
	SET @SQL = @SQL + '' COUNT(*) AS Cantidad,''
END
ELSE BEGIN
	SET @SQL = @SQL + '' SUM(O.Ordenada) AS Cantidad,''
END

DECLARE @COLUMNNEW AS VARCHAR(100)
DECLARE @COLUMNORDER AS VARCHAR(100)


SET @COLUMNNEW = @COLUMNNAME

if (@COLUMNNAME = ''T.Nombre'') begin
	SET @COLUMNNEW = ''RIGHT(''''000'''' + CAST(TAS_Order AS VARCHAR(100)),2) + T.Nombre''	
end

SET @COLUMNORDER = @COLUMNNAME
if (@COLUMNNAME = ''T.Nombre'') begin
	SET @COLUMNORDER = ''TAS_Order,T.Nombre''	
end

SET @SQL = @SQL + @COLUMNNEW + '' FROM tblItemTasks I
           INNER JOIN tblTareas T ON I.TAS_ID = T.[ID]
	   INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre
	   WHERE ''

PRINT(@SQL + @WHERE + '' GROUP BY '' + @ROWNAME + '', '' + @COLUMNORDER)
EXECUTE(@SQL + @WHERE + '' GROUP BY '' + @ROWNAME + '', '' + @COLUMNORDER)

--SELECT * FROM #tmpCarga

INSERT INTO #tmpCarga
SELECT ''Total'', SUM(Amount), ColumnName 
FROM #tmpCarga
GROUP BY ColumnName


INSERT INTO #tmpCarga
SELECT Columna, SUM(Amount), ''Total'' 
FROM #tmpCarga
GROUP BY Columna

SELECT @COUNT = COUNT(AMOUNT) FROM #tmpCarga

IF(@COUNT <> 0) BEGIN
 EXEC CROSSTAB_ORIGINAL ''SELECT Columna FROM #tmpCarga GROUP BY Columna ORDER BY Columna'',''SUM(Amount)'',''ColumnName'',''#tmpCarga'','' ORDER BY ColumnName''
END
ELSE BEGIN
	SELECT ''No hay Ordenes, para el filtro que selecciono.'' AS Mensaje
END

DROP TABLE #tmpCarga

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetNonWorkingDays]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetNonWorkingDays]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  FUNCTION [dbo].[GetNonWorkingDays](@STARTDATE AS DATE, @ENDDATE AS DATE) RETURNS INT
AS 
BEGIN

DECLARE @NONWD AS INT

SELECT @NONWD = COUNT(*) + (DATEDIFF(ww, @STARTDATE, @ENDDATE) * 2)
FROM tblNonWorkingDay 
WHERE NonWorkingDay BETWEEN @STARTDATE AND @ENDDATE

RETURN	@NONWD
END' 
END
GO
/****** Object:  Trigger [TI_tblSalidasDetalle]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblSalidasDetalle]'))
EXEC dbo.sp_executesql @statement = N'





CREATE        TRIGGER [dbo].[TI_tblSalidasDetalle] ON [dbo].[tblSalidasDetalle]
FOR INSERT, UPDATE
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE 
	@MAT_ID			INT,
	@SD_CANTIDAD		DECIMAL(18,2),
	@ED_RESTANTE		DECIMAL(18,2),
	@SD_COSTO		DECIMAL(18,2),
	@SD_ID 			INT,
	@ED_ID 			INT,
	@COSTO	                DECIMAL(18,2),
	@TIPO_COSTEO            VARCHAR(50),
	@EXIT			BIT

	SELECT @SD_ID = SD_ID, @MAT_ID = I.MAT_ID, @SD_CANTIDAD = SD_Cantidad  
	FROM INSERTED I WHERE IS_SL = 0
	
	SELECT TOP 1 @TIPO_COSTEO = CONF_Inventarios FROM tblInventariosConf
	
	SET @EXIT = 0
	IF(@SD_ID IS NOT NULL) BEGIN 
		IF(@TIPO_COSTEO = ''PROMEDIO'') BEGIN
			--ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
			--INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a PROMEDIO''
			
			/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
			DECLARE Salidas_Promedio CURSOR FOR
			
			SELECT D.ED_ID,M.MAT_CostoPromedio, D.ED_Restante FROM tblEntradasDetalle D
			INNER JOIN tblEntradas E ON D.ENT_ID = E.ENT_ID
			INNER JOIN tblMateriales M ON D.MAT_ID = M.MAT_ID
			WHERE D.MAT_ID = @MAT_ID AND D.ED_Restante > 0
			ORDER BY E.ENT_FECHA ASC, D.ED_ID ASC
			
			/*OPEN CURSOR*/
			OPEN Salidas_Promedio
			/*GET FIRST RECORD INTO VARIABLE*/
			FETCH NEXT FROM Salidas_Promedio INTO @ED_ID, @COSTO, @ED_RESTANTE
			WHILE @@FETCH_STATUS = 0 AND @EXIT = 0/*do while not end of cursor*/
			BEGIN
			   IF(@ED_RESTANTE >= @SD_CANTIDAD) BEGIN
				UPDATE tblEntradasDetalle SET ED_Restante = @ED_RESTANTE - @SD_CANTIDAD WHERE ED_ID = @ED_ID
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @SD_CANTIDAD
			
				SET @EXIT = 1
			        BREAK
			   END
			   ELSE BEGIN
				SET @SD_CANTIDAD = @SD_CANTIDAD - @ED_RESTANTE
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @ED_RESTANTE
			
				UPDATE tblEntradasDetalle SET ED_Restante = 0.0 WHERE ED_ID = @ED_ID
			   END
			   	   
			   FETCH NEXT FROM Salidas_Promedio INTO @ED_ID, @COSTO, @ED_RESTANTE
			END
			
			--DROP TABLE ##TBLEXPORTBU
			/*CLOSE CURSOR*/
			CLOSE Salidas_Promedio
			DEALLOCATE Salidas_Promedio
		
		END
		ELSE IF(@TIPO_COSTEO = ''PEPS'') BEGIN
			--ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
			--INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a PEPS''
			
			/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
			DECLARE Salidas_PEPS CURSOR FOR
			
			SELECT D.ED_ID,D.ED_Costo, D.ED_Restante 
			FROM tblEntradasDetalle D
			INNER JOIN tblEntradas E ON D.ENT_ID = E.ENT_ID
			WHERE D.MAT_ID = @MAT_ID AND D.ED_Restante > 0
			ORDER BY E.ENT_FECHA ASC, D.ED_ID ASC
			
			/*OPEN CURSOR*/
			OPEN Salidas_PEPS
			/*GET FIRST RECORD INTO VARIABLE*/
			FETCH NEXT FROM Salidas_PEPS INTO @ED_ID, @COSTO, @ED_RESTANTE
			WHILE @@FETCH_STATUS = 0 AND @EXIT = 0 /*do while not end of cursor*/
			BEGIN
			   
			   IF(@ED_RESTANTE >= @SD_CANTIDAD) BEGIN
			        --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
				--INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a @ED_RESTANTE >= @SD_CANTIDAD''
				UPDATE tblEntradasDetalle SET ED_Restante = @ED_RESTANTE - @SD_CANTIDAD WHERE ED_ID = @ED_ID
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @SD_CANTIDAD
			
				SET @EXIT = 1
			        BREAK
			   END
			   ELSE BEGIN
			        --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
				--INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a @ED_RESTANTE < @SD_CANTIDAD''
				SET @SD_CANTIDAD = @SD_CANTIDAD - @ED_RESTANTE
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @ED_RESTANTE
			
				UPDATE tblEntradasDetalle SET ED_Restante = 0.0 WHERE ED_ID = @ED_ID
			   END
			
			   FETCH NEXT FROM Salidas_PEPS INTO @ED_ID, @COSTO, @ED_RESTANTE
			END
			
			--DROP TABLE ##TBLEXPORTBU
			/*CLOSE CURSOR*/
			CLOSE Salidas_PEPS
			DEALLOCATE Salidas_PEPS
		
		END
		ELSE IF(@TIPO_COSTEO = ''UEPS'') BEGIN
			--ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
			--INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a UEPS''
			
			/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
			DECLARE Salidas_UEPS CURSOR FOR
			
			SELECT D.ED_ID,D.ED_Costo, D.ED_Restante FROM tblEntradasDetalle D
			INNER JOIN tblEntradas E ON D.ENT_ID = E.ENT_ID
			WHERE D.MAT_ID = @MAT_ID AND D.ED_Restante > 0
			ORDER BY E.ENT_FECHA DESC, D.ED_ID DESC
			
			/*OPEN CURSOR*/
			OPEN Salidas_UEPS
			/*GET FIRST RECORD INTO VARIABLE*/
			FETCH NEXT FROM Salidas_UEPS INTO @ED_ID, @COSTO, @ED_RESTANTE
			WHILE @@FETCH_STATUS = 0 AND @EXIT = 0 /*do while not end of cursor*/
			BEGIN
			   
			   IF(@ED_RESTANTE >= @SD_CANTIDAD) BEGIN
				UPDATE tblEntradasDetalle SET ED_Restante = @ED_RESTANTE - @SD_CANTIDAD WHERE ED_ID = @ED_ID
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @SD_CANTIDAD
			
				SET @EXIT = 1
			        BREAK
			   END
			   ELSE BEGIN
				SET @SD_CANTIDAD = @SD_CANTIDAD - @ED_RESTANTE
			
				INSERT INTO tblEntradasSalidas(ED_ID,SD_ID, ES_Costo, ED_Cantidad)
				SELECT @ED_ID, @SD_ID, @COSTO, @ED_RESTANTE
			
				UPDATE tblEntradasDetalle SET ED_Restante = 0.0 WHERE ED_ID = @ED_ID
			   END
			
			   FETCH NEXT FROM Salidas_UEPS INTO @ED_ID, @COSTO, @ED_RESTANTE
			END
			
			--DROP TABLE ##TBLEXPORTBU
			/*CLOSE CURSOR*/
			CLOSE Salidas_UEPS
			DEALLOCATE Salidas_UEPS
		
		END
	END
    SET NOCOUNT OFF
END






'
GO
/****** Object:  Trigger [TI_tblMateriales]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblMateriales]'))
EXEC dbo.sp_executesql @statement = N'
CREATE  TRIGGER [dbo].[TI_tblMateriales] ON [dbo].[tblMateriales]
FOR INSERT
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE 
	@ENT_ID			INT,
	@MAT_CANTIDAD		DECIMAL(18,2),
	@MAT_ID			INT

    SELECT @ENT_ID = ENT_ID FROM tblEntradas WHERE ENT_Pedimento = ''N/A''

    IF (@ENT_ID IS NULL) BEGIN
	INSERT INTO 
	tblEntradas(ENT_Pedimento, ENT_ClavePedimento, ENT_Fecha, ENT_PaisOrigen,
	ENT_Nacional, ENT_TipoImp, ENT_Factura, ENT_OrdenCompra, PROV_ID, ENT_IVA,
	USE_ID, ENT_Dolares, ENT_TipoCambio, ENT_Desp)
	SELECT ''N/A'',''N/A'',GETDATE(),2,''Nacional'','''',''N/A'',''N/A'',3,0,14,0,1.00,NULL 
    END

    SELECT @ENT_ID = ENT_ID FROM tblEntradas WHERE ENT_Pedimento = ''N/A''
    --select * from tblMateriales
    SELECT @MAT_CANTIDAD = MAT_CANTIDAD, @MAT_ID = MAT_ID FROM INSERTED 

    INSERT INTO tblEntradasDetalle(ENT_ID, MAT_ID, ED_Cantidad, ED_Costo, ED_Restante, SL_Desp)
    SELECT @ENT_ID, @MAT_ID, @MAT_CANTIDAD, 0.0, @MAT_CANTIDAD,NULL 
END

'
GO
/****** Object:  Trigger [TI_tblEntradasDetalle]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblEntradasDetalle]'))
EXEC dbo.sp_executesql @statement = N'







CREATE        TRIGGER [dbo].[TI_tblEntradasDetalle] ON [dbo].[tblEntradasDetalle]
FOR INSERT, UPDATE
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE 
	@MAT_ID			INT,
	@ED_CANTIDAD		DECIMAL(18,2),
	@ED_COSTO		DECIMAL(18,2),
	@PROV_ID		INT,
	@COSTO_AVG              DECIMAL(18,2),
	@TOTAL                  DECIMAL(18,2),
	@ENT_ID			INT

    SELECT @MAT_ID = I.MAT_ID, @ED_COSTO = ED_Costo, @ENT_ID = ENT_ID FROM INSERTED I
    --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
    --INSERT INTO tmpEmpleados(Nombre) SELECT ''Entro a TI_tblEntradasDetalle matID: '' + CAST(@MAT_ID AS varchar(10)) 


    SELECT @COSTO_AVG = CASE WHEN AVG(ED_Costo) IS NULL THEN 0.0 ELSE AVG(ED_Costo) END,
    @ED_CANTIDAD = CASE WHEN SUM(ED_Restante) IS NULL THEN 0.0 ELSE SUM(ED_Restante) END,
    @TOTAL = CASE WHEN SUM(ED_Restante * ED_Costo) IS NULL THEN 0.0 ELSE SUM(ED_Restante * ED_Costo) END
    FROM tblEntradasDetalle WHERE MAT_ID = @MAT_ID
    
    --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
    --INSERT INTO tmpEmpleados(Nombre) 
    --SELECT ''Entro a TI_tblEntradasDetalle @COSTO_AVG:'' + CAST(@COSTO_AVG AS varchar(10)) + '', @ED_CANTIDAD:'' + 
    --CAST(@ED_CANTIDAD AS varchar(10))


    SELECT TOP 1 @PROV_ID = PROV_ID FROM tblEntradas WHERE ENT_ID = @ENT_ID
    --ESTAS LINEAS COMENTADAS SOLO LAS AGREGE PARA DEBUGEAR LAS PUEDES BORRAR SIN PROBLEMA
    --INSERT INTO tmpEmpleados(Nombre)
    --SELECT ''Entro a TI_tblEntradasDetalle @PROV_ID:'' + CAST(@PROV_ID AS varchar(10)) + '', @ED_COSTO:'' + 
    --CAST(@ED_COSTO AS varchar(10))
    
    UPDATE tblMateriales SET MAT_Cantidad = @ED_CANTIDAD, MAT_UltimoCosto = @ED_COSTO, 
    MAT_UltimoProvedor = @PROV_ID, MAT_CostoPromedio = @COSTO_AVG, MAT_Total = @TOTAL 
    WHERE MAT_ID = @MAT_ID

    SET NOCOUNT OFF
END








'
GO
/****** Object:  Trigger [TD_tblEntradasDetalle]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblEntradasDetalle]'))
EXEC dbo.sp_executesql @statement = N'






CREATE        TRIGGER [dbo].[TD_tblEntradasDetalle] ON [dbo].[tblEntradasDetalle]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE 
	@MAT_ID			INT,
	@ED_CANTIDAD		DECIMAL(18,2),
	@ED_COSTO		DECIMAL(18,2),
	@PROV_ID		INT,
	@COSTO_AVG              DECIMAL(18,2)

	/*DECLARE CURSOR FOR OLD ITEMS ON SYSTEM*/
	DECLARE Materiales_Deleted CURSOR FOR
	
	SELECT MAT_ID FROM DELETED
	
	/*OPEN CURSOR*/
	OPEN Materiales_Deleted
	/*GET FIRST RECORD INTO VARIABLE*/
	FETCH NEXT FROM Materiales_Deleted INTO @MAT_ID
	WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
	BEGIN
	
	    SELECT @COSTO_AVG = CASE WHEN AVG(ED_Costo) IS NULL THEN 0.0 ELSE AVG(ED_Costo) END,
	    @ED_CANTIDAD = CASE WHEN SUM(ED_Restante) IS NULL THEN 0.0 ELSE SUM(ED_Restante) END 
	    FROM tblEntradasDetalle WHERE MAT_ID = @MAT_ID
	
	    SELECT TOP 1 @PROV_ID = E.PROV_ID, 
            @ED_COSTO = CASE WHEN I.ED_Costo IS NULL THEN 0.0 ELSE I.ED_Costo END  
	    FROM tblEntradasDetalle I 
	    INNER JOIN tblEntradas E ON I.ENT_ID = E.ENT_ID
	    WHERE MAT_ID = @MAT_ID ORDER BY  ENT_Fecha DESC ,ED_ID DESC
	    
	    UPDATE tblMateriales SET MAT_Cantidad = @ED_CANTIDAD, MAT_UltimoCosto = @ED_COSTO, 
	    MAT_UltimoProvedor = @PROV_ID, MAT_CostoPromedio = @COSTO_AVG 
	    WHERE MAT_ID = @MAT_ID

	   FETCH NEXT FROM Materiales_Deleted INTO @MAT_ID
	END
	
	--DROP TABLE ##TBLEXPORTBU
	/*CLOSE CURSOR*/
	CLOSE Materiales_Deleted
	DEALLOCATE Materiales_Deleted

	INSERT INTO tblEntradasDetalle_History
	SELECT * FROM DELETED


    SET NOCOUNT OFF
END










'
GO
/****** Object:  Table [dbo].[tblSalidas]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSalidas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblSalidas](
	[SAL_ID] [int] IDENTITY(1,1) NOT NULL,
	[SAL_Fecha] [datetime] NULL,
	[SAL_Orden] [varchar](50) NULL,
	[SAL_Solicitado] [int] NULL,
	[USE_ID] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SalidasLarco]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalidasLarco]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

--exec SalidasLarco 7,8,''SSSSSSS'',2


CREATE    PROCEDURE [dbo].[SalidasLarco]
    @SD_ID 	  AS INT,
    @SL_CANTIDAD  AS INT,
    @SL_PEDIMENTO AS VARCHAR(50),
    @SL_DESP      AS INT
AS

DECLARE @MAT_ID           INT,
	@MAT_NUMERO       VARCHAR(50),
	@MAT_TIPO         INT,
	@ENT_ID	          INT,
	@ENT_Desp         INT,
	@MAT_ID_Desp      INT,
	@MAT_UltimoCosto  DECIMAL(18,2),
	@ED_ID_Desp	  INT

IF (@SL_DESP > 0) BEGIN
	--SELECT @MAT_ID = MAT_ID FROM tblSalidasDetalle WHERE SD_ID = @SD_ID
	SELECT @MAT_ID = SD.MAT_ID, @ENT_ID = E.ENT_ID 
	FROM tblSalidas S
	INNER JOIN tblSalidasDetalle SD ON S.SAL_ID = SD.SAL_ID
	INNER JOIN tblEntradasSalidas ES ON ES.SD_ID = SD.SD_ID
	INNER JOIN tblEntradasDetalle ED ON ES.ED_ID = ED.ED_ID
	INNER JOIN tblEntradas E ON E.ENT_ID = ED.ENT_ID
	WHERE SD.SD_ID = @SD_ID	

	SELECT @MAT_NUMERO = MAT_NUMERO, @MAT_UltimoCosto = MAT_UltimoCosto FROM tblMateriales WHERE MAT_ID = @MAT_ID

	--SELECT * FROM tblMateriales WHERE MAT_ID = 3
	
	-- SI EL MATERIAL DE DESPERDICIO NO EXISTE AGREGARLO
	IF NOT EXISTS(SELECT MAT_ID FROM tblMateriales WHERE MAT_NUMERO = ''D'' + @MAT_NUMERO) BEGIN
		-- SI EL TIPO DE MATERIAL DESPERDICIO NO EXISTE AGREGARLO
		IF NOT EXISTS(SELECT TIP_ID FROM tblTiposMaterial WHERE TIP_Descripcion = ''Desperdicio'') BEGIN
			INSERT INTO tblTiposMaterial(TIP_Tipo, TIP_Descripcion) SELECT ''Directo'',''Desperdicio''
		END

		SELECT @MAT_TIPO = TIP_ID FROM tblTiposMaterial WHERE TIP_Descripcion = ''Desperdicio''
		
		INSERT INTO tblMateriales(MAT_Fraccion,MAT_Numero, MAT_Descripcion, 
		MAT_Unidad, MAT_Tipo, MAT_Cantidad, MAT_costo, MAT_UltimoCosto, MAT_CostoPromedio,
		MAT_Minimo, MAT_Maximo, MAT_Stock, MAT_UltimoProvedor,MAT_Usuario, MAT_Fecha,
		MAT_Ubicacion, MAT_Total, MAT_ProvNumero, MAT_Kilos, MAT_Densidad)
		SELECT MAT_Fraccion,''D'' + MAT_Numero, MAT_Descripcion + '' - Desperdicio'', 
		MAT_Unidad, @MAT_TIPO, 0.0, 0.0, 0.0, 0.0,
		0.0, 0.0, 0.0, MAT_UltimoProvedor, MAT_Usuario, GETDATE(),
		MAT_Ubicacion, 0.0, MAT_ProvNumero, MAT_Kilos, MAT_Densidad
		FROM tblMateriales WHERE MAT_ID = @MAT_ID
	END
	SELECT @MAT_ID_Desp = MAT_ID FROM tblMateriales WHERE MAT_NUMERO = ''D'' + @MAT_NUMERO 


	-- CHECAR SI YA SE HA AGREGADO DESPERDICIO A ESTA ORDEN 
	IF EXISTS(SELECT ENT_ID FROM tblEntradas WHERE ENT_Desp = @ENT_ID) BEGIN
		SELECT @ENT_Desp = ENT_ID FROM tblEntradas WHERE ENT_Desp = @ENT_ID	
	END
	ELSE BEGIN -- SINO SE HA AGREGADO DESPERDICIO A ESTA ORDEN AGREGAR LA ENTRADA
		INSERT INTO tblEntradas(ENT_Pedimento, ENT_ClavePedimento,
		ENT_Fecha, ENT_PaisOrigen, ENT_Nacional, ENT_TipoImp,
		ENT_Factura, ENT_OrdenCompra, PROV_ID, ENT_IVA, USE_ID,
		ENT_Dolares, ENT_TipoCambio, ENT_Desp)
		SELECT ENT_Pedimento, ''Desperdicio'', CONVERT(VARCHAR(10), GETDATE(), 101),
		ENT_PaisOrigen, ENT_Nacional, ENT_TipoImp,
		ENT_Factura, ENT_OrdenCompra, PROV_ID, ENT_IVA, USE_ID,
		ENT_Dolares, ENT_TipoCambio, @ENT_ID
		FROM tblEntradas WHERE ENT_ID = @ENT_ID

		SELECT @ENT_Desp = ENT_ID FROM tblEntradas WHERE ENT_Desp = @ENT_ID			
	END

	-- AGREGAR LA ENTRADA EN tblEntradasDetalle
	INSERT INTO tblEntradasDetalle(ENT_ID, MAT_ID, ED_Cantidad, ED_Costo, ED_Restante, SL_Desp)
	SELECT @ENT_Desp, @MAT_ID_Desp, @SL_DESP, @MAT_UltimoCosto, @SL_DESP, @SD_ID

	
	SELECT TOP 1 @ED_ID_Desp = ED_ID FROM tblEntradasDetalle WHERE SL_Desp = @SD_ID

	UPDATE tblSalidasDetalle SET SL_Cantidad = @SL_CANTIDAD, 
	SL_Pedimento = @SL_PEDIMENTO, ED_ID = @ED_ID_Desp, IS_SL = 1
	WHERE SD_ID = @SD_ID
END
ELSE BEGIN
	UPDATE tblSalidasDetalle SET SL_Cantidad = @SL_CANTIDAD, 
	SL_Pedimento = @SL_PEDIMENTO, ED_ID = NULL, IS_SL = 1
	WHERE SD_ID = @SD_ID
END

 

-- SELECT * FROM tblSalidasDetalle

-- SELECT *
-- FROM tblSalidas S
-- INNER JOIN tblSalidasDetalle SD ON S.SAL_ID = SD.SAL_ID
-- INNER JOIN tblEntradasSalidas ES ON ES.SD_ID = SD.SD_ID
-- INNER JOIN tblEntradasDetalle ED ON ES.ED_ID = ED.ED_ID
-- INNER JOIN tblEntradas E ON E.ENT_ID = ED.ENT_ID
-- WHERE SAL_ORDEN = ''07-062-101-01''
-- 
-- SELECT * FROM tblEntradas WHERE ENT_ID = 2






' 
END
GO
/****** Object:  StoredProcedure [dbo].[SalidasLarcoEditar]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalidasLarcoEditar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--exec SalidasLarcoEditar 7,8,''SSSSSSS'',2

CREATE  PROCEDURE [dbo].[SalidasLarcoEditar]
    @SD_ID 	  AS INT,
    @SL_CANTIDAD  AS INT,
    @SL_PEDIMENTO AS VARCHAR(50),
    @SL_DESP      AS INT
AS

DECLARE @COUNT            INT,
	@ENT_Desp         INT,
	@ED_ID_Desp	  INT

SELECT @ED_ID_Desp = ED_ID  FROM tblSalidasDetalle WHERE SD_ID = @SD_ID
IF (@ED_ID_Desp IS NULL) BEGIN
	EXEC SalidasLarco @SD_ID, @SL_CANTIDAD, @SL_PEDIMENTO, @SL_DESP 
END
ELSE BEGIN
	SELECT @ENT_Desp = ENT_ID FROM tblEntradasDetalle WHERE ED_ID = @ED_ID_Desp
	IF (@SL_DESP > 0) BEGIN	
		UPDATE tblEntradasDetalle SET ED_Cantidad = @SL_DESP
		WHERE ED_ID = @ED_ID_Desp	
	END
	ELSE BEGIN
		DELETE FROM tblEntradasDetalle WHERE ED_ID = @ED_ID_Desp
		
		SELECT @COUNT = COUNT(ED_ID) FROM tblEntradasDetalle WHERE ENT_ID = @ENT_Desp
		
		IF (@COUNT = 0) BEGIN
			DELETE FROM tblEntradas WHERE ENT_ID = @ENT_Desp 
		END
	END
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[SalidasLarcoBorrar]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalidasLarcoBorrar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





--exec SalidasLarco 7,8,''SSSSSSS'',2


CREATE  PROCEDURE [dbo].[SalidasLarcoBorrar]
    @SD_ID 	  AS INT
AS

DECLARE @COUNT            INT,
	@ENT_Desp         INT,
	@ED_ID_Desp	  INT

SELECT @ED_ID_Desp = ED_ID  FROM tblSalidasDetalle WHERE SD_ID = @SD_ID
IF (@ED_ID_Desp IS NOT NULL) BEGIN
	SELECT @ENT_Desp = ENT_ID FROM tblEntradasDetalle WHERE ED_ID = @ED_ID_Desp
	
	DELETE FROM tblEntradasDetalle WHERE ED_ID = @ED_ID_Desp
	
	SELECT @COUNT = COUNT(ED_ID) FROM tblEntradasDetalle WHERE ENT_ID = @ENT_Desp
	
	IF (@COUNT = 0) BEGIN
		DELETE FROM tblEntradas WHERE ENT_ID = @ENT_Desp 
	END
END

UPDATE tblSalidasDetalle SET SL_Cantidad = NULL, 
SL_Pedimento = NULL, ED_ID = NULL, IS_SL = 1
WHERE SD_ID = @SD_ID





' 
END
GO
/****** Object:  View [dbo].[Routing_VW]    Script Date: 11/16/2015 14:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Routing_VW]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Routing_VW] AS

SELECT Rou_Id, Nombre AS Product, Rou_From as TaskId
FROM tblRouting
UNION
SELECT Rou_Id, Nombre AS Product, Rou_To AS TaskId 
FROM tblRouting
WHERE Nombre + CAST(Rou_To AS VARCHAR(10)) NOT IN (SELECT Nombre + CAST(Rou_From AS VARCHAR(10)) FROM tblRouting)
'
GO
/****** Object:  StoredProcedure [dbo].[Productividad_Empleado_Dinero]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Productividad_Empleado_Dinero]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE   PROCEDURE [dbo].[Productividad_Empleado_Dinero]
    @WHERE AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)
DECLARE @COUNT AS INTEGER

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id = OBJECT_ID(N''tempdb..#tmpProdEmp''))
DROP TABLE #tmpProdEmp

CREATE TABLE [#tmpProdEmp] (
	[Empleado] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Amount] DECIMAL(18,2),
	[ColumnName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

SET @SQL = ''INSERT INTO #tmpProdEmp '' + 
	   ''SELECT E.Nombre, COUNT(I.ITE_ID) AS Ordenes, DBO.FormatZeros(T.TAS_Order, 2) + ''''Ord.'''' + T.Nombre  AS Tarea '' + 
	   ''FROM tblItemTasks I '' +
           ''INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] '' + 
           ''INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre '' +
	   ''LEFT OUTER JOIN tblEmpleados E ON I.USE_Login = E.[ID] '' + 
	   ''WHERE ''


PRINT(@SQL + @WHERE + '' GROUP BY E.Nombre, T.Nombre, T.TAS_Order'')
EXECUTE(@SQL + @WHERE + '' GROUP BY E.Nombre, T.Nombre, T.TAS_Order'')


SET @SQL = ''INSERT INTO #tmpProdEmp '' + 
	   ''SELECT E.Nombre, SUM(O.Requerida) AS Piezas, DBO.FormatZeros(T.TAS_Order, 2) + ''''Pie.'''' + T.Nombre AS Tarea '' + 
	   ''FROM tblItemTasks I '' +
           ''INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] '' + 
           ''INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre '' +
	   ''LEFT OUTER JOIN tblEmpleados E ON I.USE_Login = E.[ID] '' + 
	   ''WHERE ''


PRINT(@SQL + @WHERE + '' GROUP BY E.Nombre, T.Nombre, T.TAS_Order'')
EXECUTE(@SQL + @WHERE + '' GROUP BY E.Nombre, T.Nombre, T.TAS_Order'')


SET @SQL = ''INSERT INTO #tmpProdEmp '' + 
	   ''SELECT E.Nombre, SUM(O.Requerida * O.Unitario * dbo.GetAggregateValue(P.Id, T.TAS_Order)) AS Piezas, DBO.FormatZeros(T.TAS_Order, 2) + ''''Din.'''' + T.Nombre AS Tarea '' + 
	   ''FROM tblItemTasks I '' +
           ''INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] '' + 
           ''INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre '' +
	   ''INNER JOIN tblProductos P ON O.Producto = P.Nombre '' +
	   ''LEFT OUTER JOIN tblEmpleados E ON I.USE_Login = E.[ID] '' + 
	   ''WHERE ''


PRINT(@SQL + @WHERE + '' GROUP BY E.Nombre, T.Nombre, T.TAS_Order'')
EXECUTE(@SQL + @WHERE + '' GROUP BY E.Nombre, T.Nombre, T.TAS_Order'')


INSERT INTO #tmpProdEmp
SELECT ''Total'', SUM(Amount), ColumnName 
FROM #tmpProdEmp
GROUP BY ColumnName


INSERT INTO #tmpProdEmp
SELECT Empleado, SUM(Amount), ''97Total Ord.'' 
FROM #tmpProdEmp
WHERE SUBSTRING(ColumnName,3,4) = ''Ord.''
GROUP BY Empleado

INSERT INTO #tmpProdEmp
SELECT Empleado, SUM(Amount), ''98Total Pie.'' 
FROM #tmpProdEmp
WHERE SUBSTRING(ColumnName,3,4) = ''Pie.''
GROUP BY Empleado

INSERT INTO #tmpProdEmp
SELECT Empleado, SUM(Amount), ''99Total Din.'' 
FROM #tmpProdEmp
WHERE SUBSTRING(ColumnName,3,4) = ''Din.''
GROUP BY Empleado

--SELECT * FROM #tmpProdEmp

SELECT @COUNT = COUNT(AMOUNT) FROM #tmpProdEmp

IF(@COUNT <> 0) BEGIN
	EXEC CROSSTAB_ORIGINAL ''SELECT Empleado FROM #tmpProdEmp GROUP BY Empleado ORDER BY Empleado'',''SUM(Amount)'',''ColumnName'',''#tmpProdEmp'','' ORDER BY ColumnName''
END
ELSE BEGIN
	SELECT ''No hay Ordenes, para el filtro que selecciono.'' AS Mensaje
END

DROP TABLE #tmpProdEmp
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Productividad_Empleado]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Productividad_Empleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE   PROCEDURE [dbo].[Productividad_Empleado]
    @WHERE AS VARCHAR(8000)
AS

DECLARE @SQL AS VARCHAR(8000)
DECLARE @COUNT AS INTEGER

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id = OBJECT_ID(N''tempdb..#tmpProdEmp''))
DROP TABLE #tmpProdEmp

CREATE TABLE [#tmpProdEmp] (
	[Empleado] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Amount] DECIMAL(18,2),
	[ColumnName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

SET @SQL = ''INSERT INTO #tmpProdEmp '' + 
	   ''SELECT E.Nombre, COUNT(I.ITE_ID) AS Ordenes, DBO.FormatZeros(T.TAS_Order, 2) + ''''Ord.'''' + T.Nombre  AS Tarea '' + 
	   ''FROM tblItemTasks I '' +
           ''INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] '' + 
           ''INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre '' +
	   ''LEFT OUTER JOIN tblEmpleados E ON I.USE_Login = E.[ID] '' + 
	   ''WHERE ''


PRINT(@SQL + @WHERE + '' GROUP BY E.Nombre, T.Nombre, T.TAS_Order'')
EXECUTE(@SQL + @WHERE + '' GROUP BY E.Nombre, T.Nombre, T.TAS_Order'')


SET @SQL = ''INSERT INTO #tmpProdEmp '' + 
	   ''SELECT E.Nombre, SUM(O.Requerida) AS Piezas, DBO.FormatZeros(T.TAS_Order, 2) + ''''Pie.'''' + T.Nombre AS Tarea '' + 
	   ''FROM tblItemTasks I '' +
           ''INNER JOIN tblTareas T ON I.TAS_ID = T.[ID] '' + 
           ''INNER JOIN tblOrdenes O ON I.ITE_Nombre = O.ITE_Nombre '' +
	   ''LEFT OUTER JOIN tblEmpleados E ON I.USE_Login = E.[ID] '' + 
	   ''WHERE ''


PRINT(@SQL + @WHERE + '' GROUP BY E.Nombre, T.Nombre, T.TAS_Order'')
EXECUTE(@SQL + @WHERE + '' GROUP BY E.Nombre, T.Nombre, T.TAS_Order'')


--SELECT * FROM #tmpProdEmp ORDER BY Empleado, ColumnName

INSERT INTO #tmpProdEmp
SELECT ''Total'', SUM(Amount), ColumnName 
FROM #tmpProdEmp
GROUP BY ColumnName


INSERT INTO #tmpProdEmp
SELECT Empleado, SUM(Amount), ''98Total Ord.'' 
FROM #tmpProdEmp
WHERE SUBSTRING(ColumnName,3,4) = ''Ord.''
GROUP BY Empleado

INSERT INTO #tmpProdEmp
SELECT Empleado, SUM(Amount), ''99Total Pie.'' 
FROM #tmpProdEmp
WHERE SUBSTRING(ColumnName,3,4) = ''Pie.''
GROUP BY Empleado
--SELECT * FROM #tmpProdEmp

SELECT @COUNT = COUNT(AMOUNT) FROM #tmpProdEmp

IF(@COUNT <> 0) BEGIN
	EXEC CROSSTAB_ORIGINAL ''SELECT Empleado FROM #tmpProdEmp GROUP BY Empleado ORDER BY Empleado'',''SUM(Amount)'',''ColumnName'',''#tmpProdEmp'','' ORDER BY ColumnName''
END
ELSE BEGIN
	SELECT ''No hay Ordenes, para el filtro que selecciono.'' AS Mensaje
END

DROP TABLE #tmpProdEmp
' 
END
GO
/****** Object:  View [dbo].[PendingOrders_VW]    Script Date: 11/16/2015 14:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PendingOrders_VW]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[PendingOrders_VW] AS

SELECT * 
FROM tblItemTasks IT
WHERE IT.ITS_DTStart IS NOT NULL AND IT.ITS_DTStop IS NULL AND IT.ITS_Status NOT IN (9,3)
AND SUBSTRING(IT.ITE_Nombre,4,3) NOT IN (''004'',''005'',''010'',''060'',''062'',''162'',''699'',''799'',''862'',''899'',''999'',''960'') 	


'
GO
/****** Object:  Table [dbo].[tblScreens]    Script Date: 11/16/2015 14:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblScreens]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblScreens](
	[SCR_ID] [int] IDENTITY(1,1) NOT NULL,
	[SCR_Name] [varchar](50) NULL,
	[SCR_FormName] [varchar](50) NULL,
	[SCR_Description] [varchar](150) NULL,
	[SCR_Year] [varchar](4) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemTasksUserLogin]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateItemTasksUserLogin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE   PROCEDURE [dbo].[UpdateItemTasksUserLogin]
AS 

DECLARE @USER_LOGIN	VARCHAR(50)


/**************************************************************************************************/
DECLARE User_Cursor CURSOR FOR

SELECT DISTINCT USE_Login FROM tblItemTasks

OPEN User_Cursor
/*GET FIRST RECORD INTO VARIABLE*/
FETCH NEXT FROM User_Cursor INTO @USER_LOGIN
WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
BEGIN

	IF(@USER_LOGIN IS NOT NULL)BEGIN
		IF(ISNUMERIC(@USER_LOGIN) = 0 OR @USER_LOGIN = ''.'')BEGIN
			PRINT(''*'' + @USER_LOGIN + ''*'')
			UPDATE tblItemTasks SET USE_Login = NULL WHERE USE_Login = @USER_LOGIN
		END	
	END
	
   FETCH NEXT FROM User_Cursor INTO @USER_LOGIN
 END
/*CLOSE CURSOR*/
CLOSE User_Cursor
DEALLOCATE User_Cursor

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UnidadesMedida]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnidadesMedida]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE   PROCEDURE [dbo].[UnidadesMedida]
  @TYPE AS INT,
  @NAME AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblUnidadesMedida(UNI_Medida)
	SELECT @NAME
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblUnidadesMedida SET UNI_Medida = @NAME WHERE UNI_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblUnidadesMedida WHERE UNI_ID = @ID
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Paises]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paises]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE    PROCEDURE [dbo].[Paises]
  @TYPE AS INT,
  @NAME AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblPaises(PAIS_NOMBRE)
	SELECT @NAME
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblPaises SET PAIS_NOMBRE = @NAME WHERE PAIS_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblPaises WHERE PAIS_ID = @ID
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[TiposMaterial]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TiposMaterial]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE    PROCEDURE [dbo].[TiposMaterial]
  @TYPE AS INT,
  @MATERIALTYPE AS VARCHAR(50) = NULL,
  @DESC AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblTiposMaterial(TIP_Tipo, TIP_Descripcion)
	SELECT @MATERIALTYPE, @DESC
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblTiposMaterial SET TIP_Tipo = @MATERIALTYPE, TIP_Descripcion = @DESC 
	WHERE TIP_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblTiposMaterial WHERE TIP_ID = @ID
END




' 
END
GO
/****** Object:  Trigger [TD_tblSalidas]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblSalidas]'))
EXEC dbo.sp_executesql @statement = N'








CREATE        TRIGGER [dbo].[TD_tblSalidas] ON [dbo].[tblSalidas]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON

    INSERT INTO tblSalidas_History
    SELECT *,''Delete'',GETDATE() FROM DELETED

    SET NOCOUNT OFF
END










'
GO
/****** Object:  Trigger [TI_tblGroups]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TI_tblGroups]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TI_tblGroups] ON [dbo].[tblGroups]
FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON
    
	INSERT INTO tblGroup_Screens(Group_ID, SCR_ID)  
    SELECT I.Group_ID,24 FROM INSERTED I

    SET NOCOUNT OFF
END
'
GO
/****** Object:  Trigger [TD_tblscreens]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblscreens]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TD_tblscreens] ON [dbo].[tblScreens]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	-- Delete Records from tblCategory_Screens
	DELETE tblCategory_Screens
    FROM tblCategory_Screens C, DELETED D
    WHERE C.SCR_ID = D.SCR_ID

	-- Delete Records from tblGroup_Screens
	DELETE tblCategory_Screens
    FROM tblGroup_Screens G, DELETED D
    WHERE G.SCR_ID = D.SCR_ID


    SET NOCOUNT OFF
END
'
GO
/****** Object:  Trigger [TD_tblGroups]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblGroups]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TD_tblGroups] ON [dbo].[tblGroups]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	-- Delete Records from tblCategory_Screens
	DELETE tblGroup_Screens
    FROM tblGroup_Screens G, DELETED D
    WHERE G.Group_ID = D.Group_ID

	-- Delete Records from tblGroup_Screens
	DELETE tblUser_Groups
    FROM tblUser_Groups U, DELETED D
    WHERE U.Group_ID = D.Group_ID


    SET NOCOUNT OFF
END
'
GO
/****** Object:  Trigger [TD_tblEntradas]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblEntradas]'))
EXEC dbo.sp_executesql @statement = N'








CREATE        TRIGGER [dbo].[TD_tblEntradas] ON [dbo].[tblEntradas]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON

    INSERT INTO tblEntradas_History
    SELECT *,''Delete'',GETDATE() FROM DELETED

    SET NOCOUNT OFF
END










'
GO
/****** Object:  Trigger [TD_tblCategories]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TD_tblCategories]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TD_tblCategories] ON [dbo].[tblCategories]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	DELETE tblCategory_Screens
    FROM tblCategory_Screens C, DELETED D
    WHERE C.Category_ID = D.Category_ID

    SET NOCOUNT OFF
END

'
GO
/****** Object:  StoredProcedure [dbo].[Screens]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Screens]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE   PROCEDURE [dbo].[Screens]
  @TYPE AS INT,
  @NAME AS VARCHAR(50) = NULL,
  @FORM AS VARCHAR(50) = NULL,
  @DESC AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblScreens(SCR_Name,SCR_FormName,SCR_Description,SCR_Year)
	SELECT @NAME,@FORM,@DESC,YEAR(GETDATE())
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblScreens SET SCR_Name = @NAME, SCR_FormName = @FORM,
        SCR_Description = @DESC WHERE SCR_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblScreens WHERE SCR_ID = @ID
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Grupos]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Grupos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create  PROCEDURE [dbo].[Grupos]
  @TYPE AS INT,
  @NAME AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblGroups(Group_Name)
	SELECT @NAME
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblGroups SET Group_Name = @NAME WHERE Group_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblGroups WHERE Group_ID = @ID
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetDueDate]    Script Date: 11/16/2015 14:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDueDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  FUNCTION [dbo].[GetDueDate](@BEFOREDAYS AS INT, @INTDUEDATE AS DATE) RETURNS DATE
AS 
BEGIN

DECLARE @DUEDATE AS DATE

SELECT @DUEDATE = DATEADD(DAY,(-1 * (@BEFOREDAYS + dbo.GetNonWorkingDays(CONVERT(DATE, GETDATE()), @INTDUEDATE) ) ), @INTDUEDATE )

RETURN	@DUEDATE
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[PastDueOrdersInTask]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PastDueOrdersInTask]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PastDueOrdersInTask]
(
	@TASK_ID	INT,
	@START INT,
	@END INT
)
AS

	SELECT RIGHT(IT.ITE_Nombre,10) AS ''Order'', O.Ordenada AS Quantity, 
	LEFT(O.Producto,20) AS Product, CONVERT(VARCHAR, O.Interna, 101) AS DueDate, 
	LEFT(CONVERT(VARCHAR, IT.ITS_DTStart,120),16) AS StartDate, LEFT(T.Nombre,12) AS Task,O.Ordenada AS Pieces,
	O.Interna,A.BEFOREDAYS,O.Producto
	INTO #tmpPastDueOrdersInTask
	FROM PendingOrders_VW IT
	INNER JOIN tblTareas T ON IT.TAS_Id = T.Id AND T.Id = @TASK_ID 
	INNER JOIN tblOrdenes O ON O.ITE_Nombre = IT.ITE_Nombre
	INNER JOIN tblProductos P ON O.Producto = P.Nombre 
	INNER JOIN tblAggregateValue A ON A.Task_ID = @TASK_ID AND A.Product_ID = P.ID 

	SELECT *,ROW_NUMBER() OVER (ORDER BY Interna) AS RowNumber 
	INTO #tmpPastDueOrdersInTaskWithRowNumber
	FROM #tmpPastDueOrdersInTask
	WHERE dbo.GetDueDate(BEFOREDAYS, Interna) <= GETDATE()

	SELECT RowNumber,[Order],Quantity,Product,DueDate,StartDate,Task
	FROM #tmpPastDueOrdersInTaskWithRowNumber 
	WHERE RowNumber BETWEEN @START AND @END
	UNION
	SELECT COUNT(*),''Total'',CASE WHEN SUM(Pieces) IS NULL THEN 0 ELSE SUM(Pieces) END,'''','''','''',''''
	FROM #tmpPastDueOrdersInTaskWithRowNumber
	ORDER BY 1
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PastDueOrdersBeforeTask]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PastDueOrdersBeforeTask]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Traer_Ordenes ''07''
CREATE	PROCEDURE [dbo].[PastDueOrdersBeforeTask]
(
	@TASK_ID	INT,
	@TASK_ORDER INT,
	@START INT,
	@END INT
)
AS

	SELECT RIGHT(IT.ITE_Nombre,10) AS ''Order'', O.Ordenada AS Quantity, 
	LEFT(O.Producto,20) AS Product, CONVERT(VARCHAR, O.Interna, 101) AS DueDate, 
	LEFT(CONVERT(VARCHAR, IT.ITS_DTStart,120),16) AS StartDate, LEFT(T.Nombre,12) AS Task,O.Ordenada AS Pieces,
	O.Interna,A.BEFOREDAYS,O.Producto
	INTO #tmpPastDueOrdersBeforeTask
	FROM PendingOrders_VW IT
	INNER JOIN tblTareas T ON IT.TAS_Id = T.Id AND T.Id <> @TASK_ID AND TAS_Order < @TASK_ORDER 
	INNER JOIN tblOrdenes O ON O.ITE_Nombre = IT.ITE_Nombre AND O.PN_Id IS NOT NULL
	INNER JOIN tblProductos P ON O.Producto = P.Nombre 
	INNER JOIN tblAggregateValue A ON A.Task_ID = @TASK_ID AND A.Product_ID = P.ID 


	SELECT *,ROW_NUMBER() OVER (ORDER BY Interna) AS RowNumber 
	INTO #tmpPastDueOrdersBeforeTaskWithRowNumber
	FROM #tmpPastDueOrdersBeforeTask
	WHERE Producto IN (SELECT Product FROM Routing_VW WHERE TaskId = @TASK_ID)
	AND dbo.GetDueDate(BEFOREDAYS, Interna) <= GETDATE()

	SELECT RowNumber,[Order],Quantity,Product,DueDate,StartDate,Task
	FROM #tmpPastDueOrdersBeforeTaskWithRowNumber 
	WHERE RowNumber BETWEEN @START AND @END
	UNION
	SELECT COUNT(*),''Total'',CASE WHEN SUM(Pieces) IS NULL THEN 0 ELSE SUM(Pieces) END,'''','''','''',''''
	FROM #tmpPastDueOrdersBeforeTaskWithRowNumber
	ORDER BY 1' 
END
GO
/****** Object:  StoredProcedure [dbo].[Categories]    Script Date: 11/16/2015 14:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE  PROCEDURE [dbo].[Categories]
  @TYPE AS INT,
  @NAME AS VARCHAR(50) = NULL,
  @ID   AS INT = NULL
AS 

IF (@TYPE = 0) BEGIN
	INSERT INTO tblCategories(Category_Name,Category_Order)
	SELECT @NAME,0
END
ELSE IF (@TYPE = 1) BEGIN
	UPDATE tblCategories SET Category_Name = @NAME WHERE Category_ID = @ID
END
ELSE IF (@TYPE = 2) BEGIN
	DELETE FROM tblCategories WHERE Category_ID = @ID
END


' 
END
GO
