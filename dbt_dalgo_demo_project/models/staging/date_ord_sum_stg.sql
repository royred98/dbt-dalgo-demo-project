with order_date_cln as (
select
    ord.store_id as store_id,
    extract(MONTH from ord.order_date) as order_month,
    extract(YEAR from ord.order_date) as order_year,
    ord.subtotal,
    ord.tax_paid,
    ord.order_total

from {{source('dalgo_demo_project_raw', 'raw_orders')}} as ord
)

, date_ord_sum as (
select
    store_id,
    order_month,
    order_year,
    sum(subtotal) as total_subtotal,
    sum(tax_paid) as total_tax_paid,
    sum(order_total) as total_order_value
from order_date_cln
group by store_id, order_month, order_year
)

select * from date_ord_sum