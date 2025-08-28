-- Title: Count Cities and States of Customers
-- Purpose: Find how many unique cities and states customers belong to
-- Table: Target.customers
-- Author: Saisree Ekkaldevi

SELECT
  COUNT(DISTINCT(customer_city))  AS city_count,
  COUNT(DISTINCT(customer_state)) AS state_count
FROM `Target.customers`;
