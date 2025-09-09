USE sakila;

SELECT c.name AS category,
       ROUND(AVG(f.rental_rate),2) AS avg_rental_rate,
       ROUND(AVG(f.length),1)     AS avg_minutes
FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c      ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY avg_rental_rate DESC;
