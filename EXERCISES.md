# dbt Bootcamp - Learning Exercises

This document contains hands-on exercises to help you learn dbt concepts progressively.

## Exercise 1: Understanding Seeds

**Objective**: Load and explore seed data

1. Navigate to the `dbtlearn` directory
2. Run `dbt seed` to load the CSV files
3. Connect to your database and query the `raw_customers` table
4. Verify that all 5 customers were loaded correctly

**Questions**:
- What schema were the seeds loaded into?
- How many rows are in each seed table?

## Exercise 2: Building Staging Models

**Objective**: Understand how staging models clean raw data

1. Examine the `stg_customers.sql` model
2. Run only the staging models: `dbt run --select staging.*`
3. Compare the raw data with the staged data in your database

**Questions**:
- What transformations are applied in the staging layer?
- Why do we use views for staging models?
- What does `{{ ref('raw_customers') }}` do?

## Exercise 3: Creating Your First Model

**Objective**: Create a new staging model

1. Create a new file `stg_order_items.sql` in the staging folder
2. Write SQL to clean and standardize the payment data (hint: look at existing staging models)
3. Add proper column aliases and type casting
4. Run your model: `dbt run --select stg_order_items`

**Bonus**: Add a schema.yml entry with tests for your new model

## Exercise 4: Understanding Marts

**Objective**: Learn how dimensional models aggregate data

1. Examine the `dim_customers.sql` model
2. Run `dbt run --select dim_customers`
3. Query the result and find:
   - Which customer has the highest lifetime value?
   - Which customer has the most orders?

**Questions**:
- What is the difference between staging and marts?
- Why are marts materialized as tables instead of views?

## Exercise 5: Testing Your Data

**Objective**: Ensure data quality with tests

1. Run all tests: `dbt test`
2. Examine the test results
3. Intentionally break a test by modifying seed data
4. Run tests again and observe the failure

**Questions**:
- What types of tests are defined in the schema.yml files?
- What happens when a test fails?
- How would you add a custom test?

## Exercise 6: Model Dependencies

**Objective**: Understand the DAG (Directed Acyclic Graph)

1. Run `dbt compile` to generate the manifest.json
2. Use `dbt docs generate` to create documentation
3. Run `dbt docs serve` and explore the lineage graph
4. Identify the dependency chain from seeds to marts

**Questions**:
- What models does `fct_orders` depend on?
- What happens if you run `dbt run --select stg_customers+`?
- What does the `+` selector mean?

## Exercise 7: Using Macros

**Objective**: Learn to use reusable SQL code

1. Examine the `cents_to_dollars.sql` macro
2. Create a new model that uses this macro
3. Test the macro with sample data

**Challenge**: Create your own macro that:
- Takes a date column and returns the day of week
- Can be used across multiple models

## Exercise 8: Incremental Models (Advanced)

**Objective**: Optimize large table processing

1. Convert `fct_orders` to an incremental model
2. Add an `order_date` filter for incremental runs
3. Test with: `dbt run --select fct_orders` (full refresh)
4. Test with: `dbt run --select fct_orders` (incremental)

**Hint**: Use the `{{ this }}` context variable and `is_incremental()` macro

## Exercise 9: Custom Tests

**Objective**: Write advanced data quality checks

1. Create a custom generic test in the tests folder
2. Test that order amounts match payment totals
3. Add the test to your schema.yml

**Example test idea**:
- Ensure no customer has orders with negative amounts
- Check that all completed orders have payment records

## Exercise 10: Documentation

**Objective**: Document your project professionally

1. Add detailed descriptions to all models in schema.yml
2. Include column descriptions
3. Add markdown documentation with business context
4. Generate and review the documentation site

**Deliverable**: A fully documented dbt project ready for production

## Advanced Challenges

### Challenge 1: Snapshots
- Create a snapshot of the customers table to track changes over time
- Understand SCD Type 2 implementation

### Challenge 2: Sources
- Convert seeds to source definitions
- Add freshness checks
- Run `dbt source freshness`

### Challenge 3: Packages
- Install dbt_utils package
- Use `surrogate_key()` to create composite keys
- Use `date_spine()` to create date dimensions

### Challenge 4: Environments
- Create separate dev and prod targets
- Configure different schemas for each environment
- Practice promoting changes from dev to prod

## Tips for Success

1. **Read the logs**: dbt provides detailed logs - use them for debugging
2. **Use selectors**: Master `--select` and `--exclude` flags
3. **Check compiled SQL**: Look in the `target/compiled` directory
4. **Start simple**: Build complexity gradually
5. **Test everything**: Write tests as you build models
6. **Document as you go**: Don't wait until the end

## Resources

- [dbt Best Practices](https://docs.getdbt.com/guides/best-practices)
- [dbt Style Guide](https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md)
- [dbt Discourse](https://discourse.getdbt.com/)
