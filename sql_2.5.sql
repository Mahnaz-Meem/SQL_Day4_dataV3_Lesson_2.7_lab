-- Select all the actors with the first name ‘Scarlett’.
USE sakila;
SELECT * from actor
where first_name='Scarlett';
-- How many films (movies) are available for rent and how many films have been rented?
SELECT count(rental_date) as  "Total rented", count(return_date) as "Total returned",
(count(rental_date)-count(return_date)) as "Still have not been returned",
(count(rental_date))-(count(rental_date)-count(return_date)) as Available From sakila.rental;
-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) as max_duration, MIN(length) as min_duration From sakila.film;
-- What's the average movie duration expressed in format (hours, minutes)?
SELECT AVG(length) as avg_duration, CONCAT(FLOOR(AVG(length)/60),':',LPAD(MOD(AVG(length),60),2,'0')) as TIME From sakila.film;
-- (I would like to know if there is another way)
-- How many distinct (different) actors' last names are there?
SELECT Distinct(last_name) from actor;
-- Since how many days has the company been operating (check DATEDIFF() function)?
Select rental_date from rental;
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) As Days from rental;
-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, dayofweek(rental_date) as Weekday, month(rental_date) as Month from rental LIMIT 20;
SELECT *, dayofweek(rental_date) as Weekday, dayname(rental_date) as Dayname, monthname(rental_date) as Month from rental LIMIT 20;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, dayofweek(rental_date) as Weekday,dayname(rental_date) as Dayname, month(rental_date) as Month,
CASE WHEN DAYOFWEEK(r.rental_date) IN (1,7) THEN 'Weekend' 
ELSE 'Workday' 
END DayType
FROM rental as r;
-- Get release years.
SELECT release_year from film;
SELECT COUNT(release_year) from film;
-- Get all films with ARMAGEDDON in the title.
SELECT *
FROM film
WHERE title LIKE '%ARMAGEDDON%';
-- Get all films which title ends with APOLLO.
SELECT *
FROM film
WHERE title LIKE '%APOLLO';
-- Get 10 the longest films.
SELECT length from film
Order by length Desc LIMIT 10;
-- How many films include Behind the Scenes content?
SELECT COUNT(film_id)
FROM film
WHERE special_features LIKE '%Behind the Scenes%';