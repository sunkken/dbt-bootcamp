{% macro learn_logging() %}
  {# log("This is a log message that is commented out.", info=True) #}
  {{ log("This is a log message that is not commented out.", info=True) }}
{% endmacro %}