--query de referencia tabla peliculas
SELECT id, pelicula, anio_estreno, director
FROM public.peliculas;

--query referencia tabla reparto
SELECT id_pelicula, actor
FROM public.reparto;

--Para este desafío necesitarás crear 2 tablas llamadas películas y reparto

--3. Obtener el ID de la película “Titanic”.
select id 
from public.peliculas 
where pelicula = 'Titanic';

--4. Listar a todos los actores que aparecen en la película "Titanic".
--lo primero que hice fue relacionar ambas tablas con un pk y fk a traves de dbeaver
ALTER TABLE public.reparto ADD CONSTRAINT reparto_peliculas_fk FOREIGN KEY (id_pelicula) REFERENCES public.peliculas(id);

SELECT reparto.actor
FROM reparto
JOIN public.peliculas ON reparto.id_pelicula = public.peliculas.id
WHERE public.peliculas.pelicula = 'Titanic';

--5. Consultar en cuántas películas del top 100 participa Harrison Ford.

select count(id_pelicula) 
from reparto 
where actor = 'Harrison Ford';

--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.

SELECT pelicula, anio_estreno
FROM public.peliculas
WHERE anio_estreno >= 1990 AND anio_estreno <= 1999
ORDER BY pelicula ASC;

--otra forma de consultar usando la clausula between
SELECT pelicula, anio_estreno
FROM public.peliculas
WHERE anio_estreno BETWEEN 1990 AND 1999
ORDER BY pelicula ASC;

--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
--nombrado para la consulta como “longitud_titulo”.
SELECT pelicula AS titulo, 
LENGTH(pelicula) AS longitud_titulo
FROM public.peliculas;

--8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(pelicula)) AS longitud_maxima
FROM public.peliculas;
