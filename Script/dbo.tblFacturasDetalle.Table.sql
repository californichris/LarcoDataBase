USE [Larco]
GO
/****** Object:  Table [dbo].[tblFacturasDetalle]    Script Date: 11/16/2015 14:43:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblFacturasDetalle]') AND type in (N'U'))
DROP TABLE [dbo].[tblFacturasDetalle]
GO
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
