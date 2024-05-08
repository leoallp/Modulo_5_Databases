--Esto es un comentario

SELECT * FROM demo;
-- solo obtener la columna name
SELECT NAME FROM demo;
SELECT id FROM demo;
SELECT hint FROM demo;
--mezclar varias columnas
SELECT name, hint FROM demo;
SELECT hint, name from demo;

-- clausula where--> filtra, condiciona 
SELECT * FROM demo where id = 5; 
SELECT * FROM demo where hint = '300'; 

--where con or 
SELECT * FROM demo where id = 5 or id = 8; -->el id 8 aun no existe por ende no lo trae
SELECT * FROM demo where id = 5 or id = 2;

-- where con and 
SELECT * from demo WHERE id = 5 AND id = 2; --> no lo trae porq estamos llamado id 5 y 2 en un mismo archivo 
SELECT * from demo WHERE id < 5 AND id >= 2; 

--clausula limit 
SELECT * FROM demo LIMIT 3;

-- clausula where y limit 
SELECT * FROM demo where id < 6 LIMIT 3;

-- clausula order by 
SELECT * from demo order by id desc; 
SELECT * from demo order by name desc; 
SELECT * from demo order by hint ASC;

SELECT hint, name from demo order by 1 ASC;

