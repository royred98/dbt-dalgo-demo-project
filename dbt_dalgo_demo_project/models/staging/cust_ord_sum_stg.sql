with cust_sum as (
select
    ord.customer as customer_id,
    sum(ord.order_total) as total_ordered_amount,
    count(ord.id) as total_orders_count

from {{source('dalgo_demo_project_raw', 'raw_orders')}} as ord
group by ord.customer
)
 
select * from cust_sum