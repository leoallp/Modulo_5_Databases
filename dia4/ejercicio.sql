

--ingresar a sql
psql -U postgres

--Crea una nueva base de datos, 
CREATE DATABASE perros_gatos;
\l
--Conéctate a la base de datos.
\c perros_gatos;
--en ella deberás almacenar información de perros o gatos, los campos deberán ser:
--1. ID
--2. Nombre
--3. Raza
--4. Edad

--CREACION DE UNA TABLA
create table perros(
    id int,
    nombre varchar,
    raza varchar,
    edad int
);
--listamos la tabla 
\d perros;
select * from perros;
--Ingresa al menos unos 5 registros 
insert into perros (id, nombre, raza, edad) values ('1','thor','quiltro','5');
insert into perros (id, nombre, raza, edad) values ('2','oliviia','pug','2');
insert into perros (id, nombre, raza, edad) values ('3','flor','dalmato','3');
insert into perros (id, nombre, raza, edad) values ('4','lonme','pastor belga','4');
insert into perros (id, nombre, raza, edad) values ('5','sony','quiltro','7');

select * from perros;

--intenciona las acciones de:
--● Update.
UPDATE perros 
set nombre='olivia' 
where id = 2
RETURNING *;  -- devuelve el registro q se actualizo
--● Delete.
delete from perros 
where id = 4
RETURNING *;   -- devuelve el registro q se elimino

select * from perros;


update perros
set nombre = nombre + '2024'     --tarea averiguar como realizar la concatenacion con varchar*******
RETURNING *;
update perros
set nombre = concat(nombre,' 2024')     --CONCAT
RETURNING *;

update perros
set nombre = nombre ||' '|| 'paper'     --paper
RETURNING *;


update perros
set id = id + '2024'
RETURNING *;  --sumara 2024 al valor int de cada id  


¿Qué sucedería si al
momento de borrar un
registro no indicamos
algún campo
identificador?  --borrara todos los registros