--Desafío - Bases de datos relacionales
--LEONARDO LLAUPE PAILLAMA
--1. Comienza a grabar

--2. Entra a la terminal

--3. Ingresa al cliente de postgreSQL desde el terminal
psql -U postgres 

--4. Crea una base de datos llamada desafio-tuNombre-tuApellido-3digitos
CREATE DATABASE desafio1_leonardo_llaupe_123;

\l    --> listamos las bbdd

--5. Ingresa a la base de datos creada.
\c desafio1_leonardo_llaupe_123;

--6. Crea una tabla llamada clientes con; 
--una columna llamada email de tipo varchar(50)
--una columna llamada nombre de tipo varchar sin limitación
--una columna llamada teléfono de tipo varchar(16) 
--una columna llamado empresa de tipo varchar(50) 
--una columna de tipo smallint, para indicar la prioridad del cliente. Ahí se debe ingresar un valor entre 1 y 10, donde 10 es más prioritario.
--*Hint: No hay que limitar el valor de la columna de prioridad, como tipo de dato se recomienda ocupar smallint.
create table clientes(
    email varchar(50),
    nombre varchar,
    telefono varchar(16),
    empresa varchar(50),
    prioridad smallint
);

--consultamos la tabla creada
\d clientes;  

--7. Ingresa 5 clientes distintos con distintas prioridades, el resto de los valores los puedes inventar.
insert into clientes values ('cliente1@email.com','juan','451111','empresa-A','2');
insert into clientes values ('cliente2@email.com','pedro','452222','empresa-B','4');
insert into clientes values ('cliente3@email.com','sofia','453333','empresa-B','6');
insert into clientes values ('cliente4@email.com','carla','454444','empresa-D','6');
insert into clientes values ('cliente5@email.com','daniela','455555','empresa-B','10');

-- consultamos los valores ingresados
select * from clientes;

--8. Selecciona los tres clientes de mayor prioridad.
select *
from clientes
order by prioridad desc
limit 3;

--9. Selecciona, de la tabla clientes, una prioridad o una empresa, de forma que el resultado devuelva 2 registros.
select * 
from clientes
where empresa = 'empresa-B'
limit 2;

--10. Sal de postgreSQL.
\q;




--link youtube

https://youtu.be/p0XD8hzvex4




-- eliminar base de datos
DROP DATABASE desafio1_leonardo_llaupe_123;







