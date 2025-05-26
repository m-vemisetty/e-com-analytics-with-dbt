with orders as (
    select * from {{ ref('int_orders_summary') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    count(o.order_id) as total_orders,
    sum(o.order_total) as total_revenue,
    min(o.order_date) as first_order_date,
    max(o.order_date) as last_order_date
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.first_name, c.last_name, c.email
