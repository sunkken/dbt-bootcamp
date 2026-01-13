-- Order fact table with enriched information
-- This model combines orders with customer and payment details

with orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        order_id,
        sum(total_amount) as total_payment_amount,
        count(distinct product_name) as unique_products,
        sum(quantity) as total_items
    from payments
    group by order_id
),

final as (
    select
        o.order_id,
        o.customer_id,
        c.customer_name,
        c.customer_email,
        o.order_date,
        o.order_status,
        o.order_amount,
        coalesce(op.total_payment_amount, 0) as payment_amount,
        coalesce(op.unique_products, 0) as unique_products,
        coalesce(op.total_items, 0) as total_items
    from orders o
    left join customers c on o.customer_id = c.customer_id
    left join order_payments op on o.order_id = op.order_id
)

select * from final
