USE sakila;

WITH rents AS (
  SELECT i.store_id, COUNT(*) AS rentals
  FROM rental r
  JOIN inventory i ON i.inventory_id = r.inventory_id
  GROUP BY i.store_id
),
inv AS (
  SELECT store_id, COUNT(*) AS items
  FROM inventory
  GROUP BY store_id
)
SELECT inv.store_id,
       ROUND(rents.rentals / inv.items, 2) AS inventory_turns
FROM inv
JOIN rents ON rents.store_id = inv.store_id
ORDER BY inventory_turns DESC;
