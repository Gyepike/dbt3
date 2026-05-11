SELECT
    id,
    customer_id,
    amount
FROM {{ source('public', 'orders') }}