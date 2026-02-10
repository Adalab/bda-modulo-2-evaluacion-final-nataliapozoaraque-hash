USE sakila;

-- 1. Selección de títulos únicos de películas
SELECT DISTINCT title FROM film;

-- 2. Selección de las películas con clasificación PG-13
SELECT title FROM film 
WHERE rating = 'PG-13';

-- 3. Selección del título y descripción de las películas con el adjetivo "amazing" en su descripción
SELECT title, description FROM film 
WHERE description LIKE '%amazing%';

-- 4. Selección de películas con duración mayor a 120 minutos
SELECT title FROM film 
WHERE length > 120;

-- 5. Selección de los nombres de todos los actores
SELECT first_name, last_name FROM actor;

-- 6. Selección de los actores y actrices cuyo apellido contengan Gibson
SELECT first_name, last_name FROM actor
WHERE last_name = 'Gibson';

SELECT first_name, last_name FROM actor 
WHERE last_name LIKE '%gibson%';

/* Propongo ambas opciones porque, si nos basamos en el enunciado base "busca nombre y apellidos de los actores que tengan Gibson", deberíamos usar LIKE con '%' porque puede haber nombres que contengan Gibson.
   Sin embargo, esto hace que MySQL busque la palabra en cualquier parte del texto. Es importante saber que esto obliga a la base de datos a leer toda la tabla fila por fila, lo que sería un problema si tuviéramos un millón de registros.
   Por eso, propongo usar como primera opción con WHERE. Si buscáramos el apellido exacto, el símbolo '=' sería mucho más rápido.
*/

-- 7. Selección de los nombres de los actores que tengan un identificador entre 10 y 20
SELECT first_name, last_name FROM actor
WHERE actor_id BETWEEN 10 AND 20;

-- otra forma de hacerlo al ser una variable de tipo INT es con mayor/menor: 
SELECT first_name, last_name 
FROM actor 
WHERE actor_id >= 10 AND actor_id <= 20;

-- 8. Selección tipo de películas que no estén clasificadas ni como "R" ni como "PG-13"
SELECT title FROM film 
WHERE rating NOT IN ('R', 'PG-13');

-- 9. Número de películas por clasificación:
