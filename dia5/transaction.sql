--que es ACID;
--● Atomicidad: Las operaciones se ejecutan como una unidad completa o no se ejecutan en absoluto.
--Esto evita la corrupción de datos que puede ocurrir si solo se aplica una parte de la operación.
--● Consistencia: Las operaciones llevan la base de datos de un estado consistente a otro. Esto asegura
--que los datos siempre cumplan con las reglas de negocio y las restricciones de integridad.
--● Aislamiento: Las operaciones se ejecutan de forma independiente, sin interferirse entre sí. Esto evita
--la pérdida de datos que puede ocurrir si dos operaciones intentan modificar el mismo dato al mismo tiempo.
--● Durabilidad: Los cambios realizados por las operaciones se guardan de forma permanente, incluso en
--caso de un fallo del sistema. Esto protege la integridad de los datos contra la pérdida o corrupción.

--Accedemos al cliente de postgresql via el terminal.
psql -U postgres

--● Paso 1: Creamos la base de datos transacciones y nos conectamos.
create database transacciones;
\c transacciones;
--● Paso 2: Creamos una tabla llamada cuentas con los campos numero_cuenta y balance.
create table cuentas (
    numero_cuenta int primary key,    -- cuando se agrega un primary key no se coloca not null, tampoco unique
    balance float check(balance >= 0.00)
);

--● Paso 3: Insertamos dos registros a la tabla.
insert into cuentas (numero_cuenta, balance) values (1, 1000);
insert into cuentas (numero_cuenta, balance) values (2, 1000);
select * from cuentas;

--Paso 4: Si quisiéramos hacer una transferencia de $1000 desde nuestra cuenta 1 a la cuenta 2, 
--una forma de asegurarnos que el monto de nuestro balance disminuya en $1000 y el de la segunda cuenta aumenta en la misma cifra,
--podría escribirse de la siguiente manera:
begin transaction;--begin transaction = comenzar transaccion
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 1;
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 2;



--Paso 5: Verificamos el estado de la tabla.
select * from cuentas;

--Paso 6: Confirmamos la transacción con commit.
commit;
-------------transacciones=*# commit;
-------------COMMIT
-------------transacciones=#


--***************ROLLBACK***************
--Paso 7: Continuemos con el ejercicio anterior y apliquemos el uso de ROLLBACK. Para ello haremos un nuevo insert a la base de datos.
insert into cuentas (numero_cuenta, balance) values (3, 1000);
--Paso 8: Iniciamos una transacción para transferir 1000 de la cuenta 3 a la 1.
begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 3;
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 1;

select * from cuentas;

--paso 9: Para deshacer la transacción donde transferimos los 1000 de la cuenta 3 a la 1
ejecutamos el ROLLBACK; 
---------------------transacciones=*# ROLLBACK; 
---------------------ROLLBACK
---------------------transacciones=#
--Volvemos atrás y nuestra base de datos queda con la información del último commit.

--SAVE POINT

begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 3;

SAVEPOINT descuento3;
--forzando error
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 1;

ROLLBACK to descuento3;
--volvemos al sevepoint descuento3

UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 2;

commit;

select * from cuentas;


--En PostgreSQL, por defecto viene configurado el modo AUTOCOMMIT, es decir, que implícitamente 
--una vez que hemos realizado una acción sobre la base de datos, ésta realiza un COMMIT.
--● Podemos escribir en terminal 
\echo :AUTOCOMMIT
-- Esto retorna ON, es decir, que está activo.

--borrado fisico
delete from cuentas where numero_cuenta = 3;

alter table cuentas add column activa boolean ;

UPDATE cuentas set activa = true;

-- borrado logico
UPDATE cuentas set activa = false where numero_cuenta = 1;





