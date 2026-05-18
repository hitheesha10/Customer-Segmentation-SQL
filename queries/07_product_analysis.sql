SELECT
    ct.product_category_name_english,

    COUNT(oi.order_id) AS total_orders

FROM order_items oi

INNER JOIN products p
ON oi.product_id = p.product_id

INNER JOIN category_translation ct
ON p.product_category_name =
ct.product_category_name

GROUP BY ct.product_category_name_english

ORDER BY total_orders DESC
LIMIT 10;