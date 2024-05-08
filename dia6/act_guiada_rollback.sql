


Resumen de códigos:
1. Creación de la tabla:
create table cuentas (numero_cuenta int not null unique primary key,
balance float check(balance >= 0.00));
2. Inserción de registros:
INSERT INTO cuentas (numero_cuenta, balance) values (1, 1000);
INSERT INTO cuentas (numero_cuenta, balance) values (2, 1000);
3. Transacción controlada donde pasamos los $1000 de la cuenta 1 a la cuenta 2.
begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 1;
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 2;
4. Confirmamos la transacción:
commit;
Con este resumen de pasos realizados en la sesión anterior, continuemos entonces con el
procedimiento de revertir cambios y las consideraciones que debemos tener en cuenta.
-----------------------------------------------------------------------------
DELETE FROM cuentas WHERE numero_cuenta = 3;
alter table cuentas add column activa boolean; --> añadimos una columna activa 
UPDATE cuentas SET balance = 4000 where numero_cuenta = 2;

--Save point

--Paso 4: Intentemos registrar una nueva cuenta de número 3 en nuestra tabla “cuentas” con un saldo de $5000 y 
--justo luego guardemos ese punto de la transacción con un SAVEPOINT de nombre “nueva_cuenta”.

BEGIN TRANSACTION;
INSERT INTO cuentas(numero_cuenta, balance,activa) VALUES (3, 5000, true);
    select * from cuentas;

SAVEPOINT nueva_cuenta;

UPDATE cuentas SET balance = balance + 5000 WHERE numero_cuenta = 3;
    select * from cuentas;
UPDATE cuentas SET balance = balance - 5000 WHERE numero_cuenta = 2; -->ERROR:  el nuevo registro para la relación «cuentas» viola la restricción «check» «cuentas_balance_check» DETAIL:  La fila que falla contiene (2, -1000, null).
    select * from cuentas;
-- Justo acá deberás recibir un error
ROLLBACK TO nueva_cuenta;
    
select * from cuentas; 


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
select * from cuentas where balance > 2000;
--● Reporta cuántas tienen un balance inferior a 1000.
select * from cuentas where balance < 1000
--● Reporta el promedio total de las cuentas registradas según su balance.
select avg(balance) as promedio from cuentas;
--● Reporta el promedio de cuentas cuyo balance sea mayor o igual a 10000.
select avg(balance) as promedio from cuentas where balance >= 10000
-->si tenemos mucho decimales --> select round(avg(balance),2) as promedio from cuentas;
select * from cuentas;
