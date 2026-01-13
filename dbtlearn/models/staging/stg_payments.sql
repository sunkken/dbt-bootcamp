-- Staging model for payments
-- This model cleans and standardizes raw payment data

with source as (
    select * from {{ ref('raw_payments') }}
),

cleaned as (
    select
        id as payment_id,
        order_id,
        product_name,
        quantity,
        price as unit_price,
        quantity * price as total_amount
    from source
)

select * from cleaned
