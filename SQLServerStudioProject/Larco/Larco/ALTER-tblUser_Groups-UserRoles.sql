USE Larco
GO

ALTER TABLE [tblUser_Groups] 
ADD UserGroupId INT IDENTITY(1,1)

GO

ALTER TABLE [tblUser_Groups]
ALTER COLUMN [USE_ID] int NOT NULL

ALTER TABLE [tblUser_Groups]
ALTER COLUMN [Group_ID] int NOT NULL
GO

ALTER TABLE [tblUser_Groups]
ADD CONSTRAINT pk_UserGroupId PRIMARY KEY (UserGroupId)
GO

ALTER TABLE [tblUser_Groups]
ADD CONSTRAINT uc_UserGroup UNIQUE ([USE_ID],[Group_ID])
GO