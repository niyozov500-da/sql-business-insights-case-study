USE sakila;

WITH first_rent AS (
  SELECT customer_id, MIN(rental_date) AS first_date
  FROM rental
  GROUP BY customer_id
),
cust_month AS (
  -- unique customers active each month
  SELECT DATE_FORMAT(p.payment_date,'%Y-%m') AS month,
         DATE(DATE_FORMAT(p.payment_date,'%Y-%m-01')) AS month_start,
         p.customer_id
  FROM payment p
  GROUP BY month, month_start, p.customer_id
)
SELECT cm.month,
       SUM(fr.first_date >= cm.month_start) AS new_customers,
       SUM(fr.first_date <  cm.month_start) AS returning_customers
FROM cust_month cm
JOIN first_rent fr ON fr.customer_id = cm.customer_id
GROUP BY cm.month
ORDER BY cm.month;
