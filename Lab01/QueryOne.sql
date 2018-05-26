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
