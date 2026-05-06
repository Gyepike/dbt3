{{ config(materialized="incremental", unique_key="customer_id") }}

with
    base as (
        select c.customer_id, customer_name, o.amount, o.id as order_id
        from {{ ref("stg_customers") }} c
        left join {{ ref("stg_orders") }} o on c.customer_id = o.customer_id
    )


SELECT
    customer_id,
    customer_name,
    SUM(amount) AS total_spent,
    COUNT(order_id) AS order_count
FROM base
GROUP BY customer_id, customer_name
ORDER BY 1