SELECT
    ROUND(SUM(payment_value),2)
AS total_revenue

FROM payments;
--- monthly revenue
SELECT
    EXTRACT(YEAR FROM order_purchase_timestamp) AS year,

    EXTRACT(MONTH FROM order_purchase_timestamp) AS month,

    ROUND(SUM(p.payment_value),2) AS revenue

FROM orders o

INNER JOIN payments p
ON o.order_id = p.order_id

GROUP BY year, month

ORDER BY year, month;
---highest spending customers
SELECT
    c.customer_unique_id,

    ROUND(SUM(p.payment_value),2)
    AS total_spent

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

INNER JOIN payments p
ON o.order_id = p.order_id

GROUP BY c.customer_unique_id

ORDER BY total_spent DESC
LIMIT 10;