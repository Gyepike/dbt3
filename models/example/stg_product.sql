SELECT
    id,
    name,
    price
FROM {{ source('public', 'product_dbt') }}
WHERE id IS NOT NULL