with ranked_cust as ()
select
    cust.name as customer_name,
    ord_sum_stg.total_ordered_amount,
    ord_sum_stg.total_orders_count,
    dense_rank() over (order by ord_sum_stg.total_orders_count desc) as rank
from
{{source('dalgo_demo_project_raw', 'raw_customers')}} as cust
join
{{ref('cust_ord_sum_stg')}} as ord_sum_stg
on cust.id = ord_sum_stg.customer_id
)

select
    customer_name,
    total_ordered_amount,
    total_orders_count,
    rank
from ranked_cust
where rank <= 3
