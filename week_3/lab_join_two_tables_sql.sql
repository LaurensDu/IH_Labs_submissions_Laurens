# 1. Which actor has appeared in the most films?

SELECT first_name, last_name, count(film_id) as count_film FROM sakila.actor
LEFT JOIN sakila.film_actor
USING(actor_id)
GROUP BY actor_id
ORDER BY count_film DESC
LIMIT 1;

# 2. Most active customer (the customer that has rented the most number of films)

SELECT first_name, last_name, customer_id, count(inventory_id) AS inventory_count FROM sakila.customer
LEFT JOIN sakila.rental
USING(customer_id)
GROUP BY customer_id
ORDER BY inventory_count DESC
LIMIT 1;

# 3. List number of films per `category`.

SELECT name, count(film_id) AS count_film FROM sakila.film_category
LEFT JOIN sakila.category
USING(category_id)
GROUP BY category_id
ORDER BY category_id DESC;

# 4. Display the first and last names, as well as the address, of each staff member.

SELECT first_name, last_name, address FROM sakila.staff
LEFT JOIN sakila.address
USING (address_id);

# 5. get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.

SELECT title, name FROM sakila.film
LEFT JOIN sakila.language
USING(language_id)
WHERE title LIKE "M%" AND name = 'English' OR name = 'Italian'
ORDER BY name DESC;

# 6. Display the total amount rung up by each staff member in August of 2005.

SELECT first_name, last_name, sum(amount) AS total_amount FROM sakila.staff
LEFT JOIN sakila.payment
USING(staff_id)
WHERE payment_date LIKE "2005-08%"
GROUP BY last_name;

# 7. List each film and the number of actors who are listed for that film.

SELECT title, count(actor_id) as count_actor FROM sakila.film
LEFT JOIN sakila.film_actor
USING(film_id)
GROUP BY title
ORDER BY count_actor DESC
LIMIT 10;

# 8. Using the tables `payment` and `customer` and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT first_name, last_name, sum(amount) FROM sakila.customer
LEFT JOIN sakila.payment
USING(customer_id)
GROUP BY customer_id
ORDER BY last_name ASC
LIMIT 10;

# 9. Write sql statement to check if you can find any actor who never particiapted in any film. 

SELECT first_name, last_name, count(film_id) as count_film FROM sakila.actor
LEFT JOIN sakila.film_actor
USING(actor_id)
GROUP BY last_name
ORDER BY count_film ASC
LIMIT 10;

# 10. get the addresses that has NO customers, and ends with the letter "e" 

SELECT address, sum(customer_id) AS sum_customers FROM sakila.address
LEFT JOIN sakila.customer
USING(address_id)
WHERE address LIKE "%e"
GROUP BY address
ORDER BY sum_customers ASC;

# **Optional**: what is the most rented film?

SELECT title, count(rental_id) AS count_rental FROM sakila.film
LEFT JOIN sakila.inventory
USING(film_id)
LEFT join sakila.rental
USING(inventory_id)
GROUP BY title
ORDER BY count_rental DESC
LIMIT 1;