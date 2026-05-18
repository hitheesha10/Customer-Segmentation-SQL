SELECT
    c.customer_unique_id,

    MAX(o.order_purchase_timestamp)
    AS last_purchase_date,

    COUNT(o.order_id)
    AS frequency,

    ROUND(SUM(p.payment_value),2)
    AS monetary

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

INNER JOIN payments p
ON o.order_id = p.order_id

GROUP BY c.customer_unique_id;

SELECT
    c.customer_unique_id,

    CURRENT_DATE -
    MAX(DATE(o.order_purchase_timestamp))
    AS recency_days

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

GROUP BY c.customer_unique_id;

WITH rfm_base AS (

    SELECT
        c.customer_unique_id,

        CURRENT_DATE -
        MAX(DATE(o.order_purchase_timestamp))
        AS recency,

        COUNT(o.order_id)
        AS frequency,

        ROUND(SUM(p.payment_value),2)
        AS monetary

    FROM customers c

    INNER JOIN orders o
    ON c.customer_id = o.customer_id

    INNER JOIN payments p
    ON o.order_id = p.order_id

    GROUP BY c.customer_unique_id
)

SELECT *
FROM rfm_base;

WITH rfm_base AS (

    SELECT
        c.customer_unique_id,

        CURRENT_DATE -
        MAX(DATE(o.order_purchase_timestamp))
        AS recency,

        COUNT(o.order_id)
        AS frequency,

        ROUND(SUM(p.payment_value),2)
        AS monetary

    FROM customers c

    INNER JOIN orders o
    ON c.customer_id = o.customer_id

    INNER JOIN payments p
    ON o.order_id = p.order_id

    GROUP BY c.customer_unique_id
)

SELECT *
FROM rfm_base;

WITH rfm_base AS (

    SELECT
        c.customer_unique_id,

        CURRENT_DATE -
        MAX(DATE(o.order_purchase_timestamp))
        AS recency,

        COUNT(o.order_id)
        AS frequency,

        ROUND(SUM(p.payment_value),2)
        AS monetary

    FROM customers c

    INNER JOIN orders o
    ON c.customer_id = o.customer_id

    INNER JOIN payments p
    ON o.order_id = p.order_id

    GROUP BY c.customer_unique_id
)

SELECT
    customer_unique_id,

    recency,
    frequency,
    monetary,

    NTILE(5)
    OVER(ORDER BY recency ASC)
    AS recency_score,

    NTILE(5)
    OVER(ORDER BY frequency DESC)
    AS frequency_score,

    NTILE(5)
    OVER(ORDER BY monetary DESC)
    AS monetary_score

FROM rfm_base;