--DQL: lenaguaje de consulta de datos; SELECT
--DML: Lenguaje de manipulacion de datos; INSERT; UPDATE; DELETE
--DDL:
--DCL:


--ingresar a sql
psql -U postgres

--● Paso 1: Creamos una base de datos de comidas típicas chilenas.
create database comidas_tipicas;
--● Paso 2: Creamos una tabla llamada cocina chilena con los campos id y nombre.
create table cocina_chilena(
    id int, 
    nombre varchar(50));
---consultamos tabla 
\d;
--● Paso 3: Insertamos 2 registros a la tabla con sus respectivos campos.
insert into cocina_chilena (id, nombre) values ('1','Pastel de choclo');
insert into cocina_chilena (id, nombre) values ('2', 'Umitas');

--consultamos 
select * from cocina_chilena;

--Paso 4: Para actualizar un registro utilizamos update.
UPDATE cocina_chilena 
set nombre='Humitas' 
where id = 2;

UPDATE cocina_chilena 
set nombre='Humitas' ---luego volver a la normalidad

--"Ingresa 3 registros más a la tabla e intenciona el update en al menos 2 de ellos"

insert into cocina_chilena (id, nombre) values ('3', 'porotos');
insert into cocina_chilena (id, nombre) values ('4', 'cazuelaz');
insert into cocina_chilena (id, nombre) values ('5', 'charquikan');
--actualizamos resgistro con errores
UPDATE cocina_chilena 
set nombre='cazuela' 
where id = 4;

UPDATE cocina_chilena 
set nombre='charquican' 
where id = 5;


--DELETE
--Paso 5: Eliminar un registro lo podremos hacer con la sentencia Delete. Así como hicimos con la actualización,
--utilizaremos el id para capturar un registro puntual.
delete from cocina_chilena where id = 2;

-- si quisieramos añadir con update y con el id=2 NO funcionara

delete from cocina_chilena;   --se elimina el contenido( o registros) de la tabla


alter table cocina_chilena add primary key(id); ---****************



--Paso 6: Eliminar múltiples registros en la tabla. Para ello añadiremos platos de cocina chilena.
--insertamos nuevos registros
insert into cocina_chilena (id, nombre) values ('1','Pastel de choclo');
insert into cocina_chilena (id, nombre) values ('2', 'Humitas');
insert into cocina_chilena (id, nombre) values ('3', 'porotos');
insert into cocina_chilena (id, nombre) values ('4', 'cazuela');
insert into cocina_chilena (id, nombre) values ('5', 'charquican');

delete from cocina_chilena 
where id in (3, 4, 5);   -- "IN" se usa en la condición para verificar si el valor de la columna "id" está presente en una lista de valores específica

delete from cocina_chilena 
where id = 5
and id = 3; --DELETE 0

delete from cocina_chilena 
where id = 5
or id = 3;  --DELETE 2

delete from cocina_chilena 
where id = 2
and nombre = 'cazuela';  --DELETE 0  PORQ NO ENCUENTRA UN REGISTRO Q CUMPLA AMBAS CONDICIONES

delete from cocina_chilena 
where id = 2
or nombre = 'cazuela';  --DELETE 2  ELIMINARA AMBOS REGISTROS Q CUMPLAN LAS CONDICVIONES