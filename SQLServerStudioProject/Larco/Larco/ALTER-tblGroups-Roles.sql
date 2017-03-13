USE Larco
Go

ALTER TABLE tblGroups
ADD CONSTRAINT pk_GroupId PRIMARY KEY (Group_Id)
GO

ALTER TABLE tblGroups
ALTER COLUMN Group_Name varchar(50) NOT NULL
GO

ALTER TABLE tblGroups
ADD CONSTRAINT uc_GroupName UNIQUE (Group_Name)
GO

ALTER TABLE tblGroups
ADD [Priority] int NULL
GO