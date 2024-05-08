
--Autoincremento de IDs
psql -U postgres
--● Paso 1: Creamos la base de datos restricciones_psql. Luego debemos conectarnos a ella.
create database restricciones_psql;
\c restricciones_psql;
--● Paso 2: Creamos una tabla llamada company con los campos id y nombre.
create table company (
    id serial primary key,        -- con SERIAL se agregan un id de forma incremental, se crea una secuencia
    nombre varchar not null unique
    );

select * from company;
\d company;
--Paso 3: Hacemos dos insert a la tabla.
insert into company(nombre) values('Amazon');
insert into company(nombre) values('Apple');
--En el código a pesar de no definir el id este se ingresa automáticamente y de  manera auto incremental.

--Paso 4: Validar la restricción Unique dentro de la tabla. Para ello intentaremos ingresar un nombre que ya exista.
insert into company(nombre) values('Apple');
insert into company(nombre) values('microsoft');
--Al ejecutar veremos el siguiente error:
--ERROR: duplicate key value violates unique constraint "company_nombre_key"
--DETAIL: Key (nombre)=(Apple) already exists.
--Este error comprueba que nuestra restricción(constraint) está funcionando.

--Comprueba la restricción not null del campo nombre"
insert into company(nombre) values(); --error de sintaxys
insert into company(nombre) values(null);--ERROR:  el valor nulo en la columna «nombre» de la relación «company» viola la restricción de no nulo
insert into company(nombre) values('');  -- esto no es notnull, se ingresara el registro pero con nombre vacio


insert into company(nombre) values(6,'alibaba');
insert into company(nombre) values('ubuntu');
insert into company(nombre) values(9,'fedora');
insert into company(nombre) values('slack');
insert into company(nombre) values('debian');

--nextval, consultar el valor actual de la secuencia
select nextval('company_id_seq'::regclass);
select nextval('company_id_seq');
select * from company_id_seq;

select * from company;






