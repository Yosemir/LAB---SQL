/*iNNER*/
SELECT * FROM CLIENTE
 INNER JOIN VENTA
 ON CLIENTE.idCliente = VENTA.CLIENTE_idCliente

/*LEFT*/
SELECT * FROM EMPLEADO
LEFT JOIN VENTA
ON EMPLEADO.idEmpleado = VENTA.EMPLEADO_idEmpleado

/*RIGHT*/

SELECT * FROM CLIENTE
RIGHT JOIN VENTA
 ON CLIENTE.idCliente = VENTA.CLIENTE_idCliente

 /*OUTER*/

SELECT EMPLEADO.nombre, EMPLEADO.apellido, CLIENTE.nombre, CLIENTE.apellido
FROM CLIENTE
FULL OUTER JOIN VENTA
ON CLIENTE.idCliente = VENTA.CLIENTE_idCliente

/*Cros*/
