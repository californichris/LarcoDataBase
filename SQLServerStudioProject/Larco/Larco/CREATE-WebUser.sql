USE master;
GO

CREATE LOGIN LarcoWebUser 
    WITH PASSWORD = 'Larco.App-WebUser2016';
GO

-----------------------------------------------------------------------------------------


USE Larco;
GO
-- Creates a database user for the login created above.
CREATE USER LarcoWebUser FOR LOGIN LarcoWebUser;
GO


USE Larco
GO

exec sp_addrolemember db_datareader, LarcoWebUser 
GO
exec sp_addrolemember db_datawriter, LarcoWebUser 
GO