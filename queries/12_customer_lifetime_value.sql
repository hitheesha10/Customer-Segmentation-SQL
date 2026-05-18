SELECT
    c.customer_unique_id,

    ROUND(
        SUM(p.payment_value),
        2
    ) AS customer_lifetime_value

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

INNER JOIN payments p
ON o.order_id = p.order_id

GROUP BY c.customer_unique_id

ORDER BY customer_lifetime_value DESC
LIMIT 10;