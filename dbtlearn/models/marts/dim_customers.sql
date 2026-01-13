-- Customer dimension with lifetime metrics
-- This model aggregates customer data with their order history

with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

customer_orders as (
    select
        customer_id,
        count(*) as total_orders,
        sum(case when order_status = 'completed' then 1 else 0 end) as completed_orders,
        sum(case when order_status = 'completed' then order_amount else 0 end) as lifetime_value,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date
    from orders
    group by customer_id
),

final as (
    select
        c.customer_id,
        c.customer_name,
        c.customer_email,
        c.customer_created_at,
        coalesce(co.total_orders, 0) as total_orders,
        coalesce(co.completed_orders, 0) as completed_orders,
        coalesce(co.lifetime_value, 0) as lifetime_value,
        co.first_order_date,
        co.most_recent_order_date
    from customers c
    left join customer_orders co on c.customer_id = co.customer_id
)

select * from final
