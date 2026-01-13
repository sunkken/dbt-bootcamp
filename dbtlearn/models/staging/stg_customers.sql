-- Staging model for customers
-- This model cleans and standardizes raw customer data

with source as (
    select * from {{ ref('raw_customers') }}
),

cleaned as (
    select
        id as customer_id,
        name as customer_name,
        email as customer_email,
        created_at::date as customer_created_at
    from source
)

select * from cleaned
