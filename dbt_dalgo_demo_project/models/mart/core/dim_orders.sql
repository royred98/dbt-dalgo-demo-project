select distinct
    order_id,
    customer_id,
    store_id,
    ordered_at,
    subtotal,
    tax_paid,
    order_total
from {{ ref('stg_orders') }}