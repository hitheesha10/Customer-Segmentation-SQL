----total customers
SELECT COUNT(*)
FROM customers;
---- total orders
SELECT COUNT(*)
FROM orders;
---- total Revenue
SELECT
    ROUND(SUM(payment_value),2)
AS total_revenue
FROM payments;

