--Accedemos al cliente de postgresql via el terminal.
psql -U postgres

--● Paso 1: nos conectamos a la base de datos

\c transacciones;

alter table cuentas add column activa boolean; --> añadimos una columna activa  

BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
COMMIT;

BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
select * from cuentas;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1; -->ERROR:  el nuevo registro para la relación «cuentas» viola la restricción «check» «cuentas_balance_check» DETAIL:  La fila que falla contiene (1, -1000, null).
select * from cuentas;--> ERROR:  transacción abortada, las órdenes serán ignoradas hasta el fin de bloque de transacción
--salimos de esta transaccion abortada con commit o rollback, si es con commit se ejecuta un rollback
ROLLBACK;--> volvemos al ultimo commit realizado 
select * from cuentas;

------------------------------------Save point-------------------------------------------


--Paso 4: Intentemos registrar una nueva cuenta de número 3 en nuestra tabla “cuentas” con un saldo de $5000 y 
--justo luego guardemos ese punto de la transacción con un SAVEPOINT de nombre “nueva_cuenta”.

BEGIN TRANSACTION;
INSERT INTO cuentas(numero_cuenta, balance,activa) VALUES (3, 5000, true);
    select * from cuentas;

SAVEPOINT nueva_cuenta;  --<-<- agregar

UPDATE cuentas SET balance = balance + 5000 WHERE numero_cuenta = 3;
    select * from cuentas;
UPDATE cuentas SET balance = balance - 5000 WHERE numero_cuenta = 2; -->ERROR:  el nuevo registro para la relación «cuentas» viola la restricción «check» «cuentas_balance_check» DETAIL:  La fila que falla contiene (2, -1000, null).
    select * from cuentas;--ERROR:  transacción abortada, las órdenes serán ignoradas hasta el fin de bloque de transacción
-- Justo acá deberás recibir un error
ROLLBACK TO nueva_cuenta;   --- el rollback to save point se llama antes de hacer un commit
    
select * from cuentas; 
COMMIT; --> confirmamos transaccion
----------------------------------------------¡Manos a la obra! - Obteniendo registros-------------------------------------------
--A continuación, deberás insertar al menos 10 registros más en la base de datos de transacciones. Una vez ingresados, 
--genera un reporte con los siguientes datos:

INSERT INTO cuentas(numero_cuenta, balance) VALUES (4,
7000);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (5,
500);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (6,
12000);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (7,
900);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (8,
100);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (9,
20000);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (10,
50);
select * from cuentas; 

--● Reporta aquellas cuentas cuyo balance sea mayor a 2000.
select numero_cuenta, balance 
from cuentas 
where balance > 2000;
numero_cuenta | balance | activa
---------------+---------+--------
            2 |    4000 |
            3 |    5000 | t
            4 |    7000 |
            6 |   12000 |
            9 |   20000 |
(5 rows)

--● Reporta cuántas tienen un balance inferior a 1000.
select numero_cuenta, balance  
from cuentas 
where balance < 1000;
numero_cuenta | balance | activa
---------------+---------+--------
            1 |       0 |
            5 |     500 |
            7 |     900 |
            8 |     100 |
        10 |      50 |
(5 rows)

--● Reporta el promedio total de las cuentas registradas según su balance.
select avg(balance)
as promedio 
from cuentas;
promedio
----------
    4955
(1 row)

--● Reporta el promedio de cuentas cuyo balance sea mayor o igual a 10000.
select avg(balance)
as promedio 
from cuentas 
where balance >= 10000;

-->si tenemos mucho decimales --> select round(avg(balance),2) as promedio from cuentas;
select * from cuentas;
