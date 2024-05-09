
-- lo primero a realizar es conectarse a la base de datos desde la terminal
-- Paso 1: Accedemos al cliente de postgresql via el terminal.
psql -U postgres

-- Paso 2: Crea una base de datos llamada prueba1.
CREATE DATABASE prueba1;
-- Paso 3: Lista las bases de datos creadas.
\l
-- Paso 4: Conéctate a la base de datos.
\c prueba1
-- Paso 5: (opcional) salir de la terminal de pstgresql
\q
--CREACION DE UNA TABLA
--VARCHAR -> STRING
create table clientes(
    nombre varchar(30),
    apellido varchar(30)
);

-- listar las tablas de una base de datos
\d
-- describe/detalla una tabla
\d clientes
-- mas descripcion de la tabla
\d+ clientes

-- INSERTAR VALORES A UNA TABLA
insert into clientes (nombre, apellido) values ('Leonardo','Llaupe');
insert into clientes (nombre, apellido) values ('israel','palma');
insert into clientes values ('guki','fernandez');  --> obvia las columnas e inserta, OjO  la hora de rellenar tablas 
insert into clientes  (apellido, nombre) values ('saldaña','max'); --< ingresa bien nombre y apellido en la tabla


--CONSULTAR REGISTROS EN UNA TABLA
SELECT * from clientes;
SELECT * from clientes order by nombre desc;

--BORRAR ALGUN REGISTRO DE LA TABLA
DELETE FROM clientes WHERE nombre = 'israel' and apellido = 'palma';

-- ELIMINAR
DELETE FROM clientes; --> BORRA TODO EL CONTENIDO DE LA TABLA (recomendacion respaldar antes)

-- eliminar tabla
drop table nombre_tabla;

-- eliminar base de datos
DROP DATABASE nombre_de_la_base_de_datos;

--funciones de agregado 
select sum(columna) from tabla; --suma
select avg(columna) from tabla; -- promedio
select max(columna) from tabla; -- numero maximo
select Min(columna) from tabla; --numero minimo
select count(*) from tabla; --conteo 

select round(avg(name_columna),2) --> acortar a 2 decimales, en este caso de un promedio 

-- IN () filtrar o comprobar si un valor existe en una lista determinada
select * 
from productos
where id_producto in (20,1,55,3);

--MODIFICR UN TABLA
--pk sera unica 
ALTER TABLE CLIENTES ADD PRIMARY KEY(RUT);

--AGREGAR COLUMNA A TABLA
alter table nombre_tabla add column nombre_columna boolean; --boolean es un tipo de dato , puede ser otro


--*************************IMPRIMIR DIAGRAMA DE COMANDOS DE LA PPT II********************************
