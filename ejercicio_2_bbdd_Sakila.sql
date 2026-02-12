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

-- 7.02 otra forma de hacerlo al ser una variable de tipo INT es con mayor/menor: 
SELECT first_name, last_name 
FROM actor 
WHERE actor_id >= 10 AND actor_id <= 20;

-- 8. Selección tipo de películas que no estén clasificadas ni como "R" ni como "PG-13"
SELECT title FROM film 
WHERE rating NOT IN ('R', 'PG-13');

-- 9. Número de películas por clasificación
SELECT rating, COUNT(*) AS films FROM film 
GROUP BY rating 
ORDER BY films DESC;

-- 10. Cantidad de peliculas alquiladas por cliente. 
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rents FROM customer AS c
LEFT JOIN rental AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rents DESC;

-- 11. Cantidad de películas alquiladas por categoría
SELECT 
    c.name AS genre, COUNT(r.rental_id) AS total_rents
FROM category AS c
LEFT JOIN film_category AS fc ON c.category_id = fc.category_id
LEFT JOIN inventory AS i ON fc.film_id = i.film_id
LEFT JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY genre
ORDER BY total_rents DESC;

-- 12. Promedio duración películas por clasificación
SELECT rating, AVG(length) AS length FROM film 
GROUP BY rating
ORDER BY length DESC;

-- 13. Nombre y apellidos de los actores que aparecen en la película "Indian Love"
SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id 
    FROM film_actor 
    WHERE film_id = (
        SELECT film_id 
        FROM film 
        WHERE title = 'Indian Love'
    )
);

-- 13.02. Propuesta con JOINs
SELECT a.first_name, a.last_name
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film  AS f ON fa.film_id = f.film_id
WHERE f.title = 'Indian Love';

-- 14. Selección del título de las películas que contengan "dog" o "cat" en su descripción
SELECT title FROM film
WHERE description LIKE '%cat%' OR description LIKE '%dog%';

-- 14.02 Otra forma de hacerlo sería con UNION
SELECT title FROM film
WHERE description LIKE '%cat%' 
UNION
SELECT title FROM film
WHERE description LIKE '%dog%';

-- 15. Películas lanzadas entre 2005 y 2010
SELECT title, release_year FROM film
WHERE release_year BETWEEN 2005 AND 2010;