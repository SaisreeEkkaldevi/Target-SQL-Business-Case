-- Title: Top 5 States with Fastest Deliveries vs Estimated
-- Purpose: Identify states where deliveries were completed the earliest compared to the estimated delivery date
-- Tables: Target.orders, Target.customers
-- Author: Saisree Ekkaldevi

WITH state_diff AS (
  SELECT
    c.customer_state,
    AVG(ABS(DATE_DIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date, DAY))) AS avg_days_early
  FROM `Target.orders` AS o
  JOIN `Target.customers` AS c
    ON o.customer_id = c.customer_id
  WHERE o.order_status = 'delivered'
    AND o.order_delivered_customer_date IS NOT NULL
    AND o.order_estimated_delivery_date IS NOT NULL
    AND o.order_delivered_customer_date < o.order_estimated_delivery_date
  GROUP BY c.customer_state
)
SELECT
  customer_state,
  avg_days_early
FROM state_diff
ORDER BY avg_days_early DESC
LIMIT 5;
