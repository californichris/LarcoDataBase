USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateItemTasksUserLogin]
AS 

DECLARE @USER_LOGIN	VARCHAR(50)


/**************************************************************************************************/
DECLARE User_Cursor CURSOR FOR

SELECT DISTINCT USE_Login FROM tblItemTasks

OPEN User_Cursor
/*GET FIRST RECORD INTO VARIABLE*/
FETCH NEXT FROM User_Cursor INTO @USER_LOGIN
WHILE @@FETCH_STATUS = 0 /*do while not end of cursor*/
BEGIN

	IF(@USER_LOGIN IS NOT NULL)BEGIN
		IF(ISNUMERIC(@USER_LOGIN) = 0 OR @USER_LOGIN = '.')BEGIN
			PRINT('*' + @USER_LOGIN + '*')
			UPDATE tblItemTasks SET USE_Login = NULL WHERE USE_Login = @USER_LOGIN
		END	
	END
	
   FETCH NEXT FROM User_Cursor INTO @USER_LOGIN
 END
/*CLOSE CURSOR*/
CLOSE User_Cursor
DEALLOCATE User_Cursor


GO
