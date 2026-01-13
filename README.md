# dbt Bootcamp - Complete dbt Course Repository

Welcome to the dbt Bootcamp repository! This repository contains all the materials and exercises for learning dbt (data build tool) from beginner to advanced levels.

🎓 **Course**: [Complete dbt (Data Build Tool) Bootcamp: Zero to Hero](https://www.udemy.com/course/complete-dbt-data-build-tool-bootcamp-zero-to-hero-learn-dbt/)

## 📋 Table of Contents

- [About](#about)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Running the Project](#running-the-project)
- [Learning Path](#learning-path)
- [Resources](#resources)

## 🎯 About

This repository is structured as a hands-on learning environment for dbt. It includes:

- Sample data models demonstrating dbt best practices
- Staging and mart layer examples
- Data quality tests
- Custom macros
- Documentation
- Seeds for practice data

## ✅ Prerequisites

Before you begin, ensure you have the following installed:

- Python 3.8 or higher
- pip (Python package manager)
- A supported database (PostgreSQL, Snowflake, BigQuery, Redshift, etc.)
- Git

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/sunkken/dbt-bootcamp.git
cd dbt-bootcamp
```

### 2. Install dbt

Install dbt with your preferred database adapter:

```bash
# For PostgreSQL
pip install dbt-core dbt-postgres

# For Snowflake
pip install dbt-core dbt-snowflake

# For BigQuery
pip install dbt-core dbt-bigquery

# For Redshift
pip install dbt-core dbt-redshift
```

### 3. Configure Your Profile

1. Copy the example profile configuration:
   ```bash
   cp dbtlearn/profiles.yml.example ~/.dbt/profiles.yml
   ```

2. Edit `~/.dbt/profiles.yml` with your database credentials

3. Test your connection:
   ```bash
   cd dbtlearn
   dbt debug
   ```

## 📁 Project Structure

```
dbtlearn/
├── analyses/          # Ad-hoc analytical queries
├── macros/           # Reusable SQL macros
│   ├── cents_to_dollars.sql
│   ├── generate_schema_name.sql
│   └── limit_data_in_dev.sql
├── models/           # dbt models
│   ├── staging/      # Staging models (views)
│   │   ├── stg_customers.sql
│   │   ├── stg_orders.sql
│   │   ├── stg_payments.sql
│   │   └── schema.yml
│   └── marts/        # Final dimensional models (tables)
│       ├── dim_customers.sql
│       ├── fct_orders.sql
│       └── schema.yml
├── seeds/            # CSV files loaded as tables
│   ├── raw_customers.csv
│   ├── raw_orders.csv
│   └── raw_payments.csv
├── snapshots/        # Snapshot models for SCD Type 2
├── tests/            # Custom data tests
├── dbt_project.yml   # Project configuration
└── profiles.yml.example  # Database connection template
```

## 🏁 Getting Started

### 1. Load Seed Data

First, load the sample data into your database:

```bash
cd dbtlearn
dbt seed
```

### 2. Run Models

Build all models in your project:

```bash
dbt run
```

### 3. Test Your Models

Run tests to ensure data quality:

```bash
dbt test
```

### 4. Generate Documentation

Create and serve project documentation:

```bash
dbt docs generate
dbt docs serve
```

## 🔄 Running the Project

Common dbt commands you'll use:

```bash
# Run all models
dbt run

# Run a specific model
dbt run --select stg_customers

# Run a model and all downstream models
dbt run --select stg_customers+

# Run all models in a directory
dbt run --select staging.*

# Run tests
dbt test

# Run tests for a specific model
dbt test --select stg_customers

# Refresh seed data
dbt seed

# Clean generated files
dbt clean

# Compile models without running
dbt compile

# Show model lineage
dbt ls --select +fct_orders+
```

## 📚 Learning Path

This project demonstrates key dbt concepts:

1. **Seeds**: Loading CSV data (`raw_customers.csv`, `raw_orders.csv`, `raw_payments.csv`)
2. **Staging Models**: Clean and standardize raw data (models in `staging/`)
3. **Marts**: Business-ready dimensional models (models in `marts/`)
4. **Tests**: Data quality checks (defined in `schema.yml` files)
5. **Documentation**: Model and column descriptions
6. **Macros**: Reusable SQL functions
7. **Materializations**: Views vs Tables configuration

### Key Concepts Covered

- ✅ Source data loading with seeds
- ✅ Staging layer with type casting and standardization
- ✅ Dimensional modeling (facts and dimensions)
- ✅ Referencing models with `{{ ref() }}`
- ✅ Generic and custom tests
- ✅ Custom macros for code reusability
- ✅ Documentation generation
- ✅ Schema configuration
- ✅ Materialization strategies

## 📖 Resources

- [dbt Documentation](https://docs.getdbt.com/)
- [dbt Discourse Community](https://discourse.getdbt.com/)
- [dbt Slack Community](https://www.getdbt.com/community/)
- [Course on Udemy](https://www.udemy.com/course/complete-dbt-data-build-tool-bootcamp-zero-to-hero-learn-dbt/)

## 🤝 Contributing

This is a learning repository. Feel free to:
- Add your own models
- Experiment with different approaches
- Create new tests and macros
- Extend the sample data

## 📝 Notes

- The project uses sample data for learning purposes
- Models are configured with appropriate materializations (views for staging, tables for marts)
- All models include tests for data quality
- Macros demonstrate common dbt patterns

## 📄 License

This project is for educational purposes as part of the dbt Bootcamp course.

---

Happy learning! 🚀

For questions or issues, please refer to the course materials or reach out to the course instructor.