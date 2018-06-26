use dbLibrary

SELECT tituloLibro, idLibro, nomGenero
from Libro INNER join Genero on Libro.Genero_idGenero= Genero.idGenero
go



SELECT nomPais, COUNT(Libro.Genero_idGenero), nomGenero
from Libro INNER JOIN Pais on Pais_idPais = idPais INNER JOIN Genero on Genero_idGenero = idGenero
GROUP by nomPais, nomGenero
go

SELECT *
from Prestamos


select fecsalPrestamo, CONCAT(nomBibliotecario,' ',apeBibliotecario), tituloLibro, nomCliente
from Prestamos
    INNER JOIN Bibliotecario on Prestamos.Bibliotecario_idBibliotecario = Bibliotecario.idBibliotecario
    INNER JOIN Detalle_Prestamo ON Prestamos.idPrestamo = Prestamos_idPrestamo
    INNER JOIN Libro on Detalle_Prestamo.Libro_idLibro = Libro.idLibro
    INNER JOIN Cliente on Prestamos.Cliente_idCliente = Cliente.idCliente

/*Stored Procedure*/
/*Todas las bases de datos*/
EXEC sp_databases
go

EXEC sp_stored_procedures
go

/* Listar tablas y vistas de una base de datos activa*/

EXEC sp_tables
go

/*Primer Stored Procedure*/
create PROCEDURE sp_suma1
    /*Obligatorio*/
    @varuno int =1,
    @vardos int =0,
    @suma int =0
AS
/*Obligatorio*/
BEGIN
    /*Obligatorio*/
    SET @suma = @varuno + @vardos
    select @suma
END /*Obligatorio*/
GO
/*Ejecutar el Stored Procedure*/
EXEC sp_suma1
go

/*Modificar */
ALTER PROCEDURE sp_suma1
    /*Obligatorio*/
    @varuno int =5,
    @vardos int =20,
    @suma int =0
AS /*Obligatorio*/
BEGIN
    /*Obligatorio*/
    SET @suma = @varuno * @vardos
    select @suma as resultado
END /*Obligatorio*/
GO
/*Ejecutar*/
EXEC sp_multi
go
/*Eliminar Stored Procedure*/

DROP PROCEDURE sp_multi
go

/*Elaborar un SP que permita ingresar dos numeros y devuelva la sumatoria de ellos*/

create PROCEDURE sp_sum
    @varuno int,
    @vardos int,
    @suma int =0
AS
BEGIN
    SET @suma = @varuno + @vardos
    select @suma
END 
GO
/*Sumar dos numeros */
EXEC sp_sum @varuno = 30, @vardos = 60 
go
/*Multiplicar dos numeros*/
create PROCEDURE sp_multi
    @varuno int,
    @vardos int,
    @suma int =0
AS
BEGIN
    SET @suma = @varuno * @vardos
    select @suma
END 
GO
/*Multiplicar*/
EXEC sp_multi @varuno = 30, @vardos = 60 
go

/*Elaborar un SP que permita ingresar dos numeros y devolver el mayor de ellos*/
CREATE PROCEDURE sp_comparar
    @numuno INT,
    @numdos INT
AS
BEGIN
    IF @numuno > @numdos
select @numuno as 'numero mayor'
ELSE
select @numdos as 'numero mayor'
END
GO
/*Comparando numeros*/
EXEC sp_comparar @numuno = 50, @numdos = 50
go

/*dividir*/

/*Comparar si son iguales*/
ALTER PROCEDURE sp_iguales
    @numuno INT,
    @numdos INT
AS
BEGIN
    IF @numuno = @numdos 
select  @numuno 'son iguales'
ELSE
    IF @numuno > @numdos
select @numuno as 'numero mayor'
ELSE
select @numdos as 'numero mayor'
    IF @numuno < @numdos
select @numuno as 'numero menor'
ELSE
select @numdos as 'numero menor'
END
GO

EXEC sp_iguales @numuno = 20 , @numdos = 30
go

/*Elaborar un SP que permita enumerar una debida cantidad de numeros*/

create PROCEDURE sp_listar
 @num INT,
 @inicio INT= 0
 as 
    BEGIN
        WHILE(@inicio < @num)
            BEGIN
                SET @inicio = @inicio + 1 
                PRINT @inicio
            END
    END
GO

EXEC sp_listar @num = 100
go

/*Elaborar un SP que permita repétir el mensaje "retrocedes numca, rendirse jamas" de acuerdo a un numero que ha sido ingresado*/

ALTER PROCEDURE sp_repetir
 @num INT,
 @inicio INT= 0
 as 
    BEGIN
        WHILE(@inicio < @num)
            BEGIN
                SET @inicio = @inicio +  1
                PRINT 'retrocedes numca, rendirse jamas'
            END
    END
GO


EXEC sp_repetir @num = 10

go
/*Elaborar un SP que permita ingresar un monbre y devuelva un mensaje de saludo*/

CREATE PROCEDURE sp_saludo
 @nombre varchar(40)
 as 
    BEGIN
        PRINT 'Hola ' + @nombre
    END
GO


EXEC sp_saludo @nombre = 
go
/*Elaborar un SP que permita ingresar un nombre y una fecha de nacimiento*/


CREATE PROCEDURE sp_fecha
 @nombre varchar(40),
 @fecha Date
 as 
    BEGIN
    SELECT @nombre as 'Nombre', @fecha as 'Fecha'
    END
GO


EXEC sp_fecha @nombre = Manuel, @fecha = '30/12/1999'


/*Como ver la configuracion de idioma del servidor*/
select @@LANGUAGE as lenguaje
 

 /*Ver formato de fecha deacuerdo al idioma*/

 EXEC sp_helplanguage 
 go
/*Elaborar un SP que permita ingresar un nombre y fecha de nacimiento en formato dia/mes/año*/

ALTER PROCEDURE sp_fechas
 @nombre varchar(40),
 @fecha VARCHAR(10)
 as 
    BEGIN
    SELECT @nombre as 'Nombre',
    format (convert(DATETIME, @fecha, 103),'dd/MM/yyyy') as fecha
    END
GO
EXEC sp_fechas @nombre = manuel, @fecha = '10/02/1999'
go
/*Elaborar un sp que permita ingresar un nombre, fecha de nacimineto y que devuelva los mismos datos con la edad*/


CREATE PROCEDURE sp_edad
 @nombre varchar(40),
 @fecha VARCHAR(10)
 as 
    BEGIN
    SELECT @nombre as 'Nombre',
    format (convert(DATETIME, @fecha, 103),'dd/MM/yyyy') as fecha,
    DATEDIFF(YEAR, convert(DATETIME, @fecha, 103), GETDATE()) as edad
    END
GO

EXEC sp_edad @nombre = manuel, @fecha = '20/01/1999'


/*Permita ingresar */



