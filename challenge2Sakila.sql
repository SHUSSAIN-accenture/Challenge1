SHOW DATABASES;
USE sakila;
SHOW TABLES;
#Q1
SELECT * FROM actor;

#Q2
SELECT last_name FROM actor WHERE first_name = 'John';

#Q3
SELECT * FROM actor WHERE last_name = 'Neeson';

#Q4
SELECT *, (actor_id / 10) AS divisbile FROM actor WHERE actor_id LIKE '%0'; 

#Q5
SELECT * FROM film;
SELECT title, description FROM film WHERE film_id = 100;

#Q6
SELECT title, rating FROM film WHERE rating = 'R';

#Q7
SELECT title, rating FROM film WHERE rating != 'R';

#Q8
SELECT title, length FROM film ORDER BY length ASC LIMIT 10;

#Q9
SELECT title, length FROM film ORDER BY length DESC;

#Q10
SELECT title, special_features AS deleted_scenes FROM film WHERE special_features LIKE '%Deleted Scenes%';

#Q11
SELECT * FROM actor;
SELECT last_name, COUNT(last_name) AS non_repeated FROM actor 
GROUP BY last_name 
HAVING COUNT(last_name) = 1 
ORDER BY last_name DESC;

#Q12
SELECT last_name, COUNT(last_name) AS frequency FROM actor 
GROUP BY last_name 
HAVING COUNT(last_name) > 1 
ORDER BY frequency DESC;

#Q13
SELECT * FROM film_actor;

SELECT first_name, last_name, COUNT(fa.actor_id) AS no_films FROM film_actor fa 
JOIN actor a ON fa.actor_id=a.actor_id 
GROUP BY fa.actor_id
ORDER BY no_films DESC
LIMIT 1;

#Q14
SELECT * FROM rental;
SELECT * FROM inventory;

SELECT rental_date, rental_date + interval
	(SELECT rental_duration FROM film WHERE film_id = 1) 
	day AS due_date
	FROM rental
	WHERE rental_id = (SELECT rental_id FROM rental ORDER BY rental_id DESC LIMIT 1);


#Q15
SELECT AVG(length) FROM film;

#Q16
SELECT * FROM film_category;
SELECT * FROM category;

SELECT c.name AS Film_category, AVG(f.length) AS Average FROM film f 
JOIN film_category fc ON f.film_id=fc.film_id
JOIN category c ON fc.category_id=c.category_id
GROUP BY c.name;

#Q17
SELECT title FROM film WHERE description LIKE '%robot%';

#Q18
SELECT title, release_year FROM film WHERE release_year = 2010;

#Q19 
SELECT f.title, c.name AS category FROM film f 
JOIN film_category fc ON f.film_id=fc.film_id
JOIN category c ON fc.category_id=c.category_id
WHERE c.name = 'Horror'; 

#Q20
SELECT * FROM staff WHERE staff_id = 2;

#Q21
SELECT a.first_name, a.last_name, f.title FROM film_actor fa
JOIN actor a ON a.actor_id=fa.actor_id
JOIN film f ON fa.film_id=f.film_id
WHERE first_name = 'Fred' AND last_name = 'Costner';

#Q22
SELECT DISTINCT COUNT(country) AS no_country FROM country;

#Q23
SELECT name  FROM language ORDER BY name DESC;

#Q24
SELECT first_name, last_name FROM actor WHERE last_name LIKE '%son' ORDER BY first_name ASC;

#Q25
SELECT c.name AS category, COUNT(f.title) AS no_films FROM film f 
JOIN film_category fc ON f.film_id=fc.film_id
JOIN category c ON fc.category_id=c.category_id
GROUP BY c.name
ORDER BY no_films DESC
LIMIT 1;








