{{ config(materialized="incremental", unique_key="id") }}

select id, name, price
from {{ source("public", "product_dbt") }}

{% if is_incremental() %} where id > (select max(id) from {{ this }}) {% endif %}
