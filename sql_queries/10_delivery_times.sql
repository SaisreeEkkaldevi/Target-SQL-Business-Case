-- Title: Delivery Time & Estimated vs Actual Difference
-- Purpose: Calculate days taken to deliver each order and the difference from estimated delivery
-- Table: Target.orders
-- Author: Saisree Ekkaldevi

SELECT
  order_id,
  DATE(order_purchase_timestamp) AS purchase_date,
  DATE(order_delivered_customer_date) AS delivered_date,
  DATE(order_estimated_delivery_date) AS estimated_date,
  DATE_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY) AS time_to_deliver,
  DATE_DIFF(order_delivered_customer_date, order_estimated_delivery_date, DAY) AS diff_estimated_delivery
FROM `Target.orders`
WHERE order_status = "delivered"
ORDER BY purchase_date;
