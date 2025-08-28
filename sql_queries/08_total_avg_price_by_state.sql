-- Title: Total & Average Order Price by State
-- Purpose: Calculate the total and average value of order price for each state
-- Tables: Target.order_items, Target.orders, Target.customers
-- Author: Saisree Ekkaldevi

SELECT
  c.customer_state AS state,
  SUM(oi.price) AS total_order_price,
  AVG(oi.price) AS avg_order_price
FROM `Target.order_items` AS oi
JOIN `Target.orders` AS o
  ON oi.order_id = o.order_id
JOIN `Target.customers` AS c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_order_price DESC;
