with base as (
SELECT O.ID, O.CUSTOMER_ID, DBT.NAME, DBT.PRICE
FROM 
{{ref("stg_orders")}} o 
LEFT JOIN 
{{ref("stg_product_dbt")}} dbt
ON DBT.ORDER_ID = O.ID
) 

SELECT *
FROM base