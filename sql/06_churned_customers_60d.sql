USE sakila;

WITH m AS (
  SELECT MAX(rental_date) AS max_d FROM rental
),
last_rent AS (
  SELECT customer_id, MAX(rental_date) AS last_rent
  FROM rental GROUP BY customer_id
),
totals AS (
  SELECT COUNT(*) AS total_customers FROM customer
),
churn AS (
  SELECT COUNT(*) AS churned_60d
  FROM last_rent, m
  WHERE last_rent.last_rent < DATE_SUB(m.max_d, INTERVAL 60 DAY)
)
SELECT churn.churned_60d,
       totals.total_customers,
       ROUND(churn.churned_60d / totals.total_customers * 100, 1) AS churn_pct
FROM churn, totals;
