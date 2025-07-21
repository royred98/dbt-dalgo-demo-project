with items as (
    select * from {{ ref('stg_items') }}
),
orders as (
    select * from {{ ref('dim_orders') }}
),
products as (
    select * from {{ ref('dim_products') }}
)
select
    items.order_item_id,
    items.order_id,
    orders.customer_id,
    orders.store_id,
    orders.ordered_at,
    items.sku,
    products.product_price,
    1 as quantity,
    products.product_price as item_total
from items
left join orders on items.order_id = orders.order_id
left join products on items.sku = products.sku