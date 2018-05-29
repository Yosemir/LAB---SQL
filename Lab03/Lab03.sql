USE AdventureWorks2016
go
SELECT * from Person.Person
GO

CREATE VIEW vw_persona2
as
SELECT FirstName, LastName
FROM Person.Person
WHERE FirstName like 'a%'

SELECT * from vw_persona2

CREATE VIEW vw_persona4
as
SELECT CONCAT(FirstName,' ',LastName) AS Datos
from Person.Person
WHERE LastName like 'A%'

SELECT * FROM vw_persona4