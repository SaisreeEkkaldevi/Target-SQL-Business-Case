-- Title: Customer Distribution Across States
-- Purpose: Count distinct customers per state to understand distribution
-- Tables: Target.customers, Target.orders
-- Author: Saisree Ekkaldevi

SELECT
  c.customer_state,
  COUNT(DISTINCT c.customer_id) AS customers
FROM `Target.customers` AS c
JOIN `Target.orders` AS o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY customers DESC;
