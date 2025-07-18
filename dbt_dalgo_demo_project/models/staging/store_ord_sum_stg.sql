with store_sum as (
select
    ord.store_id as store_id,
    sum(ord.order_total) as total_ordered_amount,
    count(ord.id) as total_orders_count

from {{source('dalgo_demo_project_raw', 'raw_orders')}} as ord
group by ord.store_id
)

select * from store_sum