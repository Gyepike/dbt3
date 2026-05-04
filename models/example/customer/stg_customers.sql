WITH stg_customers AS (
    SELECT
        customer_id,
        first_name||' '||last_name as customer_name,
        email as email_address,
        address as billing_address
    FROM {{ source("public","customer")}}
)

SELECT * FROM stg_customers