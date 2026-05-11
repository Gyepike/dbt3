select customer_id, first_name || ' ' || last_name
from {{ source("public", "customer") }}
