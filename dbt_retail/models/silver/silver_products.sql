select 
    *
from
     {{ source('retail_data', 'stg_product') }}