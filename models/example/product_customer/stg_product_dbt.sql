SELECT DBT.ORDER_ID, DBT.NAME, DBT.PRICE, DBT.id
FROM {{ source("public", "product_dbt")}} dbt