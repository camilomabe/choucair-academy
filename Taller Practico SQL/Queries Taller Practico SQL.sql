CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);


CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);


INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');



INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


--5.	Lista los nombres de los fabricantes ordenados de forma descendente.
	SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE DESC;

--6.	Lista los nombres de los productos ordenados de manera Ascendente.
	SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE ASC;
	
--7.	Lista el código de los fabricantes que tienen productos en la tabla producto,
--		mostrando los códigos sin repetición.
	SELECT DISTINCT CODIGO_FABRICANTE FROM PRODUCTO;

--8.	Traer los 3 productos que tienen menor precio.
	SELECT * FROM PRODUCTO ORDER BY PRODUCTO.PRECIO ASC LIMIT 3;

--9.	Traer los cinco productos de mayor precio.
	SELECT * FROM PRODUCTO ORDER BY PRODUCTO.PRECIO DESC LIMIT 5;
	
--10.	Realizar la inserción de tres nuevos productos.
	INSERT INTO producto VALUES(12, 'Memoria RAM DDR4 16GB', 230, 6),
							(13, 'Disco SSD 2 TB', 300.99, 4),
							(14, 'Portátil Legion 5 15ARH05', 1200, 2);

--11.	Consultar los productos que sea impresora HP.
	SELECT * FROM PRODUCTO WHERE NOMBRE LIKE 'impresora HP%'

--12.	Eliminar uno de los nuevos productos creados. 
	SELECT * FROM PRODUCTO WHERE CODIGO = 14;
	DELETE FROM PRODUCTO WHERE CODIGO = 14;
	SELECT * FROM PRODUCTO WHERE CODIGO = 14;
	
--13.	Actualizar el precio de uno de los productos creados.
	
	SELECT * FROM PRODUCTO WHERE CODIGO = 13;
	UPDATE PRODUCTO SET PRECIO = '3200' WHERE CODIGO = 13
	SELECT * FROM PRODUCTO WHERE CODIGO = 13;
	
--14.	Traer los productos que esten dentro del rango de precios 120 y 500.
	SELECT * FROM PRODUCTO WHERE PRECIO BETWEEN 120 AND 500;
	
--15.	Consultar el nombre de cada fabricante con los productos asociados a ellos 
	incluso mostrando los fabricantes que no tienen algún producto asignado.
	
	SELECT
	FABRICANTE.NOMBRE AS 'NOMBRE FABRICANTE',
	PRODUCTO.CODIGO AS 'CODIGO PRODUCTO',
	PRODUCTO.NOMBRE AS 'NOMBRE PRODUCTO',
	PRODUCTO.PRECIO AS 'PRECIO PRODUCTO',
	PRODUCTO.CODIGO_FABRICANTE AS 'CODIGO FABRICANTE'
	FROM FABRICANTE INNER JOIN PRODUCTO;

--16.	Consultar cada producto con el nombre de cada fabricante.
	SELECT 
		PRODUCTO.NOMBRE AS 'NOMBRE PRODUCTO',
		FABRICANTE.NOMBRE AS 'NOMBRE FABRICANTE'
	FROM FABRICANTE INNER JOIN PRODUCTO

--17.	Traer los productos asociados cuyo fabricante es “Crucial” con su respectivo nombre.
	SELECT 
		PRODUCTO.NOMBRE AS 'NOMBRE PRODUCTO',
		FABRICANTE.NOMBRE AS 'NOMBRE FABRICANTE'
	FROM FABRICANTE INNER JOIN PRODUCTO WHERE FABRICANTE.NOMBRE = "Crucial";