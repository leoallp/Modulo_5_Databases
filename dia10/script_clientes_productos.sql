--\i script_clientes_productos.sql;   --siempre y cuando estemos en ubicados en la carpeta dia10

drop database if EXISTS productos_feria; 
create database Productos_feria;

drop table IF EXISTS compras; --siempre eliminar la tabla relacional 
drop table IF EXISTS clientes;
drop table IF EXISTS productos;

create table clientes(
    id serial primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    direccion varchar(250) not null,
    dni varchar(50) not null unique
);

create table productos(
    id serial primary key,
    codigo varchar(250) not null unique
);

create table compras(
    id serial primary key,
    cliente_id int,
    producto_id int,
    foreign key(cliente_id) references clientes(id),
    foreign key(producto_id) references productos(id) 
);


-- INSERT
insert into productos (codigo) 
values ('aaaa4')




