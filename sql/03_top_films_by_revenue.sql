USE sakila;
SELECT f.title,
       ROUND(SUM(p.amount),2) AS revenue,
       COUNT(*) AS rentals
FROM payment p
JOIN rental r    ON r.rental_id = p.rental_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f      ON f.film_id = i.film_id
GROUP BY f.title
ORDER BY revenue DESC
LIMIT 15;