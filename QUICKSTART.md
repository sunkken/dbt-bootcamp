# Quick Start Guide

Get up and running with dbt in 5 minutes!

## Prerequisites

- Python 3.8+ installed
- A database (PostgreSQL, Snowflake, BigQuery, etc.)
- Basic SQL knowledge

## Step 1: Install dbt (2 minutes)

Choose your database adapter and install:

```bash
# For PostgreSQL
pip install dbt-core dbt-postgres

# For Snowflake
pip install dbt-core dbt-snowflake

# For BigQuery
pip install dbt-core dbt-bigquery
```

Verify installation:
```bash
dbt --version
```

## Step 2: Configure Your Connection (2 minutes)

1. Create the dbt profiles directory:
   ```bash
   mkdir -p ~/.dbt
   ```

2. Copy the example profile:
   ```bash
   cp dbtlearn/profiles.yml.example ~/.dbt/profiles.yml
   ```

3. Edit `~/.dbt/profiles.yml` with your database credentials

4. Test your connection:
   ```bash
   cd dbtlearn
   dbt debug
   ```

   ✅ You should see "All checks passed!"

## Step 3: Load Sample Data (30 seconds)

```bash
cd dbtlearn
dbt seed
```

This loads 3 CSV files with sample customer, order, and payment data.

## Step 4: Build Your Models (30 seconds)

```bash
dbt run
```

This creates:
- 3 staging views (cleaned data)
- 2 mart tables (business-ready analytics)

## Step 5: Test Your Data (30 seconds)

```bash
dbt test
```

This runs 32 data quality tests to ensure everything is working correctly.

## Step 6: View Documentation (30 seconds)

```bash
dbt docs generate
dbt docs serve
```

Open your browser to see:
- Model descriptions
- Column documentation
- Data lineage graph
- Test results

## What's Next?

### Option 1: Explore the Project
- Check out the models in `models/staging/` and `models/marts/`
- Read the schema.yml files to understand the tests
- Look at the seed data in `seeds/`

### Option 2: Start Learning
- Open [EXERCISES.md](EXERCISES.md) for hands-on exercises
- Follow along with the course materials
- Experiment and break things!

### Option 3: Customize
- Add your own seed data
- Create new models
- Write custom tests
- Build your own macros

## Common Commands Reference

```bash
# Run all models
dbt run

# Run a specific model
dbt run --select stg_customers

# Run a model and everything downstream
dbt run --select stg_customers+

# Run all models in a directory
dbt run --select staging.*

# Run all tests
dbt test

# Test a specific model
dbt test --select stg_customers

# Load/reload seed data
dbt seed

# Generate documentation
dbt docs generate
dbt docs serve

# Compile without running
dbt compile

# Clean generated files
dbt clean

# Show model lineage
dbt ls --select +fct_orders+
```

## Troubleshooting

### "Database Error: Connection refused"
- Check your profiles.yml credentials
- Ensure your database is running
- Run `dbt debug` to diagnose

### "Compilation Error: dbt could not find a package"
- Remove packages.yml if you don't need packages
- Or run `dbt deps` to install packages

### "Runtime Error: Database does not exist"
- Create the database in your data warehouse
- Update profiles.yml with correct database name

### "Could not find profile"
- Ensure profiles.yml is in ~/.dbt/
- Check that the profile name matches dbt_project.yml

## Getting Help

- 📖 [dbt Documentation](https://docs.getdbt.com/)
- 💬 [dbt Slack Community](https://www.getdbt.com/community/)
- 🗣️ [dbt Discourse](https://discourse.getdbt.com/)
- 🎓 [Course Resources](https://www.udemy.com/course/complete-dbt-data-build-tool-bootcamp-zero-to-hero-learn-dbt/)

## Success Indicators

After completing this quick start, you should be able to:

✅ Run dbt commands successfully  
✅ Connect to your database  
✅ Load seed data  
✅ Build staging and mart models  
✅ Run data quality tests  
✅ View documentation in your browser  

**Congratulations!** You're ready to dive deeper into dbt! 🎉
