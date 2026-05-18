CREATE VIEW customer_rfm_view AS

SELECT
    c.customer_unique_id,

    COUNT(o.order_id)
    AS total_orders,

    ROUND(SUM(p.payment_value),2)
    AS total_spent

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

INNER JOIN payments p
ON o.order_id = p.order_id

GROUP BY c.customer_unique_id;