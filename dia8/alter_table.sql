
--Paso 1: Creamos la base de datos con el nombre Mawashi Phones.
create database mawashi_phones;
-- Paso 2: Nos conectamos a la base de datos.
\c mawashi_phones;

--Paso 3: Creamos la tabla con los campos que nos solicita inicialmente el cliente.
create table phones (
    id int primary key, 
    modelo varchar(50), 
    mac_address int unique,
    fecha_fabricacion varchar(50)
);

--● Paso 4: Insertamos un registro para probar la tabla.

insert into phones (id, modelo, mac_address, fecha_fabricacion) values (1, 'Iphone 14', '1B:2A:3C:4D:5F:6G', '2022-09-09');
--ERROR:  la sintaxis de entrada no es válida para tipo integer: «1B:2A:3C:4D:5F:6G» LINE 2: 14', '1B:2A:3C:4D:5F:6G', '2022-09-09');


--Paso 5: Modificamos el tipo de dato definido en el campo mac_address.
alter table phones alter column mac_address type varchar(50);
\d phones; 
select * from phones;

--● Paso 6: Comprobamos que se hayan aplicado los cambios.
\d phones;

--Paso 7: Insertamos nuevamente el registro.
insert into phones (id, modelo, mac_address, fecha_fabricacion) values (1, 'Iphone 14', '1B:2A:3C:4D:5F:6G', '2022-09-09');

--Paso 8: Con el alter table también podemos agregar nuevas restricciones sin reescribir las ya existentes.
alter table phones alter column mac_address set not null;
\d phones;
--probamos el not null 
insert into phones (id, modelo, fecha_fabricacion) values (2, 'Iphone 15',  '2022-09-09');   --asi
insert into phones (id, modelo, mac_address, fecha_fabricacion) values (2, 'Iphone 20', null, '2022-09-09');  -- o asi
--ERROR:  el valor nulo en la columna «mac_address» de la relación «phones» viola la restricción de no nulo DETAIL:  La fila que falla contiene (2, Iphone 20, null, 2022-09-09).

--eliminacion tabla
DROP TABLE phones;

--creacion de usuario
CREATE USER nombre_usuario WITH PASSWORD 'Admin1234';

CREATE USER leonardo WITH PASSWORD 'Admin1234';
--crear base datos para el usuario
\l
create database leo with owner leonardo;

--asignar permisos
alter user leonardo with SUPERUSER CREATEDB CREATEROLE;

--comando para ver users en postgresql
select usename from pg_user;

----REINICIANDO LA SECUENCIA de una tabla con TRUNCATE
truncate libros RESTART IDENTITY;
truncate autores RESTART IDENTITY CASCADE;

-- REINICIANDO LA SECUENCIA
ALTER SEQUENCE libros_id_seq RESTART;


--Si queremos eliminar registros de una tabla ¿Qué es lo más recomendable?
--SIEMPRE HACER UN RESPALDO


create table phones (
    id int primary key, 
    modelo varchar(50), 
    mac_address int unique,
    fecha_fabricacion varchar(50)
);
A continuación, aplicarás lo aprendido en esta sesión incorporando los siguientes
campos a la tabla phones:
● Memoria interna.
● Memoria ram.
● Peso.
● Dimensiones.
Para estos campos considera que son datos que mezclan datos numéricos y de
texto. Recuerda asignar el tipo de dato a cada campo la restricción de nulidad.

Además, agrega al campo ID la instrucción SERIAL para que al momento de
generarse un nuevo registro esta columna sea llenada de manera automática e
incremental.
Tips:

--1. Para agregar nuevas columnas: alter table nombre_tabla add column.
alter table phones add column memoria_interna varchar(10) not null;
alter table phones add column memoria_ram varchar(10) not null;
alter table phones add column peso varchar(10) not null;
alter table phones add column dimensiones varchar(10) not null;


--2. Para modificar una columna como el ID:  alter table nombre_tabla alter column.
alter table phones alter column id SERIAL; --ERROR:  error de sintaxis en o cerca de «SERIAL» LINE 1: alter table phones alter column id SERIAL;
-- Primero, eliminamos la columna existente
ALTER TABLE phones
DROP COLUMN id;

-- Luego, agregamos una nueva columna con el tipo SERIAL y la hacemos la clave primaria
ALTER TABLE phones
ADD COLUMN id SERIAL PRIMARY KEY;

\d phones;



































































