USE sakila;

SELECT CONCAT(a.first_name,' ',a.last_name) AS actor,
       ROUND(SUM(p.amount),2) AS revenue
FROM payment p
JOIN rental r    ON r.rental_id = p.rental_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film_actor fa ON fa.film_id = i.film_id
JOIN actor a     ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY revenue DESC
LIMIT 15;
