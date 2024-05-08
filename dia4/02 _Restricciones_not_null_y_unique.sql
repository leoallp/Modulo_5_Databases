constraints = restricciones
-- Crear la tabla Empleados
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY,
    Nombre TEXT NOT NULL,
    Apellido TEXT,
    Rut TEXT UNIQUE
);

-- Inserts para la tabla Empleados
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (1, 'Juan', 'Pérez', '12345678-9');
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (2, 'María', 'Gómez', '98765432-1');
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (3, 'Carlos', 'López', '45678901-2');
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (4, 'Ana', 'Martínez', '78901234-5');
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (5, 'Pedro', 'Sánchez', '23456789-0');
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (6, 'Laura', 'Rodríguez', '56789012-3');
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (7, 'Javier', 'Fernández', '01234567-8');
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (8, 'Carmen', 'Gutiérrez', '34567890-1');
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (9, 'Roberto', 'Díaz', '67890123-4');
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (10, 'Isabel', 'Hernández', '90123456-7');

select * from empleados;

--tratamos de insertar nuevamente registro 10
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (10, 'Isabel', 'Hernández', '90123456-7'); --
--ERROR:  llave duplicada viola restricción de unicidad «empleados_pkey»
--DETAIL:  Ya existe la llave (empleadoid)=(10).

INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (NULL, 'Isabel', 'Hernández', '90123456-7');
--ERROR:  el valor nulo en la columna «empleadoid» de la relación «empleados» viola la restricción de no nulo
--DETAIL:  La fila que falla contiene (null, Isabel, Hern ndez, 90123456-7).

INSERT INTO Empleados (EmpleadoID, Rut) VALUES (11, '90123456-7');
--ERROR:  el valor nulo en la columna «nombre» de la relación «empleados» viola la restricción de no nulo
--DETAIL:  La fila que falla contiene (11, null, null, 90123456-7).

INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (10, null, null, '90123456-7');
--ERROR:  el valor nulo en la columna «nombre» de la relación «empleados» viola la restricción de no nulo
--DETAIL:  La fila que falla contiene (10, null, null, 90123456-7).

INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (11, 'Leonardo', null, '90123456-7');
--ERROR:  llave duplicada viola restricción de unicidad «empleados_rut_key»
--DETAIL:  Ya existe la llave (rut)=(90123456-7).

INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (11, 'Leonardo', null, '87654321-9');
--INSERT 0 1

select * from empleados;


--update 
update empleados
set rut = 87654321-9
where EmpleadoID = 1;
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Rut) VALUES (1, 'Juan', 'Pérez', '12345678-9');

--PODEMOS DEJAR NULL A COLUMNAS Q NO TIENES RESTRICIONES