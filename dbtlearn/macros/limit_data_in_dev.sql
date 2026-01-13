{% macro limit_data_in_dev(column_name, days_back=3) %}
    {% if target.name == 'dev' %}
        where {{ column_name }} >= current_date - interval '{{ days_back }}' day
    {% endif %}
{% endmacro %}
