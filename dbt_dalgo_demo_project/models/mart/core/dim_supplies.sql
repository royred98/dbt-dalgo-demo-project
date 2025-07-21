select distinct
    supply_id,
    supply_name,
    supply_cost,
    perishable,
    sku
from {{ ref('stg_supplies') }}