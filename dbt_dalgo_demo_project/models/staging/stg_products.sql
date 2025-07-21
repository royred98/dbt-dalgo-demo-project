with source as (
    select * from {{ source('raw', 'raw_products') }}
),
renamed as (
    select
        sku,
        name as product_name,
        type as product_type,
        price as product_price,
        description
    from source
)
select * from renamed