with source as (
  select * from {{ source('raw', 'order_items') }}
),

renamed as (
  select
    item_id,
    order_id,
    lower(product_name) as product_name,
    quantity,
    price
  from source
)

select * from renamed