USE sakila;

SELECT i.store_id,
       ROUND(AVG(CASE
           WHEN r.return_date > DATE_ADD(r.rental_date, INTERVAL f.rental_duration DAY)
           THEN 1 ELSE 0 END) * 100, 1) AS late_pct
FROM rental r
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f      ON f.film_id = i.film_id
GROUP BY i.store_id
ORDER BY late_pct DESC;
