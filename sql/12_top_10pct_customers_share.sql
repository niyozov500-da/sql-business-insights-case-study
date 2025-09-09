USE sakila;

WITH clv AS (
  SELECT customer_id, SUM(amount) AS ltv
  FROM payment
  GROUP BY customer_id
),
tot AS (
  SELECT SUM(ltv) AS total FROM clv
),
ranked AS (
  SELECT clv.*,
         NTILE(10) OVER (ORDER BY ltv DESC) AS decile
  FROM clv
)
SELECT ROUND(
  SUM(CASE WHEN decile = 1 THEN ltv END) / (SELECT total FROM tot) * 100
, 1) AS top_10pct_share_pct
FROM ranked;
