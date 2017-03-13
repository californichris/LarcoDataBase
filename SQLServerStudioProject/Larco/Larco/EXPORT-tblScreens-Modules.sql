USE Larco
GO

DECLARE @SCR_ID AS INT
DECLARE @SCR_Name AS VARCHAR(50)
DECLARE @SCR_FormName AS VARCHAR(50)
DECLARE @SCR_Description AS VARCHAR(150)
DECLARE @SCR_Year AS VARCHAR(4)
DECLARE @URL AS VARCHAR(100)
DECLARE @ModuleOrder AS INT
DECLARE @ParentModule AS INT

DECLARE @PARENT_SCREEN_NAME AS VARCHAR(50)

PRINT 'USE Larco'
PRINT 'GO'

DECLARE Screens_Cursor CURSOR FOR

	SELECT [SCR_ID],[SCR_Name],[SCR_FormName],[SCR_Description],
	[SCR_Year],[URL],[ModuleOrder],[ParentModule]  
	FROM [tblScreens] ORDER BY [ParentModule]

OPEN Screens_Cursor
FETCH NEXT FROM Screens_Cursor INTO @SCR_ID, @SCR_Name,@SCR_FormName,@SCR_Description,@SCR_Year,@URL,@ModuleOrder,@ParentModule
WHILE @@FETCH_STATUS = 0 
BEGIN

		IF (@ParentModule IS NOT NULL) BEGIN
			SELECT TOP 1 @PARENT_SCREEN_NAME = [SCR_Name] FROM [tblScreens] WHERE [SCR_ID] = @ParentModule
			PRINT 'DECLARE @PARENTMODULE_ID AS INT'
			PRINT 'SET @PARENTMODULE_ID = (SELECT TOP 1 SCR_ID FROM [tblScreens] WHERE [SCR_Name] = ''' + @PARENT_SCREEN_NAME + ''' AND [ParentModule] IS NULL)'
		END 

		PRINT ''
		PRINT 'IF EXISTS (SELECT [SCR_ID] FROM [tblScreens] WHERE [SCR_Name] = ''' + @SCR_Name + ''' AND [SCR_FormName] = ''' + @SCR_FormName + ''') BEGIN'
		PRINT '	UPDATE [tblScreens]'
		PRINT '	SET [SCR_Name] = ''' + @SCR_Name + ''''
		PRINT '	   ,[SCR_FormName] = ''' + @SCR_FormName + ''''
		PRINT '	   ,[SCR_Description] = ''' + CASE WHEN @SCR_Description IS NULL THEN '' ELSE @SCR_Description END + ''''
		PRINT '	   ,[SCR_Year] = ''' + @SCR_Year + ''''
		PRINT '	   ,[URL] = ''' + @URL + ''''
		PRINT '	   ,[ModuleOrder] = ' + CAST(@ModuleOrder AS VARCHAR(10)) + ''
		PRINT '	   ,[ParentModule] = ' + CASE WHEN @ParentModule IS NULL THEN 'NULL' ELSE '@PARENTMODULE_ID' END + ''
		PRINT ' WHERE [SCR_ID] = ' + CAST(@SCR_ID AS VARCHAR(10))
		PRINT 'END' 
		PRINT 'ELSE BEGIN'
		PRINT '	INSERT INTO [tblScreens]([SCR_Name], [SCR_FormName],[SCR_Description],[SCR_Year],[URL],[ModuleOrder],[ParentModule])'
		PRINT '	VALUES(''' + @SCR_Name + ''', ''' + @SCR_FormName + ''',''' + 
				CASE WHEN @SCR_Description IS NULL THEN '' ELSE @SCR_Description END + 
				''',''' + @SCR_Year + ''', ''' + @URL + ''',' + 
				CAST(@ModuleOrder AS VARCHAR(10)) + ',' + 
				CASE WHEN @ParentModule IS NULL THEN 'NULL' ELSE '@PARENTMODULE_ID' END + ')'
		PRINT 'END' 	
		PRINT 'GO'

   FETCH NEXT FROM Screens_Cursor INTO @SCR_ID, @SCR_Name,@SCR_FormName,@SCR_Description,@SCR_Year,@URL,@ModuleOrder,@ParentModule
END
CLOSE Screens_Cursor
DEALLOCATE Screens_Cursor

PRINT 'GO'


