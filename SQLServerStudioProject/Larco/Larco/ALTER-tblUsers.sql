 use Larco
 
 select * from tblUsers where USE_Login = '33'
 
 -- Talk to Daria and tell her thatone of the 2 users Cecilia varela has 
 -- will be deleted and that here password will propably need to be updated
 
 delete from tblUsers where USE_ID = (select top 1 USE_ID from tblUsers where USE_Login = '33')
 
 
ALTER TABLE tblUsers
ADD CONSTRAINT pk_UserId PRIMARY KEY (USE_ID)

ALTER TABLE tblUsers
ALTER COLUMN USE_LOGIN varchar(50) NOT NULL

ALTER TABLE tblUsers
ALTER COLUMN USE_PASSWORD varchar(50) NOT NULL

ALTER TABLE tblUsers
ALTER COLUMN USE_Name varchar(150) NOT NULL

ALTER TABLE tblUsers
ADD CONSTRAINT uc_UserLogin UNIQUE (USE_Login)

ALTER TABLE tblUsers
ADD CONSTRAINT uc_UserName UNIQUE (USE_Name)


select use_name,COUNT(*) from tblUsers group by use_name



 