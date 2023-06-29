-- Week 5 - Wednesday 
-- Questions  

-- 1. List all customers who live in Texas (use JOINs)
SELECT customer_id, address, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas'

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99

-- 3. Show all customers names who have made payments over $175(use subqueries) 
SELECT first_name, last_name, amount
FROM (
    SELECT *
    FROM customer
    INNER JOIN payment
    ON customer.customer_id = payment.customer_id
) AS customer_payments
WHERE amount > 175

-- 4. List all customers that live in Nepal (use the city table)  **
SELECT first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN LATERAL(
    SELECT country
    FROM country
    WHERE city.country_id = country.country_id) profiles ON true
WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions?

-- Answer: Staff member Mike Hillyer, staff ID 1, has the most transactions at 8,040.

SELECT first_name, last_name, staff.staff_id, count(rental_id)
FROM staff
INNER JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY first_name, last_name, staff.staff_id
ORDER BY count(rental_id) DESC;

-- 6. How many movies of each rating are there?  

SELECT rating, count(film_id)
FROM film
GROUP BY rating

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries) 

SELECT customer.customer_id, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
);

-- 8. How many free rentals did our stores give away? **

-- Answer: None

SELECT *
FROM payment
WHERE amount = 0