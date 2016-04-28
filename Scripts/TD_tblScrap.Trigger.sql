USE [Larco]
GO
/****** Object:  Trigger [TD_tblScrap]    Script Date: 04/27/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TD_tblScrap] ON [dbo].[tblScrap]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON

    DELETE FROM tblOrdenes
    WHERE ITE_NOMBRE IN (SELECT SCR_NewItem FROM DELETED)   

    SET NOCOUNT OFF
END
GO
