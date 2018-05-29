USE adventureWorks2016;
GO

SELECT * FROM person.address
WHERE year(ModifiedDate)='2014' AND
month (ModifiedDate)='01' AND
city = 'beaverton'

/*Direcciones que comience con la letra B*/
SELECT * FROM Person.Address
WHERE AddressLine2 like 'B%'
GO
SELECT * FROM Person.Person
WHERE LastName like 'Miller' and PersonType ='in'
GO


/*Not*/
SELECT * FROM HumanResources.Employee WHERE not Gender='F'
GO

/*IN*/
SELECT businessEntityID,FirstName, LastName
FROM Person.Person
WHERE FirstName in ('Michael')
GO

/*AND*/

SELECT * FROM HumanResources.Employee WHERE BusinessEntityID >= '10' AND BusinessEntityID <='20'
GO














SELECT  BusinessEntityID, jobTitle FROM HumanResources.Employee  WHERE BusinessEntityID >= '10' AND BusinessEntityID <='20'
OR JobTitle like 'r%'
GO