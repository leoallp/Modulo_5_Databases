Actividad guiada: Mawashi Cars
La base de datos de Mawashi Cars SPA debe contener por los momentos dos tablas, una
para autos y otra para ventas.
En la tabla de autos existirán los campos:
● ID
● marca
● modelo
● año
● color
● precio

En la tabla ventas:
● Fecha
● Id_auto
● Cliente
● Referencia
● Cantidad
● Método de pago.


--● Paso 1: Creamos la base de datos con el nombre mawashi_cars.
create database mawashi_cars;

--● Paso 2: Nos conectamos a la base de datos.
\c mawashi_cars;

--● Paso 3: Creamos la tabla autos.
create table autos(
    id int primary key,   --> clave primaria
    marca varchar(25),
    modelo varchar(25), 
    año varchar(25), 
    color varchar(25), 
    precio float
    );

\d autos;
select * from autos;

--● Paso 4: Creamos la tabla de ventas.
create table ventas(
    id serial unique not null,    --> al agregar el serial no hay que dar valor en un insert into en esta columna, se agrega sola
    fecha varchar(20),
    id_auto int,             ---> se le puede asignar cualquier valor id de la tabla autos del 1 al 10, se pueden repetir incluso     
    cliente varchar(25), 
    referencia int, 
    cantidad float,
    metodo_pago varchar(10),
    foreign key (id_auto) references autos(id)     -- > establece id_auto como foreing key 
    );
\d ventas;
select * from ventas;

--● Paso 5: Insertamos 10 registros en la tabla autos.
insert into autos (id, marca, modelo, año, color, precio) values (1,
'Toyota', 'Corolla Araya', '1991', 'Blanco', 1200000);
insert into autos (id, marca, modelo, año, color, precio) values (2,
'Mazda', 'Mazda 3', '2000', 'Azul',2000000);
insert into autos (id, marca, modelo, año, color, precio) values (3,
'Chevrolet', 'Spark', '1998', 'Verde Oscuro', 1200000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (4,
'Nissan', 'Versa', 2018, 'Gris Plata', 5000000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (5,
'Hyundai', 'Accent', 2022, 'Rojo', 10500000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (6,
'Kia', 'Rio', 2020, 'Negro', 8000000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (7,
'Volkswagen', 'Gol', 2015, 'Azul Marino', 3500000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (8,
'Fiat', 'Mobi', 2017, 'Blanco', 2800000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (9,
'Suzuki', 'Swift', 2019, 'Gris Oxford', 6200000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (10,
'Peugeot', '208', 2021, 'Rojo', 9800000);

--● Paso 6: Insertamos algunas ventas.
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2020-10-15', 1, 'Chuck', 43224, 12000000,
'Débito');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2020-11-15', 1, 'Donnie', 43334, 12000000,
'Transfer');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2020-12-15', 3, 'Jet', 43444, 12000000, 
'Cheque');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2021-01-05', 1, 'Peter', 43335, 12000000,
'Débito');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2021-01-15', 1, 'Abigail', 43554, 12000000,
'Transfer');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2021-02-01', 3, 'Jhon', 43456, 12000000, 
'Cheque');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) VALUES ('2021-02-01', 2, 'Walter', 54321, 2000000, 
'Efectivo');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) VALUES ('2021-03-15', 3, 'Sarah', 54322, 1200000, 
'Tarjeta');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) VALUES ('2021-04-05', 4, 'Jessica', 54323, 5000000, 
'Débito');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) VALUES ('2021-05-25', 5, 'Luis', 54324, 10500000, 
'Transfer');

--Paso 7: Obtenemos un reporte con el nombre de los clientes registrados en la tabla venta,
-- junto con la marca y el modelo del auto asociado a la venta realizada.

SELECT cliente, marca, modelo 
FROM ventas 
INNER JOIN autos -->une filas de dos tablas basándose en la condición es ventas.id_auto = autos.id, 
ON ventas.id_auto = autos.id; -->lo que significa que las filas se unirán cuando el id_auto en la tabla ventas sea igual al id en la tabla autos

cliente |   marca   |    modelo
---------+-----------+---------------
Chuck   | Toyota    | Corolla Araya
Donnie  | Toyota    | Corolla Araya
Jet     | Chevrolet | Spark
Peter   | Toyota    | Corolla Araya
Abigail | Toyota    | Corolla Araya
Jhon    | Chevrolet | Spark
Walter  | Mazda     | Mazda 3
Sarah   | Chevrolet | Spark
Jessica | Nissan    | Versa
Luis    | Hyundai   | Accent
(10 rows)

--Realizar la consulta necesaria para obtener todos los autos cuyos id no se encuentran en la tabla Ventas.

select autos.id, marca, modelo, color, año 
from autos
left join ventas
on autos.id = ventas.id_auto
where ventas.id_auto is null;

id |   marca    | modelo |    color    | año
----+------------+--------+-------------+------
10 | Peugeot    | 208    | Rojo        | 2021
8 | Fiat       | Mobi   | Blanco      | 2017
6 | Kia        | Rio    | Negro       | 2020
9 | Suzuki     | Swift  | Gris Oxford | 2019
7 | Volkswagen | Gol    | Azul Marino | 2015
(5 rows)


--Realizar la sentencia SQL necesaria para saber los registros que No tienen relación entre ambas tablas
--para hacer el cruce con la información cedida anteriormente y terminar la auditoría.

select *    ---> o se puede pedir "select autos.id, marca, modelo, año, color, precio"  <-- idealmente asi
from autos 
full outer join ventas
on autos.id = ventas.id_auto
where autos.id is null 
or ventas.id_auto is null;
















