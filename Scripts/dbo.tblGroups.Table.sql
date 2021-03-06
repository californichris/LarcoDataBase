USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGroups](
	[Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name] [varchar](50) NOT NULL,
	[Priority] [int] NULL,
 CONSTRAINT [pk_GroupId] PRIMARY KEY CLUSTERED 
(
	[Group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uc_GroupName] UNIQUE NONCLUSTERED 
(
	[Group_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TD_tblGroups] ON [dbo].[tblGroups]
FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
    
	-- Delete Records from tblCategory_Screens
	DELETE tblGroup_Screens
    FROM tblGroup_Screens G, DELETED D
    WHERE G.Group_ID = D.Group_ID

	-- Delete Records from tblGroup_Screens
	DELETE tblUser_Groups
    FROM tblUser_Groups U, DELETED D
    WHERE U.Group_ID = D.Group_ID


    SET NOCOUNT OFF
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TI_tblGroups] ON [dbo].[tblGroups]
FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON
    
	INSERT INTO tblGroup_Screens(Group_ID, SCR_ID)  
    SELECT I.Group_ID,24 FROM INSERTED I

    SET NOCOUNT OFF
END

GO
