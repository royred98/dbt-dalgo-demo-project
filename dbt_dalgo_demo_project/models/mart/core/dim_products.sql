select distinct
    sku,
    product_name,
    product_type,
    product_price,
    description
from {{ ref('stg_products') }}