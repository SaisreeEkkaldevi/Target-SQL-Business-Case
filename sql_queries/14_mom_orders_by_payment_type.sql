-- Title: Month-on-Month Orders by Payment Type
-- Purpose: Find number of orders placed each month grouped by payment type
-- Tables: Target.orders, Target.payments
-- Author: Saisree Ekkaldevi

WITH CTE AS (
  SELECT
    FORMAT_DATE("%Y-%m", DATE(o.order_purchase_timestamp)) AS month_year,
    p.payment_type,
    o.order_id
  FROM `Target.orders` AS o
  JOIN `Target.payments` AS p
    ON o.order_id = p.order_id
)
SELECT
  month_year,
  payment_type,
  COUNT(DISTINCT order_id) AS orders
FROM CTE
GROUP BY month_year, payment_type
ORDER BY month_year, payment_type;
