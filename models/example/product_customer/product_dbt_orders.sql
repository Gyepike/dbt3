with
    base as (
        select o.id, o.customer_id, dbt.name, dbt.price
        from {{ ref("stg_orders") }} o
        left join {{ ref("stg_product_dbt") }} dbt on dbt.order_id = o.id
    )


select * 
from base
