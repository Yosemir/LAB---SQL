/*Poner en uso la BD*/
use AdventureWorks2016
GO
/*Listados de esquemas pertenecientes a esta BD*/
SELECT name from sys.schemas;
GO
/*Ver tablas de la BD*/
SELECT name from sys.tables

/*ver estructura de una tabla especifica*/
EXEC sp_help 'humanResources.Employee'
go

/*Listado de departamento para la empresa*/
SELECT * from HumanResources.Department
GO
/*Vizualizar solo los departamentos que pertenece al grupo marketing y venta*/
SELECT * FROM HumanResources.Department
WHERE HumanResources.Department.GroupName like 'sales and marketing'
GO
/*ver listado de todos los empreados cuyo estado civil es casado*/
SELECT HumanResources.Employee.BusinessEntityID AS 'Codigo de empleado', HumanResources.Employee.MaritalStatus as 'Estado civil' FROM HumanResources.Employee WHERE HumanResources.Employee.MaritalStatus like 'M'

/*Ver listado el codigo de las ordenes de venta y sus respectivos mes y año*/
SELECT Sales.SalesOrderHeader.SalesOrderID as 'Codigo de orden', MONTH(Sales.SalesOrderHeader.OrderDate) as 'Mes', YEAR(Sales.SalesOrderHeader.OrderDate) as 'Año'
FROM Sales.SalesOrderHeader
WHERE (Sales.SalesOrderHeader.OrderDate) = '2013'
go

/*vizualizar la cantidad de odenes de venta del año 2013*/
SELECT COUNT (Sales.SalesOrderHeader.SalesOrderID) as 'Año',
count (sales.SalesOrderHeader.SalesOrderID) as 'Cantidad'
FROM sales.SalesOrderHeader
WHERE year (sales.SalesOrderHeader.OrderDate) =2011
GROUP BY year(sales.SalesOrderHeader.OrderDate)
go

/*visualizar la cantida de venta por mes del año 2011*/

SELECT COUNT (Sales.SalesOrderHeader.SalesOrderID) as 'Año',
DATENAME (MONTH, sales.SalesOrderHeader.OrderDate) as 'Mes',
count (sales.SalesOrderHeader.SalesOrderID) as 'Cantidad'
FROM sales.SalesOrderHeader
WHERE year (sales.SalesOrderHeader.OrderDate) =2011
GROUP BY year(sales.SalesOrderHeader.OrderDate),
DATENAME (MONTH, Sales.SalesOrderHeader.OrderDate)
go

/*CANTIDAD DE EPREADOS POR CARGO*/
SELECT COUNT (HumanResources.Employee.BusinessEntityID) AS 'TOTAL',
HumanResources.Employee.JobTitle AS 'CARGO'
FROM HumanResources.Employee
GROUP BY HumanResources.Employee.JobTitle
ORDER BY COUNT(HumanResources.Employee.BusinessEntityID) DESC
GO
/*Listado de empleados nombre, apellido y cargo*/

SELECT person.FirstName as nombre, person.LastName as apellido, HumanResources.Department.Name as Departamento
from HumanResources.EmployeeDepartmentHistory
INNER join Person.Person
ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GO

/*Muestrame la cantidad de empleado por departamento*/
SELECT COUNT (HumanResources.EmployeeDepartmentHistory.BusinessEntityID) AS 'TOTAL',
HumanResources.Department.name AS departamento
FROM HumanResources.EmployeeDepartmentHistory
INNER JOIN Person.Person
ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Department.Name
GO

/*Muestrame la cantidad de empleados por estado civil en cada departamento*/

SELECT HumanResources.Department.Name as 'Departament',
HumanResources.Employee.MaritalStatus AS 'Estado Civil',
COUNT (HumanResources.Employee.BusinessEntityID) AS 'TOTAL'
FROM HumanResources.Employee
INNER JOIN HumanResources.EmployeeDepartmentHistory
on HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Employee.MaritalStatus, HumanResources.EmployeeDepartmentHistory.DepartmentID,
HumanResources.Department.Name
GO

/*Muestrame el nombre, apellido, departamento, estado civil de empleado*/

SELECT person.FirstName as nombre, person.LastName as apellido, HumanResources.Department.Name as Departamento,
 HumanResources.Employee.MaritalStatus as 'estado civil'
from HumanResources.EmployeeDepartmentHistory
INNER join Person.Person
ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
INNER JOIN HumanResources.Employee
ON HumanResources.Employee.MaritalStatus = HumanResources.Employee.MaritalStatus
GO
SELECT * from Person.Person

/**/


