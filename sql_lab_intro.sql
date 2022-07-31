-- Use sakila database.
USE sakila;
-- Get all the data from tables actor, film and customer.
SELECT * from film;
SELECT * from actor;
SELECT * from customer;
-- Get film titles.
SELECT title from film;
-- Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
SELECT distinct(name) as language from language;
-- 5.1 Find out how many stores does the company have?
Select distinct(store_id) as "Store ID" From sakila.store;
-- Ans.: 2
-- 5.2 Find out how many employees staff does the company have?
Select * From sakila.staff;
Select distinct(staff_id) as "Unique Staff ID" From sakila.staff;
-- Ans.2
-- 5.3 Return a list of employee first names only?
Select first_name as "First name" From sakila.staff;