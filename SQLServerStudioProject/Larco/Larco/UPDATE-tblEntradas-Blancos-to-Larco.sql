USE LArcoOld
GO

DECLARE @PROV_ID AS INT
SELECT @PROV_ID = PROV_ID FROM tblProvedores where PROV_Nombre = 'Larco'

PRINT @PROV_ID

UPDATE tblEntradas SET PROV_ID = @PROV_ID WHERE ENT_ID IN (

SELECT DISTINCT ENT_ID FROM tblEntradasDetalle WHERE MAT_ID IN (
SELECT MAT_ID FROM tblMateriales where MAT_Tipo IN (
select TIP_ID from tblTiposMaterial where TIP_Descripcion = '22 Blancos'))

) 