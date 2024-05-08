--● Paso 1: Creamos la base de datos con el nombre bbdd_gimnasios.
create database bbdd_gimnasios;
--● Paso 2: Nos conectamos a la base de datos una vez que haya sido creada.
\c bbdd_gimnasios;
--● Paso 3: Creamos la tabla clientes con los siguientes campos:
--○ Nombre
--○ Apellido
--○ Rut
--○ Email
create table clientes(
    nombre varchar(50), 
    apellido varchar(50), 
    rut int,
    email varchar(50)
    );
--● Paso 4: Modificamos la tabla clientes y definimos que el rut será la clave primaria
--(Primary Key)
alter table clientes add primary key(rut);
--¿Qué es Primary Key?
--● Primary key (Clave primaria) es una instrucción que nos permitirá asignarle un
--identificador único a cada registro ingresado en la tabla clientes.
--● Generalmente, las claves primarias están compuestas por elementos numéricos como es el caso del rut.
--● Además, las claves primarias nos sirven para conectar tablas que estén relacionadas. Por ejemplo:
--○ Un Cliente puede registrarse y obtener varias matrículas, pero cada matrícula va a pertenecer a un único cliente.

--● Paso 5: Creamos la tabla matrículas con los siguientes campos:
--○ Monto
--○ Estado
--○ Asignamos la clave foránea para la integración de ambas tablas con el Rut.
create table matriculas(
    monto varchar(50), 
    estado boolean, 
    cliente_rut int references clientes(rut)
    );

--● Paso 6: Insertamos 5 registros en la tabla clientes.
insert into clientes values ('Cliente 1', 'Apellido cliente 1',
'999999999', 'cliente1@email.com');
insert into clientes values ('Cliente 2', 'Apellido cliente 2',
'888888888', 'cliente2@email.com');
insert into clientes values ('Cliente 3', 'Apellido cliente 3',
'777777777', 'cliente3@email.com');
insert into clientes values ('Cliente 4', 'Apellido cliente 4',
'666666666', 'cliente4@email.com');
insert into clientes values ('Cliente 5', 'Apellido cliente 5',
'555555555', 'cliente5@email.com');

--Paso 7: Insertamos 5 registros en la tabla matriculas y los asociamos mediante su rut a cada cliente.
insert into matriculas values ('40000', True, '999999999');
insert into matriculas values ('40000', False, '888888888');
insert into matriculas values ('55000', True, '555555555');
insert into matriculas values ('35000', True, '777777777');
insert into matriculas values ('60000', False, '666666666');

--Paso 8: Utilizar el inner join para que se muestren todos los registros que estén
--relacionados. Recordemos que esto se ejecuta siempre que exista una columna que relacione nuestras dos tablas.
select cli.email, cli.rut, mat.monto, mat.estado 
from clientes cli
inner join matriculas mat
on cli.rut = mat.cliente_rut;   -- el nuevo conjunto de columnas es temporal, no se guarda en la base de datos

--Paso 9: Podemos agregar funciones anidadas a la consulta, en este caso supongamos que queremos ordenar según el monto de cada cliente. 
--El orden será de manera ascendente, es decir del monto menor al mayor, para ello utilizaremos order by
select email, rut, monto, estado 
from clientes 
inner join matriculas on clientes.rut = cliente_rut 
order by matriculas.monto;

--***: si queremos guardar en una nueva tabla este nuevo conjunto de columnas se debe usar INSERT INTO
CREATE TABLE tabla_InnerJoin (     -----antes se de debe crear la nueva tabla
    email VARCHAR(50),
    rut INT,
    monto DECIMAL(10, 2),
    estado VARCHAR(50)
);
-- se inserta el nuevo conjunto de tablas en la tabla creada
INSERT INTO tabla_InnerJoin (email, rut, monto, estado)
SELECT email, rut, monto::numeric, estado
FROM clientes
INNER JOIN matriculas ON clientes.rut = matriculas.cliente_rut;


--Paso 10: Agrupar consultas, para ello añadiremos una matrícula nueva a un RUT ya existente. 
--Esta agrupación consistirá en obtener aquellos clientes que tienen más de una matrícula generada.
select monto, count(monto) from matriculas group by monto having
count(monto) >= 2;

select cliente_rut, count(cliente_rut) 
from matriculas 
group by cliente_rut 
having count(cliente_rut) >= 2;
--***si queremos filtrar por un correo, o por montos inferiores a cierto valor entonces ocuparemos WHERE (NO SE PUEDE AGREGAR FUNCIONES)
--***si queremos filtrar por la suma o conteo de los valores deberemos ocupar HAVING.

--Paso 11: Hasta el paso 10 recibimos los datos del registro que tiene dos matrículas asignadas, pero estos datos están incompletos,
--no sabemos el nombre de la persona, su rut ni el email. Para solucionarlo debemos primero agrupar a partir de
--aquellos campos que tienen una función de agregado implementada, veamos el código.
select email, rut, monto, estado, count(matriculas.*) 
from clientes 
inner join matriculas 
on clientes.rut = cliente_rut 
group by email, monto, rut, estado;

select rut, email, nombre, count(matriculas.*) -- SOLO QUEREMOS SABER LA CANTIDAD DE MATRICULAS, si hay estados diferentes hara conteos por separados
from clientes 
inner join matriculas 
on clientes.rut = cliente_rut 
group by  rut, email, nombre;

--Paso 12: Ya que tenemos la agrupación de los datos ahora podemos usar nuevamente having para obtener únicamente 
--aquellos registros con los datos completos que tengan dos o más matrículas, recuerda la cláusula del having.
select email, rut, monto, estado, count(matriculas.*) 
from clientes
inner join matriculas on clientes.rut = cliente_rut 
group by email, monto, rut, estado 
having count(matriculas.*) >= 2;

--A continuación, deberás agregar el campo correspondiente en la tabla cliente para asegurar
--la integridad referencial. Recuerda que este campo lo puedes definir como ID, cliente_id, matriculas_id
--Para lograrlo ejecuta los siguientes pasos:
--1. Elimina los registros de ambas tablas con delete from nombre_tabla;.
--2. Utiliza ALTER para incorporar el nuevo campo en cada tabla.
ALTER TABLE clientes
ADD COLUMN id integer;

ALTER TABLE matriculas
ADD COLUMN id integer;

--3. Inserta registros en ambas tablas al menos 2.
insert into clientes values ('Cliente 1', 'Apellido cliente 1',
'999999999', 'cliente1@email.com', '1');
insert into clientes values ('Cliente 2', 'Apellido cliente 2',
'888888888', 'cliente2@email.com', '2');

insert into matriculas values ('67000', False, '999999999', '1');
insert into matriculas values ('40000', True, '999999999', '1');
insert into matriculas values ('40000', False, '888888888', '2');

--4. Asigna más de una matrícula a algún cliente y realiza la consulta del paso 12 del ejercicio anterior.
select email, rut, monto, estado, count(matriculas.*) 
from clientes
inner join matriculas on clientes.rut = cliente_rut 
group by email, monto, rut, estado 
having count(matriculas.*) >= 2;   --arroja el email, rut, monto, estado, del rut que tenga 2 matriculas o mas

--5. Comparte con tus compañeros/as y docente el resultado de tus consultas