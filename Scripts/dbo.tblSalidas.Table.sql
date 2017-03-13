USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSalidas](
	[SAL_ID] [int] IDENTITY(1,1) NOT NULL,
	[SAL_Fecha] [datetime] NULL,
	[SAL_Orden] [varchar](50) NULL,
	[SAL_Solicitado] [int] NULL,
	[USE_ID] [int] NULL,
 CONSTRAINT [pk_SalidasId] PRIMARY KEY CLUSTERED 
(
	[SAL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE        TRIGGER [dbo].[TD_tblSalidas] ON [dbo].[tblSalidas]
AFTER DELETE
AS 
BEGIN
    SET NOCOUNT ON

    INSERT INTO tblSalidas_History
    SELECT *,'Delete',GETDATE() FROM DELETED

    SET NOCOUNT OFF
END











GO
