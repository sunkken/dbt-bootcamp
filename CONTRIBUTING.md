# Contributing to dbt Bootcamp

Thank you for your interest in contributing to this dbt bootcamp repository! This guide will help you add your own examples, fix issues, or suggest improvements.

## How to Contribute

### 1. Fork and Clone

```bash
git clone https://github.com/sunkken/dbt-bootcamp.git
cd dbt-bootcamp
```

### 2. Set Up Your Environment

```bash
pip install dbt-core dbt-postgres  # or your preferred adapter
cd dbtlearn
```

### 3. Make Your Changes

#### Adding New Models

1. Create your SQL file in the appropriate folder:
   - `models/staging/` for raw data transformations
   - `models/marts/` for business logic and aggregations

2. Follow naming conventions:
   - Staging: `stg_<source>_<entity>.sql`
   - Marts: `dim_<entity>.sql` or `fct_<entity>.sql`

3. Add documentation in the corresponding `schema.yml`

#### Adding New Seeds

1. Place CSV files in the `seeds/` directory
2. Use the `raw_` prefix for raw data seeds
3. Keep seed files small (<100 rows) for learning purposes

#### Adding Tests

1. Use generic tests in `schema.yml` files
2. Create custom tests in the `tests/` directory
3. Follow the pattern: `assert_<what_you're_testing>.sql`

### 4. Test Your Changes

```bash
# Compile to check for SQL errors
dbt compile

# Run your new models
dbt run --select your_model_name

# Run tests
dbt test --select your_model_name

# Generate and check documentation
dbt docs generate
dbt docs serve
```

### 5. Submit a Pull Request

1. Create a descriptive branch name: `feature/add-product-dimension`
2. Write clear commit messages
3. Include before/after examples in your PR description
4. Explain the learning value of your contribution

## Coding Standards

### SQL Style

- Use lowercase for SQL keywords
- Use snake_case for column names
- Indent with 4 spaces
- Use CTEs (Common Table Expressions) for readability
- Add comments for complex logic

Example:
```sql
-- Good example
with source as (
    select * from {{ ref('raw_customers') }}
),

transformed as (
    select
        id as customer_id,
        lower(email) as customer_email,
        created_at::date as created_date
    from source
)

select * from transformed
```

### dbt Best Practices

1. **Use `ref()` and `source()`**: Never hardcode table names
2. **Staging models are views**: Keep them lightweight
3. **Marts are tables**: Materialize for performance
4. **Test critical columns**: Add tests for primary keys and foreign keys
5. **Document your models**: Add descriptions in schema.yml

### File Organization

```
dbtlearn/
├── models/
│   ├── staging/          # Raw data transformations
│   │   ├── stg_*.sql
│   │   └── schema.yml
│   └── marts/            # Business logic
│       ├── dim_*.sql     # Dimensions
│       ├── fct_*.sql     # Facts
│       └── schema.yml
├── seeds/                # Sample CSV data
│   └── raw_*.csv
├── tests/                # Custom data tests
├── macros/               # Reusable SQL functions
└── snapshots/            # SCD Type 2 snapshots
```

## Types of Contributions Welcome

### 🌟 New Examples

- Additional staging models
- More complex marts
- Incremental models
- Snapshots
- Custom macros
- Advanced transformations

### 📚 Documentation

- Improve README explanations
- Add more exercises
- Create tutorial content
- Fix typos or unclear instructions

### 🐛 Bug Fixes

- Fix SQL errors
- Correct test definitions
- Update deprecated syntax
- Fix documentation issues

### 💡 Enhancements

- Add new learning exercises
- Improve sample data
- Create helper scripts
- Add visualization examples

## What Makes a Good Contribution?

✅ **Educational Value**: Teaches a specific dbt concept  
✅ **Clear Documentation**: Explains what and why  
✅ **Well Tested**: Includes appropriate data tests  
✅ **Follows Standards**: Matches existing code style  
✅ **Working Code**: Has been tested locally  

## Questions or Ideas?

- Open an issue to discuss before implementing large changes
- Ask in the dbt Slack community
- Reference the course materials for context

## Code Review Process

1. Automated checks run on your PR
2. Maintainer reviews for:
   - Educational value
   - Code quality
   - Documentation completeness
   - Test coverage
3. Feedback and iteration
4. Merge when approved

## Recognition

Contributors will be acknowledged in:
- The README
- Release notes
- Course materials (where applicable)

## License

By contributing, you agree that your contributions will be licensed under the same license as this project.

---

Thank you for helping make this bootcamp better for everyone! 🚀
