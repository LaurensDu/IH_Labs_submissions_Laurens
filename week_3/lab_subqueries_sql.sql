# 1. List all films whose length is longer than the average of all the films.

SELECT title FROM sakila.film
WHERE length > (SELECT avg(length) FROM sakila.film);

# 2. How many copies of the film _Hunchback Impossible_ exist in the inventory system?

SELECT count(inventory_id) FROM sakila.inventory
WHERE film_id IN (SELECT film_id FROM sakila.film WHERE title = "Hunchback Impossible");

# 3. Use subqueries to display all actors who appear in the film _Alone Trip_.

SELECT first_name, last_name FROM sakila.actor
WHERE actor_id IN
	(SELECT actor_id FROM sakila.film_actor WHERE film_id IN
    (SELECT film_id FROM sakila.film WHERE title = "Alone Trip"));

# 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

SELECT title FROM sakila.film
WHERE film_id IN
	(SELECT film_id FROM film_category WHERE category_id IN
	(SELECT category_id FROM sakila.category WHERE name = "Family"))
GROUP BY title;

# 5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

SELECT first_name, last_name, email FROM sakila.customer
WHERE address_ID in
	(SELECT address_id FROM sakila.address WHERE city_id IN
    (SELECT city_id FROM sakila.city WHERE country_id IN
    (SELECT country_id FROM sakila.country WHERE country = "Canada")));

SELECT first_name, last_name, email FROM sakila.customer
	JOIN sakila.address USING(address_id)
	JOIN sakila.city USING(city_id)
	JOIN sakila.country USING(country_id)
WHERE country = "Canada"
GROUP BY last_name;

# 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

# 7. Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

# 8. Customers who spent more than the average payments(this refers to the average of all amount spent per each customer).