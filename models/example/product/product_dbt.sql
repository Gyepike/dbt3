SELECT
    id,
    name,
    price,
    price * 1.20 AS price_with_vat
FROM {{ ref('stg_product') }}