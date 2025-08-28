-- Title: Monthly Seasonality in Orders
-- Purpose: Analyze monthly order counts to check for seasonality trends
-- Table: Target.orders
-- Author: Saisree Ekkaldevi

SELECT
  FORMAT_DATE('%B', DATE(order_purchase_timestamp)) AS month_name,
  COUNT(order_id) AS total_orders
FROM `Target.orders`
GROUP BY month_name, EXTRACT(MONTH FROM order_purchase_timestamp)
ORDER BY EXTRACT(MONTH FROM order_purchase_timestamp);
