-- Title: Orders by Payment Installments
-- Purpose: Find the number of orders placed based on payment installments
-- Tables: Target.payments, Target.orders
-- Author: Saisree Ekkaldevi

SELECT
  p.payment_installments,
  COUNT(DISTINCT p.order_id) AS orders
FROM `Target.payments` AS p
JOIN `Target.orders` AS o
  ON p.order_id = o.order_id
GROUP BY p.payment_installments
ORDER BY p.payment_installments;
