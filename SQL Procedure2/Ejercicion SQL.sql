/*vizualisar los registros de la tabla genero*/
SELECT * from Genero
go

/*crear un sp que permita listar los registros de la tabla genero*/

create PROCEDURE sp_listargenero
as 
BEGIN
 SELECT * from Genero
END
GO

EXEC sp_listargenero
go
/*Listar datos de la tabla cliente*/

create PROCEDURE sp_cliente
AS
BEGIN
select *from cliente
END
GO

EXEC sp_cliente
go

/*crear un sp que permita listar los clientes ordenados por la columna sexo  de forma ascendente*/
create PROCEDURE sp_clientesex
AS
BEGIN
SELECT * FROM Cliente ORDER by Cliente.sexoCliente ASC
END
GO

EXEC sp_clientesex
go

/*crear un sp que permita mostrar el listado de cliente de acuerdo a la letra del sexo indicado*/

create PROCEDURE sp_orsex
@var VARCHAR (1)
AS
BEGIN
SELECT * from Cliente WHERE sexoCliente = @var
END
GO

EXEC sp_orsex @var = m
go

/*crear un sp que se vea completo el nombre del sexo y que comvierta*/
create PROCEDURE sp_orsexo
@var VARCHAR (1)
AS
BEGIN
SELECT CONCAT(nomCliente,' ',apeCliente) as 'nombre y apellido', dnicliente,
sexo = case 
when sexoCliente = 'f' then 'Femenino' 
when sexoCliente = 'm' then 'Masculino' 
END
from Cliente WHERE sexoCliente = @var
END
GO


EXEC sp_orsexo @var = m
go
/*crear un sp que permita ingresar registros a la tabla genero*/
create PROCEDURE sp_insertar
@var VARCHAR(4),
@nombre VARCHAR(max)
AS
BEGIN
INSERT into Genero(
    idGenero,nomGenero)
    VALUES
    (@var,@nombre)
END
GO

EXEC sp_insertar @var = '9', @nombre = 'Drama'
go


/*elaborar un sp que permita validar el codigo antes de ingresar un registro*/
CREATE PROCEDURE sp_error
@var int,
@nombre VARCHAR(max)
AS
BEGIN
    IF(select idGenero from Genero where idGenero = @var)
    is NOT NULL
    PRINT 'El codigo ya existe'
    ELSE
    INSERT into Genero(
        idGenero,nomGenero)
    VALUES
        (@var,@nombre)
END
GO

EXEC sp_error @var = 6, @nombre = asdsad
go


/*elaborar un sp que permita validar el codigo y nombre antes de ingresar un registro*/
CREATE PROCEDURE sp_errornom
@var int,
@nombre VARCHAR(max)
AS
BEGIN
    IF(select idGenero from Genero where idGenero = @var)
    is NOT NULL
    PRINT 'El codigo ya existe'
    IF(select nomGenero from Genero where nomGenero = @nombre) is not NULL
    PRINT 'Ya existe el genero'
    ELSE
    INSERT into Genero(
        idGenero,nomGenero)
    VALUES
        (@var,@nombre)
END
GO

EXEC sp_errornom @var =10, @nombre = 'infantil'
go

/*agregar y listar */
CREATE PROCEDURE sp_reglist
@var int,
@nombre VARCHAR(max)
AS
BEGIN
    IF(select idGenero from Genero where idGenero = @var)
    is NOT NULL
    PRINT 'El codigo ya existe'
    IF(select nomGenero from Genero where nomGenero = @nombre)
     is not NULL
    PRINT 'Ya existe el genero'
    ELSE
    INSERT into Genero(
        idGenero,nomGenero)
    VALUES
        (@var,@nombre);
        select * FROM Genero
END
GO

/*Como eliminar registro*/
create PROCEDURE sp_eliminar
@var VARCHAR (4)
AS
BEGIN
delete from Genero
where idGenero = @var
END
GO


EXEC sp_eliminar @var = 10
select * from Genero
GO

/*Si el codigo existe se elimina y si no existe no se puede eliminar*/
alter PROCEDURE sp_prueba2
@var int
AS
BEGIN
IF(select idGenero from Genero where idGenero = @var)
    is NULL
    PRINT 'No se puede eliminar'
    ELSE
delete from Genero
where idGenero = @var
select * from Genero
END
GO

EXEC sp_prueba2 @var = 9