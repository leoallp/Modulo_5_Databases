--¿Qué es DML?
--Lenguaje de Manipulación de Datos 
--es un lenguaje proporcionado por los sistemas gestores de bases de datos 
--que permite a los usuarios de la misma actualizar, insertar y borrar datos de sus tablas

--¿Qué lenguaje DML hemos utilizado para manipular datos?
insert, update, delete

--¿Qué es DDL?
--Lenguaje de definición de datos (Data Definition Language)
--------------------------------------------------------------------------------------------------------------------------------------------

--A continuación, realizaremos un repaso de algunas operaciones básicas en una base de datos utilizando SQL.

--● Paso 1: Crear una base de datos
create database nombre_base_de_datos;
--● Paso 2: Mostrar todas las tablas de una base de datos.
\dt;
--● Paso 3: Mostrar una tabla en específica.
\dt nombre_tabla;
--● Paso 5: Modificar un campo de una tabla.
ALTER TABLE cuentas ADD fecha date;
--● Paso 4: Eliminar una tabla de la base de datos.
drop table cuentas; ---elimina tabla completa
delete from cuentas; ---elimina registros




create table clientes (
    id int primary key, 
    nombre varchar not null, 
    rut int unique not null,
    dv char not null
    );

\d clientes

select cocat(rut,dv) as rut_completo from clientes --> contatena columna rut(int) con dv(char) para mostrarme el rut completo
------------------------restricciones---------------------------
null != "" -----> null es distinto de vacio OJO

CREATE TABLE products (
    product_no integer PRIMARY KEY,
    name text NOT NULL default '',
    price numeric default 0
);

insert into products values(012,'producto 1',0100);
insert into products values(013,'producto 2');
insert into products values(014,'producto 3', null);
select * from products;
product_no |    name    | price
------------+------------+-------
        12 | producto 1 |   100
        13 | producto 2 |     0
        14 | producto 3 |            ----> queda Null
(3 rows)

drop table products;

CREATE TABLE products (
    id integer PRIMARY KEY,
    name text NOT NULL default '',
    price numeric default 0
);
select * from products;

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    product_id integer REFERENCES products(id),
    quantity integer check(quantity >=0)
);

\d orders;
select * from orders;
drop table orders;

ALTER TABLE IF EXISTS public.orders
ADD CONSTRAINT check_quantity CHECK (quantity >=0)
NOT VALID;

select nextval('orders_id_seq');

----------------A continuación, deberás crear una base de datos que almacene información de clientes bancarios.--------------------

Crear una tabla para clientes con los campos:
a. ID           int serial PRIMARY KEY
b. Nombre       varchar(50) not null
c. Apellido     varchar(50) not null
d. Rut          varchar(12) not null unique 
e. Teléfono     varchar(20) default ''
f. Email        varchar     unique

--● Crear una tabla para cuentas donde existan los campos:
--a. ID
--b. Número de cuenta.
--c. Fecha de creación.
--d. Balance.
--● La clave foránea deberás definirla en el campo correspondiente para que se genere la relación con clientes.
--Nota: Para los campos ID considera utilizar SERIAL para la generación autoincremental de estos valores.













