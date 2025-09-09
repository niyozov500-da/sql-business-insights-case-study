USE sakila;
SELECT c.name AS category, ROUND(SUM(p.amount),2) AS revenue
FROM payment p
JOIN rental r      ON r.rental_id = p.rental_id
JOIN inventory i   ON i.inventory_id = r.inventory_id
JOIN film_category fc ON fc.film_id = i.film_id
JOIN category c    ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY revenue DESC
LIMIT 10;