-- Title: Top 5 States with Highest & Lowest Avg Delivery Time
-- Purpose: Identify states with the fastest and slowest average delivery times
-- Table: Target.orders, Target.customers
-- Author: Saisree Ekkaldevi

WITH delivery_time AS (
  SELECT
    o.order_id,
    c.customer_state AS state,
    DATE_DIFF(DATE(o.order_delivered_customer_date), DATE(o.order_purchase_timestamp), DAY) AS delivery_days
  FROM `Target.orders` AS o
  JOIN `Target.customers` AS c
    ON o.customer_id = c.customer_id
  WHERE o.order_status = 'delivered'
    AND o.order_delivered_customer_date IS NOT NULL
),
state_avg AS (
  SELECT
    state,
    AVG(delivery_days) AS avg_delivery_days
  FROM delivery_time
  GROUP BY state
),
top5 AS (
  SELECT state, avg_delivery_days, 'Slowest' AS category
  FROM state_avg
  ORDER BY avg_delivery_days DESC
  LIMIT 5
),
bottom5 AS (
  SELECT state, avg_delivery_days, 'Fastest' AS category
  FROM state_avg
  ORDER BY avg_delivery_days ASC
  LIMIT 5
)
SELECT * FROM top5
UNION ALL
SELECT * FROM bottom5
ORDER BY category,
         CASE WHEN category = 'Slowest' THEN -avg_delivery_days ELSE avg_delivery_days END;
