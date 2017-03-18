USE LarcoOld
GO

ALTER TABLE tblMateriales
ADD CONSTRAINT pk_MaterialesId PRIMARY KEY (MAT_ID)
GO

update tblMateriales set MAT_Descripcion = 'Vacio 1' where MAT_ID = 174
update tblMateriales set MAT_Descripcion = 'Vacio 2' where MAT_ID = 305
update tblMateriales set MAT_Descripcion = 'Vacio 3' where MAT_ID = 1397
update tblMateriales set MAT_Descripcion = 'Vacio 4' where MAT_ID = 1406
update tblMateriales set MAT_Descripcion = 'Vacio 5' where MAT_ID = 1685
update tblMateriales set MAT_Descripcion = 'Vacio 6' where MAT_ID = 871

update tblMateriales set MAT_Descripcion = 'Accesorio Portaherramienta KLM4615IP Kennametal # 1867333 - 2' where MAT_ID = 154

update tblMateriales set MAT_Descripcion = 'Aceite  TEMPO  - 2' where MAT_ID = 686

update tblMateriales set MAT_Descripcion = 'Cortador de Carbide de 7/16 4 filos doble - 2' where MAT_ID = 825

update tblMateriales set MAT_Descripcion = 'Machuelo M8 X 1.25 - 2' where MAT_ID = 1850


GO

ALTER TABLE tblMateriales
ADD CONSTRAINT uc_MaterialDescripcion UNIQUE ([MAT_Descripcion])
GO


/*
select MAT_Descripcion, count(*) from tblMateriales group by MAT_Descripcion order by count(*) desc

select * from tblMateriales where MAT_Descripcion in ('',
'Accesorio Portaherramienta KLM4615IP Kennametal # 1867333',
'Machuelo M8 X 1.25',
'Aceite  TEMPO ', 
'Cortador de Carbide de 7/16 4 filos doble ')
order by MAT_Descripcion,MAT_Fecha
*/
