-- Title: Orders by Year (Trend)
-- Purpose: Check year-over-year growth in orders
-- Table: Target.orders
-- Author: Saisree Ekkaldevi

SELECT
  EXTRACT(YEAR FROM order_purchase_timestamp) AS order_year,
  COUNT(order_id) AS total_orders
FROM `Target.orders`
GROUP BY order_year
ORDER BY order_year;
