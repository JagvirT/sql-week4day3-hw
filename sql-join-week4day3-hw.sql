-- 1. List all customers who live in Texas (use
-- JOINs)


SELECT customer.first_name, customer.last_name, address.district
FROM address 
INNER JOIN customer
ON address.address_id=customer.address_id
WHERE district='Texas';


-- 2. Get all payments above $6.99 with the Customer's Full
-- Name

SELECT customer.first_name, customer.last_name, payment.amount
FROM payment
INNER JOIN customer
ON payment.customer_id=customer.customer_id
WHERE payment.amount > 7.00;


-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT customer_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING sum(amount) > 175
    ORDER BY sum(amount) DESC
);


-- 4. List all customers that live in Nepal (use the city
-- table)


SELECT first_name, last_name, district
FROM (
    SELECT first_name, last_name, district
    FROM customer
    INNER JOIN address
    ON customer.address_id = address.address_id
    INNER JOIN city
    ON address.city_id = city.city_id
) AS customers_nepal
WHERE district = 'Nepal';


-- 5. Which staff member had the most
-- transactions?


SELECT staff.staff_id, COUNT(rental.staff_id)
FROM staff 
INNER JOIN rental
ON staff.staff_id=rental.staff_id
GROUP BY staff.staff_id;

-- ANSWER: staff_id 1


-- 6. How many movies of each rating are
-- there?


SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;


-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

SELECT first_name, last_name, amount
FROM (
    SELECT first_name, last_name, amount
    FROM customer
    INNER JOIN payment
    ON customer.customer_id = payment.customer_id
) AS customers_above_seven
WHERE amount > 7;


-- 8. How many free renatals did our store give away?

SELECT first_name, last_name, amount
FROM (
    SELECT first_name, last_name, amount
    FROM customer
    INNER JOIN payment
    ON customer.customer_id= payment.customer_id
) as free_rentals
WHERE amount = 0;

