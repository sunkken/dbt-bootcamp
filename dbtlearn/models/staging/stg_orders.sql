-- Staging model for orders
-- This model cleans and standardizes raw order data

with source as (
    select * from {{ ref('raw_orders') }}
),

cleaned as (
    select
        id as order_id,
        customer_id,
        order_date::date as order_date,
        status as order_status,
        amount as order_amount
    from source
)

select * from cleaned
