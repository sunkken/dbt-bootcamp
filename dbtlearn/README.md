# dbtlearn - dbt Project

This is the main dbt project directory for the bootcamp.

## Quick Start

1. Ensure you have configured your `~/.dbt/profiles.yml` file
2. Install dbt packages: `dbt deps`
3. Load seed data: `dbt seed`
4. Run models: `dbt run`
5. Test models: `dbt test`
6. View documentation: `dbt docs generate && dbt docs serve`

## Project Configuration

The project is configured in `dbt_project.yml` with:
- Staging models materialized as views
- Mart models materialized as tables
- Custom schema names for staging, marts, and raw data

## Model Layers

### Seeds (Raw Data)
- `raw_customers.csv`: Customer master data
- `raw_orders.csv`: Order transactions
- `raw_payments.csv`: Order line items/payments

### Staging Models
- `stg_customers`: Cleaned customer data
- `stg_orders`: Cleaned order data
- `stg_payments`: Cleaned payment/line item data

### Marts (Dimensional Models)
- `dim_customers`: Customer dimension with lifetime metrics
- `fct_orders`: Order fact table with enriched information

## Available Macros

- `cents_to_dollars()`: Convert cents to dollar amounts
- `generate_schema_name()`: Custom schema naming logic
- `limit_data_in_dev()`: Limit data to recent records in dev environment

## Running Specific Models

```bash
# Run only staging models
dbt run --select staging.*

# Run only marts models
dbt run --select marts.*

# Run a specific model and its dependencies
dbt run --select +fct_orders

# Run a model and everything downstream
dbt run --select stg_customers+
```
