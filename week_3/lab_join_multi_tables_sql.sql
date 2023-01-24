# 1. Write a query to display for each store its store ID, city, and country.
SELECT store_id, city, country FROM sakila.store
JOIN sakila.address
USING(address_id)
JOIN sakila.city
USING(city_id)
JOIN sakila.country
USING(country_id)
GROUP BY store_id;

# 2. Write a query to display how much business, in dollars, each store brought in.

SELECT store_id, sum(amount) AS total_amount FROM sakila.store
JOIN sakila.staff
USING(store_id)
JOIN sakila.payment
USING(staff_id)
GROUP BY store_id;

# 3. What is the average running time(length) of films by category?

SELECT name, avg(length) FROM sakila.film
JOIN sakila.film_category
USING(film_id)
JOIN sakila.category
USING(category_id)
GROUP BY name;

# 4. Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)

SELECT name, avg(length) AS avg_length FROM sakila.film
JOIN sakila.film_category
USING(film_id)
JOIN sakila.category
USING(category_id)
GROUP BY name
ORDER BY avg_length DESC
LIMIT 5;

# 5. Display the top 5 most frequently(number of times) rented movies in descending order.

SELECT title, count(rental_id) AS count_rental FROM sakila.film
JOIN sakila.inventory
USING(film_id)
JOIN sakila.rental
USING(inventory_id)
GROUP BY title
ORDER BY count_rental DESC
LIMIT 5;

# 6. List the top five genres in gross revenue in descending order.

SELECT name, sum(amount) AS total_amount FROM sakila.film
JOIN sakila.inventory
USING(film_id)
JOIN sakila.rental
USING(inventory_id)
JOIN sakila.payment
USING(rental_id)
JOIN sakila.film_category
USING(film_id)
JOIN sakila.category
USING(category_id)
GROUP BY name
ORDER BY total_amount DESC
LIMIT 5;

# 7. Is "Academy Dinosaur" available for rent from Store 1?

SELECT distinct(store_id), title FROM sakila.film
JOIN sakila.inventory
USING(film_id)
JOIN sakila.rental
USING(inventory_id)
WHERE title = 'Academy Dinosaur' AND store_id = '1'
ORDER BY title;