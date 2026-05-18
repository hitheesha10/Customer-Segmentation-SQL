SELECT
    customer_unique_id,

    total_spent,

    PERCENT_RANK()
    OVER(
        ORDER BY total_spent
    ) AS percentile_rank

FROM (

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

) ranked_customers;