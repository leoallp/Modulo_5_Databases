SELECT id, pelicula, anio_estreno, director
FROM public.peliculas;

select id from peliculas where pelicula = 'Titanic';
select * from peliculas p 

select max(p.anio_estreno) from peliculas p;

select min(p.anio_estreno) from peliculas p;

--A continuación, deberás desarrollar dos consultas:
--● Devuelve la cantidad de películas del top 100 que fueron dirigidas por Peter Jackson.

select count(id) 
from peliculas where director = 'Peter Jackson';


--● Luego, mostrar el nombre y el año de esas películas

select p.pelicula, p.anio_estreno 
from peliculas p 
where p.director = 'Peter Jackson';

select p.director, count(p.director) as cantidad
from peliculas p
group by p.director 
having count(p.director) >= 2
order by cantidad desc
--limit 10
;


