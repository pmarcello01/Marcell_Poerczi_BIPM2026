-- database: sqlite-dvdrental.db
-- 1. All information about all actors
SELECT *
FROM actor;


-- 2. The titles and descriptions of all films
SELECT title, description
FROM film;


-- 3. Names of all categories
SELECT DISTINCT name
FROM category;


-- 4. List of actors ordered by last name and first name 
SELECT first_name,last_name 
FROM actor
ORDER BY last_name, first_name ASC;


-- 5. Titles and length of all films with a length of more than 120 min ordered by length from highest to lowest
SELECT title, length
FROM film
WHERE length > 120
ORDER BY length DESC;



-- 6. Titles of all films with a title starting with 'C'
SELECT title
FROM film
WHERE title LIKE 'C%';


-- 7. Titles of all films that have in the titles somewhere the phrase 'day'
SELECT title
FROM film
WHERE title LIKE '%day%';


-- 8. All unique ratings that exist in films
SELECT DISTINCT rating
FROM film;


-- rental duration in film table is the length of a rental period, in days 
-- rental rate in the film table is the cost to rent the film for the period specified in the rental_duration column (you have to pay the rental_rate for each rental_duraction)
-- 9. Film titles with their rental duration (the length of the rental period, in days) and the rental rate (the cost to rent the film for the period specified in the rental_duration column) 
SELECT title, rental_duration, rental_rate
FROM film;


-- 10. Film titles and the rental rate per day sorted by this rental rate per day from highest to lowest
SELECT title, (rental_rate/rental_duration) AS rate_per_day
FROM film
ORDER BY rate_per_day DESC;

	
-- 11. Find all the addresses where the district is empty or null
SELECT address, district
FROM address a 
 WHERE district IS NULL OR district = '';


-- 12. The total number of films 
SELECT COUNT(title)
FROM film
;


-- 13. The shortest film length
SELECT title, length
FROM film
ORDER BY length ASC
LIMIT 1;

	
-- 14. How many films have a difference between the film replacement cost and the rental rate greater than 17?
SELECT COUNT(film_id)
FROM film
WHERE (replacement_cost-rental_rate)>17;


-- 15. Titles of all Sci-Fi movies
SELECT title, name
FROM film LEFT JOIN film_category fc 
USING (film_id)
LEFT JOIN category
USING (category_id)
WHERE name = "Sci-Fi";


-- 16. All films in which William  have played // IS IT BENEFICIAL TO USE INNER JOINT HERE?
SELECT title, first_name, last_name 
FROM film LEFT JOIN film_actor
USING (film_id)
LEFT JOIN actor
USING (actor_id)
WHERE last_name= 'HACKMAN' AND first_name='WILLIAM';


-- 17. Titles and lengths of films that have the longest length among all films
SELECT title, length
FROM film
ORDER BY length DESC 
LIMIT 1;

	
-- 18. Titles and length of all films that are shorter than the average length of all films sorted by lenght in ascending order 
SELECT title, length
FROM film
WHERE length < (SELECT AVG(length) FROM film)
ORDER BY length ASC ;

	
-- 19. The number of films per rating
SELECT rating, COUNT(film_id) AS no_of_films
FROM film
GROUP BY rating;

	
-- 20. The number of films per language
SELECT name, count(film_id)
FROM 


-- 21. The number of films per category sorted from highest to lowest
SELECT category.name, count(film.title) AS no_of_films
FROM category LEFT JOIN film_category
USING (category_id)
LEFT JOIN film
USING (film_id)
GROUP BY category.name
ORDER BY no_of_films;


-- 22. Actor id, first name, and last name for all actors who have never appeared in a film rated ‘PG’. // LOOK OVER
SELECT DISTINCT actor_id, first_name, last_name
FROM actor INNER JOIN film_actor USING(actor_id)
WHERE actor.actor_id NOT IN (
	SELECT film_actor.actor_id
	FROM film LEFT JOIN film_actor USING (film_id)
	WHERE rating = 'PG'
	);



-- 23. List of actors and the number of films he/she played in ordered by that number from highest to lowest
SELECT first_name, last_name, COUNT(film_id)
FROM actor LEFT JOIN film_actor USING (actor_id)
GROUP BY first_name, last_name
ORDER BY COUNT(film_id) DESC
;
-- 24. List of all the customers with id, first and last name who have rented more than 3 horror movies




-- 25. How many actors have not acted in any film?



-- 26. How many DVDs are out on rent?



-- 27. Number of rentals per store


	
-- 28. All city we have stores in



-- 29. Names of all customers that live in the same country as one of our stores


	
-- 30. List every actor and their total run time of sci-fi films they have been in.


	
-- 31. What are the most common hours when people pay for a dvd rental? Order the payment hours by the number of payments 



-- 32. Longest film rental duration and the customer who rented that film with the title of the film (tipp: not the rental duration in the film table)



-- 33. All customers who have the same first name



-- 34. All films that are available only in one store



-- 35. All stores with their total revenue



-- 36. Create an interesting query of your own that is not already in the assignment. Give, along with the query, the question that the query is answering (as a comment) 
	
