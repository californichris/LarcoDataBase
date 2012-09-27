USE [Larco]
GO
/****** Object:  Trigger [dbo].[TD_tblScrap]    Script Date: 09/06/2012 22:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TD_tblScrap] ON [dbo].[tblScrap]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON

    DELETE FROM tblOrdenes
    WHERE ITE_NOMBRE IN (SELECT SCR_NewItem FROM DELETED)   

    SET NOCOUNT OFF
END
