USE sakila;
SELECT s.store_id,
       CONCAT(st.first_name,' ',st.last_name) AS staff,
       ROUND(SUM(p.amount),2) AS revenue,
       COUNT(*) AS txns
FROM payment p
JOIN staff st ON st.staff_id = p.staff_id
JOIN store s ON s.store_id = st.store_id
GROUP BY s.store_id, st.staff_id
ORDER BY revenue DESC;
