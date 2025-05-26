with orders as (
    select * from {{ ref('stg_orders') }}
),
order_items as (
    select * from {{ ref('stg_order_items') }}
),
joined as (
    select
        o.order_id,
        o.customer_id,
        o.order_date,
        sum(oi.quantity * oi.price) as order_total
    from orders o
    join order_items oi on o.order_id = oi.order_id
    group by o.order_id, o.customer_id, o.order_date
)

select * from joined
