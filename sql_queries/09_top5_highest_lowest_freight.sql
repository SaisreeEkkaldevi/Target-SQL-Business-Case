-- Title: Top 5 States with Highest & Lowest Avg Freight Value
-- Purpose: Identify states with the highest and lowest average freight values
-- Tables: Target.order_items, Target.orders, Target.customers
-- Author: Saisree Ekkaldevi

WITH order_freight AS (
  SELECT
    o.order_id,
    c.customer_state AS state,
    SUM(oi.freight_value) AS order_freight
  FROM `Target.order_items` AS oi
  JOIN `Target.orders` AS o USING (order_id)
  JOIN `Target.customers` AS c
    ON o.customer_id = c.customer_id
  GROUP BY o.order_id, state
),
state_avg AS (
  SELECT
    ofr.state,
    AVG(ofr.order_freight) AS avg_freight
  FROM order_freight AS ofr
  GROUP BY ofr.state
),
top5 AS (
  SELECT state, avg_freight, 'Highest' AS category
  FROM state_avg
  ORDER BY avg_freight DESC
  LIMIT 5
),
bottom5 AS (
  SELECT state, avg_freight, 'Lowest' AS category
  FROM state_avg
  ORDER BY avg_freight ASC
  LIMIT 5
)
SELECT * 
FROM top5
UNION ALL
SELECT * 
FROM bottom5
ORDER BY category,
         CASE WHEN category = 'Highest' THEN -avg_freight ELSE avg_freight END;
