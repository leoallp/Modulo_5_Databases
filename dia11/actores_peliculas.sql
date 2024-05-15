drop database if EXISTS actores_peliculas; 
create database actores_peliculas;
drop table IF EXISTS actorespeliculas;
drop table IF EXISTS actores;
drop table IF EXISTS peliculas;

-- Creación de la tabla de actores
CREATE TABLE Actores (
    id_actor INT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);

-- Creación de la tabla de películas
CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY,
    pelicula VARCHAR(30),
    genero VARCHAR(30) NOT NULL
);

-- Creación de la tabla intermedia para la relación N:N entre actores y películas
CREATE TABLE ActoresPeliculas (
    id_pelicula INT,
    id_actor INT,
    PRIMARY KEY (id_actor, id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);

--insert 
insert into actores (id_actor, nombre) VALUES (1, 'Leonardo');
insert into peliculas (id_pelicula, pelicula, genero) values (1, 'Inception', 'Intriga');

--llamando registros
select * from actores;
select * from peliculas;

--psql -U postgres
--  \i actores_peliculas.sql;   --siempre y cuando estemos en ubicados en la carpeta dia11, que es donde esta el script