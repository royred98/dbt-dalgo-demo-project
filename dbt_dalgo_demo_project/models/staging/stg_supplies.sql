with source as (
    select * from {{ source('raw', 'raw_supplies') }}
),
renamed as (
    select
        id as supply_id,
        name as supply_name,
        cost as supply_cost,
        perishable,
        sku
    from source
)
select * from renamed