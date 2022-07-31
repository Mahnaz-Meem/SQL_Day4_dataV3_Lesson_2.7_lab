-- 1. Write a query to display for each store its store ID, city, and country.
USE Sakila;

SELECT c.city,
co.country,
s.store_id
FROM sakila.city as c
JOIN sakila.country as co
ON c.country_id = co.country_id
JOIN sakila.address as a
ON c.city_id = a.city_id
JOIN sakila.staff as s
ON a.address_id=s.address_id;
-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT SUM(p.amount),
s.store_id
FROM sakila.payment as p
JOIN sakila.staff as s
ON p.staff_id = s.staff_id
GROUP by store_id;
-- 3. Which film categories are longest?
SELECT c.category_id, MAX(f.length) as Longest_duration,
f.title as "Movie Name"
FROM sakila.film as f
JOIN sakila.film_category as c
ON f.film_id = c.film_id
GROUP by category_id
ORDER BY Longest_duration DESC;
-- 4. Display the most frequently rented movies in descending order.
Select title, rental_rate from sakila.film
ORDER BY rental_rate DESC;
-- 5. List the top five genres in gross revenue in descending order.
SELECT ct.name as Genres,
COUNT(ct.name) as 'Num_Film_that_generated_Revenue'
from sakila.category as ct
JOIN sakila.film_category as fc
ON ct.category_id = fc.category_id
JOIN sakila.film as f
ON fc.film_id = f.film_id
group by Genres
ORDER BY Num_Film_that_generated_Revenue DESC LIMIT 5; 
-- 6. Is "Academy Dinosaur" available for rent from Store 1?
SELECT f.title as Film_title, r.rental_date,
r.return_date
from sakila.film as f
JOIN inventory as i
ON f.film_id = i.film_id
JOIN rental as r
ON r.inventory_id = i.inventory_id
group by "Academy Dinosaur"; 
-- So, it is available.
-- 7. Get all pairs of actors that worked together.
SELECT concat(a.actor_id, "-", a.first_name, ' ', a.last_name) AS "Actor",
Concat(a1.actor_id, "-", a1.first_name, ' ', a1.last_name) AS "with Actor"
from sakila.actor as a
JOIN sakila.actor as a1
ON a.first_name = a1.first_name
AND a.actor_id <> a1.actor_id;
-- 8. Get all pairs of customers that have rented the same film more than 3 times.
-- 9. For each film, list actor that has acted in more films.
SELECT f.title, concat(a.first_name, ' ', a.last_name) AS "Actor Name",
COUNT(fa.film_id) AS Number_of_films
FROM sakila.actor as a
JOIN sakila.film_actor as fa
ON a.actor_id = fa.actor_id
JOIN sakila.film as f
ON fa.film_id=f.film_id
GROUP BY fa.film_id
order by Number_of_films DESC;