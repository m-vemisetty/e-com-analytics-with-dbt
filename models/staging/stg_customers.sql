with source as (
  select * from {{ source('raw', 'customers') }}
),

renamed as (
  select
    customer_id,
    lower(first_name) as first_name,
    lower(last_name) as last_name,
    email,
    created_at
  from source
)

select * from renamed
