SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.amount) AS total_spent,
    COUNT(o.id) AS order_count
FROM {{ ref('stg_customers') }} c
LEFT JOIN {{ ref('stg_orders') }} o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name