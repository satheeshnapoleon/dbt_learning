{% macro get_fullname(first_name, last_name) %}
    coalesce({{ first_name }}, '') || ' ' || coalesce({{ last_name }}, '')
{% endmacro %}
