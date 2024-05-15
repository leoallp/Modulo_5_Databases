psql -U postgres

--Paso 1: Iniciamos el proceso creando la base de datos hacer la conexión a ella.
create database Productos_feria;
\c productos_feria;           --ojo con las minusculas

--Paso 2: Descargar en la plataforma te dejaremos el script SQL desarrollado en Visual Studio Code con el nombre 
--“Material de apoyo - El modelo relacional (Parte I)”. Este, contiene el código de creación para las 3 tablas del modelo físico.

--● Paso 3: Cargar el fichero con
\i script_clientes_productos.sql;   --siempre y cuando estemos en ubicados en la carpeta dia10

drop database productos_feria;













