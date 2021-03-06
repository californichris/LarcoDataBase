USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--exec EntradasSalidasAlmacen 'Entradas','12/11/2007','12/11/2007 23:59:59.99',0,''


CREATE       PROCEDURE [dbo].[MaterialesEscasos]
    @TYPE AS VARCHAR(100),
    @WHERE AS VARCHAR(8000),
    @VALOR AS VARCHAR(25)
AS

DECLARE @SQL AS VARCHAR(8000)

IF (@TYPE = 'Menor a Cantidad Ideal') BEGIN
	SET @SQL = 'SELECT MAT_Numero AS [Material ID],
		   MAT_Descripcion AS [Descripcion], MAT_Cantidad AS [Existencia],
		   MAT_Minimo AS [Minima], MAT_Maximo AS [Maxima], MAT_Stock AS [Ideal] 
		   FROM tblMateriales M WHERE MAT_Cantidad < MAT_Stock '

END
ELSE IF (@TYPE = 'Menor a Cantidad Minima') BEGIN
	SET @SQL = 'SELECT MAT_Numero AS [Material ID],
		   MAT_Descripcion AS [Descripcion], MAT_Cantidad AS [Existencia],
		   MAT_Minimo AS [Minima], MAT_Maximo AS [Maxima], MAT_Stock AS [Ideal] 
		   FROM tblMateriales M WHERE MAT_Cantidad < MAT_Minimo '
END
ELSE BEGIN -- Menor a Valor Especifico
	SET @SQL = 'SELECT MAT_Numero AS [Material ID],
		   MAT_Descripcion AS [Descripcion], MAT_Cantidad AS [Existencia],
		   MAT_Minimo AS [Minima], MAT_Maximo AS [Maxima], MAT_Stock AS [Ideal] 
		   FROM tblMateriales M WHERE MAT_Cantidad < ' + @VALOR
END

PRINT(@SQL + @WHERE)
EXECUTE(@SQL + @WHERE)





GO
