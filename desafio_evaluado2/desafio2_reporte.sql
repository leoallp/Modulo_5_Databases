------------------REPORTE - DESAFIO EVALUADO 2 - LEONARDO LLAUPE----------------------
-- Ingresa al cliente de postgreSQL desde el terminal
psql -U postgres 

--. Crea una base de datos llamada desafio-tuNombre-tuApellido-3digitos
CREATE DATABASE desafio2_leonardo_llaupe_456;

\l    --> listamos las bbdd
\c desafio2_leonardo_llaupe_456;   --> dentro de la bbdd

-- creacion tabla
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
\d inscritos; 
--insercion de registros
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

select * from inscritos;

--Crea las querys SQL necesarias que contesten las siguientes preguntas.

--1. ¿Cuántos registros hay?
SELECT COUNT(*) 
FROM inscritos;

---------terminal----------

count
-------
    16
(1 row)

--2. ¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) 
AS total_inscritos
FROM INSCRITOS;

---------terminal----------

total_inscritos
-----------------
    774
(1 row)

--3. ¿Cuál o cuáles son los registros de mayor antigüedad? HINT: ocupar subconsultas
SELECT *
FROM INSCRITOS
WHERE fecha = (
    SELECT MIN(fecha)
    FROM INSCRITOS
);

---------terminal----------

cantidad |   fecha    | fuente
----------+------------+--------
    44 | 2021-01-01 | Blog
    56 | 2021-01-01 | Página
(2 rows)

--4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
SELECT fecha, SUM(cantidad) 
AS inscritos_por_dia
FROM INSCRITOS
GROUP BY fecha
ORDER BY fecha;

---------terminal----------

fecha    | inscritos_por_dia
------------+-------------------
2021-01-01 |               100
2021-02-01 |               120
2021-03-01 |               103
2021-04-01 |                93
2021-05-01 |                88
2021-06-01 |                30
2021-07-01 |                58
2021-08-01 |               182
(8 rows)

--5. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) 
AS total_inscritos
FROM INSCRITOS
GROUP BY fecha
ORDER BY total_inscritos DESC
LIMIT 1;

---------terminal----------

fecha    | total_inscritos
------------+-----------------
2021-08-01 |             182
(1 row)















































