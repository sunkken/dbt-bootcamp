{% macro no_empty_strings(model) %}
  {%- set string_columns = [] -%}
  {%- for col in adapter.get_columns_in_relation(model) -%}
    {%- if col.is_string() -%}
      {%- do string_columns.append(col.name) -%}
    {%- endif -%}
  {%- endfor -%}
  
  {%- if string_columns -%}
    {%- for col in string_columns %}
      {{ col }} IS NOT NULL AND {{ col }} <> ''
      {%- if not loop.last %} AND {% endif %}
    {%- endfor %}
  {%- else -%}
    TRUE
  {%- endif -%}
{% endmacro %}