-- Title: Orders Time Range
-- Purpose: Find the earliest and latest order timestamps in the dataset
-- Table: Target.orders
-- Author: Saisree Ekkaldevi

SELECT
  MIN(order_purchase_timestamp) AS start_date,
  MAX(order_purchase_timestamp) AS end_date
FROM `Target.orders`;
