USE Larco
GO

ALTER TABLE [tblGroup_Screens] 
ADD GroupScreenId INT IDENTITY(1,1)

GO

ALTER TABLE [tblGroup_Screens]
ADD CONSTRAINT pk_GroupScreenId PRIMARY KEY (GroupScreenId)

ALTER TABLE [tblGroup_Screens]
ADD CONSTRAINT uc_GroupScreens UNIQUE ([Group_Id],[SCR_ID])

ALTER TABLE [tblGroup_Screens] ADD  CONSTRAINT [DF_GroupScreens_New]  DEFAULT ((0)) FOR [Nuevo]
GO

ALTER TABLE [tblGroup_Screens] ADD  CONSTRAINT [DF_GroupScreens_Edit]  DEFAULT ((0)) FOR [Editar]
GO

ALTER TABLE [tblGroup_Screens] ADD  CONSTRAINT [DF_GroupScreens_Delete]  DEFAULT ((0)) FOR [Borrar]
GO

ALTER TABLE [tblGroup_Screens] ADD  CONSTRAINT [DF_GroupScreens_Buscar]  DEFAULT ((0)) FOR [Buscar]
GO
