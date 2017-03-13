USE Larco
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblOrdenes]') AND name = N'uc_ITENombre')
ALTER TABLE [dbo].[tblOrdenes] DROP CONSTRAINT [uc_ITENombre]
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblOrdenes]') AND name = N'INX_ITE_Nombre')
DROP INDEX [INX_ITE_Nombre] ON [dbo].[tblOrdenes] WITH ( ONLINE = OFF )
GO


ALTER TABLE [tblOrdenes]
ALTER COLUMN [ITE_Nombre] [varchar](50) NOT NULL
GO


ALTER TABLE [dbo].[tblOrdenes] ADD  CONSTRAINT [uc_ITENombre] UNIQUE NONCLUSTERED 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [INX_ITE_Nombre] ON [dbo].[tblOrdenes] 
(
	[ITE_Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO



