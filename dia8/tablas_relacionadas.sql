--● Paso 1: Creamos las tablas libros y autores con el siguiente código.

CREATE TABLE autores (
id INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);


CREATE TABLE libros (
id INT NOT NULL,
titulo VARCHAR(255) NOT NULL,
autor_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (autor_id) REFERENCES autores (id) 
);


--Paso 2: Insertamos algunos datos en ambas tablas

INSERT INTO autores (id, nombre)
VALUES
(1, 'Juan Pérez'),
(2, 'María García'),
(3, 'Pedro Rodríguez');

INSERT INTO libros (id, titulo, autor_id)
VALUES
(1, 'El Quijote', 1),
(2, 'La Divina Comedia', 2),
(3, 'Hamlet', 3);

select * from autores;
select * from libros;

--Paso 3: Consultamos los datos de ambas tablas

SELECT libros.titulo, autores.nombre
FROM libros
INNER JOIN autores
ON libros.autor_id = autores.id;

--Paso 4: Comprobación de la restricción de clave foránea.

delete from autores;
--ERROR: update or delete on table "autores" violates foreign key constraint
--"libros_autor_id_fkey" on table "libros"
--DETAIL: Key (id)=(1) is still referenced from table "libros".

--En el ejercicio borramos la tabla hija libros. ¿Qué pasaría si eliminamos la tabla hija?
delete from libros;

--En este caso, sí es posible eliminar los registros de libros dado que la restricción se aplica del lado de la referencia (la tabla padre).
--ahora si podremos eliminar la tabla autores

-- borrado en cascada

drop table autores CASCADE; 

drop table libros; 


CREATE TABLE libros (
id INT NOT NULL,
titulo VARCHAR(255) NOT NULL,
autor_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (autor_id) REFERENCES autores (id) ON DELETE CASCADE; --> si agregamos esto podremos eliminar registros de la tabla autores sin restricciones de FK
);
































