-- MULTI JOIN

SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM actor;

SELECT *
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id;

-- ADD CONSTRAINTS / FILTERS

SELECT title, first_name, last_name
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE title LIKE 'B%'
ORDER BY film.film_id;

-- SUBQUERIES
-- two queries split apart that later become 1
-- query 1:
-- look through payment table and find customer_ids who spent more than $100
SELECT customer_id
FROM payment
WHERE amount > 5
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount) DESC;

--query 2:
-- get their info (names and email)
SELECT first_name, last_name, email
FROM customer;

-- put them all together to end up with the SUBQUERY
-- subqueries can occur in 3 places..
-- SELECT, FROM, WHERE

-- WHERE CLAUSE SUB QUERY
SELECT first_name, last_name, email, customer.customer_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 5
    GROUP BY customer_id
    HAVING SUM(amount) > 100
    ORDER BY SUM(amount) DESC
);

-- FROM CLAUSE SUB QUERY
-- get all actors who acted in movie Mulan Moon
SELECT first_name, last_name 
FROM (
    SELECT first_name, last_name, title
    FROM film
    INNER JOIN film_actor
    ON film.film_id = film_actor.film_id
    INNER JOIN actor
    ON film_actor.actor_id = actor.actor_id
    WHERE title LIKE 'M%'
) AS complete_database_of_movies_and_their_actors
WHERE title = 'Mulan Moon';

-- SELECT CLAUSE SUB QUERY
-- not the most useful.
SELECT first_name, last_name, (
    SELECT COUNT(*)
    FROM rental
)
FROM customer;


-- SELECT 
SELECT customer_id, SUM(amount)
FROM payment
WHERE amount > 5
GROUP BY customer_id
HAVING SUM(amount) IN  (
    SELECT DISTINCT amount
    FROM payment
    );