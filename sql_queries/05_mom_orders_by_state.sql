-- Title: Month-on-Month Orders by State
-- Purpose: Get the number of orders placed in each state, grouped by month-year
-- Tables: Target.orders, Target.customers
-- Author: Saisree Ekkaldevi

SELECT
  c.customer_state,
  FORMAT_DATE('%B %Y', DATE(o.order_purchase_timestamp)) AS month_year,
  COUNT(DISTINCT o.order_id) AS total_orders
FROM `Target.orders` AS o
JOIN `Target.customers` AS c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_state, month_year
ORDER BY month_year, c.customer_state;
