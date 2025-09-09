USE sakila;
SELECT CONCAT(c.first_name,' ',c.last_name) AS customer,
       ROUND(SUM(p.amount),2) AS LTV
FROM payment p
JOIN customer c ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY LTV DESC
LIMIT 15;
