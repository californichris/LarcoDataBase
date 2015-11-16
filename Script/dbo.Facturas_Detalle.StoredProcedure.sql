USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[Facturas_Detalle]    Script Date: 11/16/2015 14:43:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facturas_Detalle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Facturas_Detalle]
GO
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
