-- 1. In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd.
-- These three actors have the same last name. So we do not want to include this last name in our output. 
-- Last name "Astaire" is present only one time with actor "Angelina Astaire",
-- hence we would want this in our output list.
USE sakila
SELECT * FROM sakila.actor;
SELECT first_name, last_name, COUNT(last_name) c FROM actor GROUP BY last_name HAVING c = 1 AND NOT c>1;


-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT first_name, last_name, COUNT(last_name) count FROM actor GROUP BY last_name HAVING count>1;
-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT * FROM rental;
SELECT customer_id, COUNT(customer_id) AS count_of_id FROM rental GROUP BY customer_id;
-- 4. Using the film table, find out how many films were released each year.
SELECT * FROM film;
SELECT release_year, COUNT(release_year) AS count_of_films_year FROM film;
-- 5. Using the film table, find out for each rating how many films were there.

SELECT * FROM film;
SELECT distinct rating FROM film;
SELECT rating, COUNT(rating) AS 'number of films per rating' FROM film
GROUP BY rating;
-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places 
SELECT rating, round(AVG(length),2) AS 'Average length of films per rating' FROM film
GROUP BY rating;
-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, round(AVG(length),2) AS 'Average length of films per rating' FROM film
GROUP BY rating
HAVING round(AVG(length),2)>120;
-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column).
-- In your output, only select the columns title, length, and the rank.
SELECT title, length FROM film
WHERE length IS NOT NULL OR length<> 0
ORDER BY length DESC;
