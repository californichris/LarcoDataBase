-- CREATE-WebUser.sql
-- CREATE-PageConfigTables.sql
-- ALTER-tblUsers.sql
-- ALTER-tblGroups-Roles.sql
-- ALTER-tblScreens-Modules.sql
-- EXPORT-tblScreens-Modules.sql from current db to larco db
-- ALTER-tblGroup_Screens-RoleModules.sql
-- ALTER-tblUser_Groups-UserRoles.sql

-- ALTER-tblProvedores.sql
-- ALTER-tblPaises.sql
-- ALTER-tblEntradas.sql
-- ALTER-tblEntradasDetalle

--Export config Provedores,Paises,Entradas,Materiales,EntradasDetalles

-- don't forget to fix problem with orfan materials in entradasdetalle y salidasdetalle

-- ALTER-tblSalidas.sql
-- ALTER-tblSalidasDetalle

-- update config of Materiales, Entradas(default values)

-- create views [ExistenciaMateriales_VW] and [CostosMateriales_VW]

-- Also Update tblEntradas to make required fields not null check alter-tblEntradasDetalle
-- Also update all trigger from tblEntradas, tblEntradasDetalle, tblEntradasSalidas, tblSalidas, tblSalidasDetalle

-- UPDATE-tblEntradas-Blancos-to-Larco.sql

-- ALTER-tblEntradasSalidas.sql 

-- start from here then delete this comment
-- ALTER-tblMateriales.sql

-- ALTER-tblClientes.sql
-- ALTER-tblEmpleados.sql
-- ALTER-tblTareas.sql
-- ALTER_tblProductos.sql
-- ALTER-tblRouting.sql
-- ALTER-tblAggregateValue.sql
-- ALTER-tblOrdenes.sql
-- ALTER-tblItemTasks.sql
-- ALTER-tblItems.sql
-- ALTER-tblStock.sql
-- ALTER-Ventas.sql
-- ALTER-tblMergeOrdenes.sql
-- ALTER-tblPlano.sql

-- EXPORT Page config from all screens 