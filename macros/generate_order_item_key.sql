{% macro generate_order_item_key (order_key, line_number) %}

    coalesce (cast({{ order_key }} as varchar), 'null')
    ||
    '-'
    ||
    coalesce (cast({{ line_number }} as varchar), 'null')

{% endmacro %}