-- 1. How many films are there for each of the categories in the category table.
-- Use appropriate join to write this query.-- 8. List number of films per category.
USE sakila;
SELECT * from category;
SELECT * from film_category;
SELECT * from film_actor;
SELECT * from film;
SELECT * from address;
SELECT * from staff;
SELECT * from actor;
SELECT * from payment;
SELECT * from customer;
SELECT * from rental;

SELECT c.category_id,
c.name AS "Category Name",
COUNT(c.name) AS Number_of_films
FROM sakila.category as c
JOIN sakila.film_category as f
ON c.category_id = f.category_id
GROUP BY c.name
order by Number_of_films DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.

SELECT r.staff_id, r.rental_date, SUM(p.amount) AS total_amount
FROM sakila.rental as r
JOIN sakila.payment as p
ON r.customer_id = p.customer_id
WHERE date_format(r.rental_date, '%M %Y') LIKE 'August 2005'
GROUP BY r.staff_id
order by total_amount DESC;

-- 3. Which actor has appeared in the most films?
SELECT concat(a.first_name, ' ', a.last_name) AS "Actor Name",
COUNT(a.actor_id) AS Number_of_films
FROM sakila.actor as a
JOIN sakila.film_actor as f
ON a.actor_id = f.actor_id
GROUP BY a.actor_id
order by Number_of_films DESC;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT concat (c.first_name, ' ', c.last_name) AS "Customer Name",
COUNT(r.rental_id) AS Number_of_films_rented
FROM sakila.customer as c
JOIN sakila.rental as r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
order by Number_of_films_rented DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name,
CONCAT(a.address,' ',a.postal_code,'-',a.district) AS Address
FROM sakila.staff as s
JOIN sakila.address as a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title,
COUNT(a.actor_id) AS Number_of_actors
FROM sakila.film as f
JOIN sakila.film_actor as a
ON f.film_id = a.film_id
GROUP BY f.title
order by Number_of_actors DESC;
-- 7. Using the tables payment and customer and the JOIN command,
-- list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.last_name, SUM(p.amount) AS total_spent
FROM sakila.customer as c
JOIN sakila.payment as p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
order by c.last_name ASC;