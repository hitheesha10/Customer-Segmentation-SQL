SELECT
    c.customer_unique_id,
    o.order_id,
    o.order_status,
    o.order_purchase_timestamp

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

LIMIT 20;

----
SELECT
    c.customer_unique_id,

    COUNT(o.order_id) AS total_orders

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

GROUP BY c.customer_unique_id

ORDER BY total_orders DESC
LIMIT 10;