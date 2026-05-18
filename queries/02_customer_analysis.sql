--- top 10 states with the most customers
SELECT
    customer_state,
    COUNT(*) AS total_customers

FROM customers

GROUP BY customer_state
ORDER BY total_customers DESC
LIMIT 10;
