-- Title: Total & Average Freight by State
-- Purpose: Calculate the total and average freight value for each state
-- Tables: Target.order_items, Target.orders, Target.customers
-- Author: Saisree Ekkaldevi

SELECT
  c.customer_state AS state,
  SUM(oi.freight_value) AS total_freight_value,
  AVG(oi.freight_value) AS avg_freight_value
FROM `Target.order_items` AS oi
JOIN `Target.orders` AS o
  ON oi.order_id = o.order_id
JOIN `Target.customers` AS c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY state;
