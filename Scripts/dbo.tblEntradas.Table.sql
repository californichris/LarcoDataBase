USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
	[ENT_Desp] [int] NULL,
 CONSTRAINT [pk_EntradasId] PRIMARY KEY CLUSTERED 
(
	[ENT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblEntradas]  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Pais] FOREIGN KEY([ENT_PaisOrigen])
REFERENCES [dbo].[tblPaises] ([PAIS_ID])
GO
ALTER TABLE [dbo].[tblEntradas] CHECK CONSTRAINT [FK_Entradas_Pais]
GO
ALTER TABLE [dbo].[tblEntradas]  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Provedores] FOREIGN KEY([PROV_ID])
REFERENCES [dbo].[tblProvedores] ([PROV_ID])
GO
ALTER TABLE [dbo].[tblEntradas] CHECK CONSTRAINT [FK_Entradas_Provedores]
GO
ALTER TABLE [dbo].[tblEntradas]  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Users] FOREIGN KEY([USE_ID])
REFERENCES [dbo].[tblUsers] ([USE_ID])
GO
ALTER TABLE [dbo].[tblEntradas] CHECK CONSTRAINT [FK_Entradas_Users]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE        TRIGGER [dbo].[TD_tblEntradas] ON [dbo].[tblEntradas]
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON

    INSERT INTO tblEntradas_History
    SELECT *,'Delete',GETDATE() FROM DELETED

    SET NOCOUNT OFF
END











GO
