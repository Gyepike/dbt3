{{ config(
    materialized='incremental',
    unique_key='id'
) }}

SELECT
    id,
    name,
    price
FROM {{ source('public', 'product_dbt') }}

{% if is_incremental() %}
WHERE id > (SELECT MAX(id) FROM {{ this }})
{% endif %}