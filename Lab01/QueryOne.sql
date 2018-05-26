/*Crear una BD en blanco*/
create DATABASE Hospital;
GO
USE Hospital;
GO

/*Crear tablas*/

/*listado de BD*/
SELECT database_id name FROM sys.databases;
GO 

/*ver listado de tablas de una BD*/
USE AdventureWorks2016
GO
SELECT name from sys.tables;
GO 

/*ver listado de vistas de una BD*/
USE AdventureWorks2016;
GO
SELECT name from sys.views;
GO

/*vizualizar detallada de una BD*/
EXEC sp_helpdb adventureWorks2016;
GO

/*Utilizando snipets*/
-- Create a new database called 'ColegioBD'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'ColegioBD'
)
CREATE DATABASE ColegioBD
GO

/*Eliminar una BD*/
DROP DATABASE Hospital;
GO
/*eliminar la BD adventureWorks*/
USE AdventureWorks2016;
go
DROP DATABASE AdventureWorks2016;
GO
