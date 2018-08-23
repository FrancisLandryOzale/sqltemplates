

# The dataset is from a Movie rental store and the codes will be executed in PostgreSQL

# Which movie has brought the most important income and how big was it? 

SELECT title, COUNT(rental_id) AS Number_of_rentals, COUNT(rental_id) * rental_rate AS revenue
FROM film AS f 
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY title, rental_rate
ORDER BY revenue DESC;


# Which store has sold the most?
#NB: store_id is only in the table inventory 

SELECT store_id, SUM(p.amount) AS revenue
FROM inventory AS i
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id
INNER JOIN payment AS p ON p.rental_id = r.rental_id
GROUP BY store_id
ORDER BY revenue DESC;


# How many films have been rented in the categories action, comedy and animation?

SELECT c.name, COUNT(r.rental_id) AS number_of_rentals_per_category 
FROM category AS c 
INNER JOIN film_category AS fc ON c.category_id = fc.category_id
INNER JOIN film AS f ON fc.film_id = f.film_id
INNER JOIN inventory AS i ON i.film_id = f.film_id
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id
WHERE c.name IN ('Action', 'Comedy', 'Animation')
GROUP BY c.name;


# Display emails of customers that rented more than 40 movies
# NB: email is only in the table customer

SELECT email AS Customer_email, COUNT(rental_id) AS Number_of_rentals
FROM customer AS c 
INNER JOIN rental AS r ON c.customer_id = r.customer_id
GROUP BY email 
HAVING COUNT(rental_id) >= 40;




