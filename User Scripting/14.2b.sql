DECLARE @ListOfStudents Table (
	[ID] int NULL, 
	[LastName] varchar(100) NULL, 
	[FirstName] varchar(100) NULL, 
	[Username] varchar(100) NULL, 
	[Password] varchar(100) NULL
)

INSERT INTO @ListOfStudents(ID, LastName, FirstName, Username, [Password]) 
SELECT ROW_NUMBER() OVER(ORDER BY (Select 0)), LastName, FirstName, Username, password FROM [NewUsers]

DECLARE @Count INT = 1
DECLARE @RowCount INT

SELECT @RowCount=Count(*) FROM @listOfStudents

DECLARE @LastName VARCHAR(100)
DECLARE @FirstName VARCHAR(100)
DECLARE @Username VARCHAR(100)
DECLARE @Password VARCHAR(100)

WHILE(@Count <= @RowCount)
BEGIN
SET NOCOUNT ON
SELECT @LastName=LastName, @FirstName=FirstName, @Username=Username, @Password=Password FROM @listOfStudents WHERE ID=@Count
IF NOT EXISTS (SELECT name FROM master.sys.databases WHERE name = @Username)
BEGIN

DECLARE @dbFilePath nvarchar(2000) 
DECLARE @dbLogPath nvarchar(2000)
DECLARE @createFolderXP nvarchar(2000) 
DECLARE @domainLogin nvarchar(30) 
DECLARE @prefix nvarchar(200)
DECLARE @dbName nvarchar(1000)

DECLARE @logicalDataName nvarchar(600) 
DECLARE @logicalLogName nvarchar(600) 
DECLARE @dataFileName nvarchar(600) 
DECLARE @logFileName nvarchar(600)

DECLARE @dataSize nvarchar(500) 
DECLARE @dataMaxSize nvarchar(500) 
DECLARE @dataFileGrowth nvarchar(500) 
DECLARE @logSize nvarchar(500) 
DECLARE @logMaxSize nvarchar(500) 
DECLARE @logFileGrowth nvarchar(500)

DECLARE @exeTemp nvarchar(4000)

SET @dbName=@Username
SET @dbFilePath = '/var/opt/mssql/data/'
SET @dbLogPath = '/var/opt/mssql/data/'

SET @dataSize = '8192KB'
SET @dataMaxSize = '2048GB'
SET @dataFileGrowth = '65536KB'

SET @logSize = '8192KB'
SET @logMaxSize = '2048GB'
SET @logFileGrowth = '65536KB'

BEGIN
PRINT('Begin create database')
SET @LogicalDataName=@DBName + '_dat'
SET @DataFileName= @dbFilePath + @DBName + '.mdf'

SET @LogicalLogName=@DBName + '_log'
SET @LogFileName= @dbLogPath + @DBName + '.ldf'

SET @exeTemp = 'CREATE DATABASE ' + @DBName + ' ON ('
+ 'NAME = [' + @LogicalDataName + '], '
+ 'FILENAME = [' + @DataFileName + '], '
+ 'SIZE = ' + @DataSize + ', '
+ 'MAXSIZE = ' + @DataMaxSize + ', '
+ 'FILEGROWTH = ' + @DataFileGrowth + ') '
+ 'LOG ON ('
+ 'NAME = [' + @LogicalLogName + '], '
+ 'FILENAME = [' + @LogFileName + '], '
+ 'SIZE = ' + @LogSize + ', '
+ 'MAXSIZE = ' + @LogMaxSize + ', '
+ 'FILEGROWTH = ' + @LogFileGrowth + ') ' 
PRINT('Creating database ' + @DBName)
PRINT(@exeTemp) EXEC (@exeTemp)
END
END
SET @Count += 1
END

DECLARE @_Login VARCHAR(100)
DECLARE @ExecTemp nvarchar(1000)
DECLARE @_Password nvarchar(100), @_DefaultDatabase nvarchar(100)

WHILE(@Count <= @RowCount)
BEGIN
SET NOCOUNT ON
SELECT @LastName=LastName, @FirstName=FirstName, @Username=Username, @Password=Password FROM @listOfStudents WHERE ID=@Count
IF SUSER_ID(@Username) IS NULL
BEGIN

SET @_Login = @Username
SET @_Password = @Password
SET @_DefaultDatabase = @Username

BEGIN
SET @ExecTemp = 'CREATE LOGIN ' + @_Login + ' WITH PASSWORD = ''' +
@_Password + ''', DEFAULT_DATABASE = ' + @_DefaultDatabase PRINT(@ExecTemp)
EXEC (@ExecTemp)
END

END
SET @Count += 1
END

SET @Count = 1

DECLARE @_DBName VARCHAR(100)

WHILE(@Count <= @RowCount)
BEGIN
SET NOCOUNT ON
SELECT @LastName=LastName, @FirstName=FirstName, @Username=Username, @Password=Password FROM @listOfStudents WHERE ID=@Count
IF USER_ID(@Username) IS NULL
BEGIN

SET @_DBName = @Username
SET @_Login = @Username

SET @exeTemp='USE ' + @_DBName + ' CREATE USER [' + @_Login + '] FOR LOGIN [' + @_Login + ']'
EXEC (@exeTemp)

END
SET @Count += 1
END