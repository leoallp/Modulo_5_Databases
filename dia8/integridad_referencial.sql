CREATE DATABASE descripciones;

\c descripciones;


--Paso 1: Creamos la tabla clientes create table clientes;
create table clientes (
    id integer unique not null, 
    name varchar(25) not null, 
    email varchar(50)
);

select * from clientes;
-- Paso 2: Insertamos al menos 3 registros, todos sin ingresar el campo email.
insert into clientes(id, name) values (1, 'Nombre 1');
insert into clientes(id, name) values (2, 'Nombre 2');
insert into clientes(id, name) values (3, 'Nombre 3');
insert into clientes(id, name, email) values (4, 'Nombre 4', 'a@a.cl');

select * from clientes;

--Paso 3: Modificamos el campo email a not null con alter table.
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;  ---->ERROR:  la columna «email» de la relación «clientes» contiene valores null

--ERROR: column "email" of relation "clientes" contains null values
--Veamos entonces cómo solucionar este inconveniente muy común en las bases de datos.

--Paso 4: Debemos actualizar la tabla con el comando UPDATE, seguidamente debemos indicar la columna
--a modificar y por último con WHERE definir la condición cuando el campo sea nulo.
update clientes set email = '' where email is null;

--la clausula where es para una cantidad limitada de 

--Paso 5: Corremos nuevamente el comando de alteración de la columna
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;


--6 En la tabla clientes del ejercicio anterior, crearemos un campo fecha. Para esto, modifica la tabla y asigna la restricción.

alter table clientes add column fecha date not null; 
--ERROR:  la columna «fecha» de la relación «clientes» contiene valores null

alter table clientes add column fecha date not null default now();

select * from clientes;

---------COALESCE--------- permite seleccionar campos que sean nulos en una tabla y modificarlos con un valor determinado.

-- ELIMINAR
DELETE FROM clientes;
\d clientes; ---> mantiene las constrains de cada columna 
--volvemos a insertar valores
--quitar una restriccion not null de email
ALTER TABLE IF EXISTS public.clientes
    ALTER COLUMN email DROP NOT NULL;

select * from clientes;

--Asignemos una mensaje a esos registros con COALESCE.
UPDATE clientes SET email = COALESCE(email, 'sin email');
update clientes set email = 'sin email' where email is null; --> es lo mismo














