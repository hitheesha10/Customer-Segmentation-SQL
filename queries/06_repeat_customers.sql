SELECT
    c.customer_unique_id,

    COUNT(o.order_id) AS total_orders

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

GROUP BY c.customer_unique_id

HAVING COUNT(o.order_id) > 1

ORDER BY total_orders DESC;