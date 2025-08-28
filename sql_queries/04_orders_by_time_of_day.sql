-- Title: Orders by Time of Day (Dawn / Morning / Afternoon / Night)
-- Purpose: Bucket order timestamps into dayparts and count orders
-- Table: Target.orders
-- Author: Saisree Ekkaldevi

SELECT
  CASE
    WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 0  AND 6  THEN 'Dawn'
    WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 7  AND 12 THEN 'Mornings'
    WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 13 AND 18 THEN 'Afternoon'
    ELSE 'Night'
  END AS time_of_day,
  COUNT(order_id) AS total_orders
FROM `Target.orders`
GROUP BY time_of_day
ORDER BY total_orders DESC;
