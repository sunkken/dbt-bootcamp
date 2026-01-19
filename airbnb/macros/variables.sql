-- There are two types of variables in dbt: Jinja variables and dbt project variables.
-- Jinja variables are defined within the Jinja context using the `set` statement.
-- dbt project variables are defined in the `dbt_project.yml` file under the `vars` section (or in terminal using the `--vars` flag)
-- and can be accessed using the `var()` function.
{% macro learn_variables() %}
  -- Jinja variables Example
  {% set your_name_jinja = "Quinn" %}
  {{ log("Hello " ~ your_name_jinja, info=True) }}

  -- dbt project variables Example (using --vars flag or dbt_project.yml)
  {{ log("Hello dbt user " ~ var("user_name", "DEFAULT_VAR_USERNAME") ~ "!", info=True) }}
{% endmacro %}