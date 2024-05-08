constraints = restricciones
-- Crear la tabla Autores
CREATE TABLE Autores (
    AutorID INT PRIMARY KEY,           --es redundante el autorid, solo id
    NombreAutor VARCHAR(50) NOT NULL
);

-- Crear la tabla Libros
CREATE TABLE Libros (
    LibroID INT PRIMARY KEY,           --es redundante el libroid, solo id 
    Titulo VARCHAR(100) NOT NULL,
    AutorID INT,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

-- Inserts adicionales para la tabla Autores
INSERT INTO Autores (AutorID, NombreAutor) VALUES (2, 'Autor A');
INSERT INTO Autores (AutorID, NombreAutor) VALUES (3, 'Autor B');
INSERT INTO Autores (AutorID, NombreAutor) VALUES (4, 'Autor C');
INSERT INTO Autores (AutorID, NombreAutor) VALUES (5, 'Autor D');
INSERT INTO Autores (AutorID, NombreAutor) VALUES (6, 'Autor E');
INSERT INTO Autores (AutorID, NombreAutor) VALUES (7, 'Autor F');
INSERT INTO Autores (AutorID, NombreAutor) VALUES (8, 'Autor G');
INSERT INTO Autores (AutorID, NombreAutor) VALUES (9, 'Autor H');
INSERT INTO Autores (AutorID, NombreAutor) VALUES (10, 'Autor I');
select * from autores
-- Inserts adicionales para la tabla Libros
INSERT INTO Libros (LibroID, Titulo, AutorID) VALUES (102, 'Libro 1', 2);
INSERT INTO Libros (LibroID, Titulo, AutorID) VALUES (103, 'Libro 2', 3);
INSERT INTO Libros (LibroID, Titulo, AutorID) VALUES (104, 'Libro 3', 4);
INSERT INTO Libros (LibroID, Titulo, AutorID) VALUES (105, 'Libro 4', 5);
INSERT INTO Libros (LibroID, Titulo, AutorID) VALUES (106, 'Libro 5', 6);
INSERT INTO Libros (LibroID, Titulo, AutorID) VALUES (107, 'Libro 6', 7);
INSERT INTO Libros (LibroID, Titulo, AutorID) VALUES (108, 'Libro 7', 8);
INSERT INTO Libros (LibroID, Titulo, AutorID) VALUES (109, 'Libro 8', 9);
INSERT INTO Libros (LibroID, Titulo, AutorID) VALUES (110, 'Libro 9', 10);

INSERT INTO Libros (LibroID, Titulo, AutorID) VALUES (111, 'Libro 10', 1);    --error id no establecido en tabla autores
--ERROR:  inserción o actualización en la tabla «libros» viola la llave foránea «libros_autorid_fkey»
--DETAIL:  La llave (autorid)=(1) no está presente en la tabla «autores».

select * from Libros

--DELETE
delete from autores
where autorid = 2;    --para poder eliminar un autor primero hay que eliminar el libro ya que libros tiene el id de autor enlazado
--ERROR:  update o delete en «autores» viola la llave foránea «libros_autorid_fkey» en la tabla «libros»
--DETAIL:  La llave (autorid)=(2) todavía es referida desde la tabla «libros».

delete from libros --primero eliminamos el id de libros 
where autorid = 2; 

delete from autores -- ahora si podremos eliminar el id desde la tabla autores
where autorid = 2;













