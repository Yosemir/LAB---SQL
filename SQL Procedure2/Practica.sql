/*Permita ingresar el nombre de un empleado, su fecha de ingreso a la empresa y determine la cantidad de años de permanencia.*/

CREATE PROCEDURE sp_empleado
 @empleado varchar(40),
 @empresa VARCHAR(40),
 @fechaingre VARCHAR(10)
 as 
    BEGIN
    SELECT @empleado as 'Nombre',
     @empresa as 'empresa',
    format (convert(DATETIME, @fechaingre, 103),'dd/MM/yyyy') as 'Fecha de ingreso',
    DATEDIFF(YEAR, convert(DATETIME, @fechaingre, 103), GETDATE()) as 'Cantidad de años'
    END
GO

EXEC sp_empleado @empleado = jose, @empresa = SBS, @fechaingre ='10/02/1990'
go

/*Ingrese un número e imprima el texto " Mensaje de prueba"*/
CREATE PROCEDURE sp_mensaje
@num int = 0,
@inicio int =0
as 

    BEGIN
        WHILE(@inicio < @num)
            BEGIN
                SET @inicio = @inicio +  1
                PRINT 'mensaje de prueba'
            END
    END

GO

EXEC sp_mensaje @num = 2

/*Ingrese 3 números y los permita ordenar de mayor e menor*/

/* Elaborar una vista que permita Visualizar el número de pedidos atendidos por bibliotecario*/



/*Elaborar una vista que permita visualisar: codigo de prestamo, fecha de prestamo, bibliotecario, libro, autor y género.*/

SELECT Prestamos.idPrestamo, Prestamos.fecsalPrestamo,nomBibliotecario, nomAutor, nomGenero
from Prestamos 
INNER JOIN Bibliotecario on Prestamos.Bibliotecario_idBibliotecario = idBibliotecario
INNER JOIN Detalle_Prestamo on Prestamos.idPrestamo = Prestamos_idPrestamo
INNER JOIN Libro on Detalle_Prestamo.Libro_idLibro  =  idLibro
INNER JOIN Autor on Libro.Autor_idAutor = idAutor
INNER JOIN Genero ON Libro.Genero_idGenero = idGenero
 
