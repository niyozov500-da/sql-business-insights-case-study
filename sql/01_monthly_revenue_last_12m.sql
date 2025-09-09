USE sakila;
WITH m AS (SELECT MAX(payment_date) AS max_d FROM payment)
SELECT DATE_FORMAT(p.payment_date, '%Y-%m') AS month,
       ROUND(SUM(p.amount),2) AS revenue
FROM payment p, m
WHERE p.payment_date >= DATE_SUB(m.max_d, INTERVAL 12 MONTH)
GROUP BY month
ORDER BY month;
