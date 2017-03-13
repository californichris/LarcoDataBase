USE Larco
GO

ALTER TABLE [tblRouting]
ALTER COLUMN [Rou_From] [int] NOT NULL
GO

ALTER TABLE [tblRouting]
ALTER COLUMN [Nombre] [varchar](50) NOT NULL
GO

ALTER TABLE [tblRouting]
ALTER COLUMN [Rou_Code] [varchar](50) NOT NULL
GO

ALTER TABLE [tblRouting]
ALTER COLUMN [Rou_To] [int] NOT NULL
GO

ALTER TABLE [tblRouting]
ADD ProductId [int] NULL
GO

UPDATE tblRouting SET ProductId = P.Id
FROM tblRouting R
INNER JOIN tblProductos P ON R.Nombre = P.Nombre
GO

ALTER TABLE [tblRouting]
ALTER COLUMN ProductId [int] NOT NULL
GO

ALTER TABLE [tblRouting]
ADD CONSTRAINT pk_RouteId PRIMARY KEY (Rou_Id)
GO

ALTER TABLE [tblRouting]  WITH CHECK ADD  CONSTRAINT [FK_Routing_Product] FOREIGN KEY([Nombre])
REFERENCES [tblProductos] ([Nombre])
GO

ALTER TABLE [tblRouting] CHECK CONSTRAINT [FK_Routing_Product]
GO

ALTER TABLE [tblRouting]  WITH CHECK ADD  CONSTRAINT [FK_Routing_ProductId] FOREIGN KEY([ProductId])
REFERENCES [tblProductos] ([Id])
GO

ALTER TABLE [tblRouting] CHECK CONSTRAINT [FK_Routing_ProductId]
GO

-- RUN THIS Separate
CREATE VIEW [RoutingVW] AS
SELECT P.Id AS ProductId,P.Nombre AS ProductName, Rou_From As TaskID 
FROM tblRouting R1
INNER JOIN tblProductos P ON R1.ProductId = P.Id 
UNION 
SELECT P.Id AS ProducId,P.Nombre AS ProductName,Rou_To As TaskID 
FROM tblRouting R2
INNER JOIN tblProductos P ON R2.ProductId = P.Id 
