{% test is_valid_date_range(model, column_name, min_date, max_date='current_date') %}
    select *
    from {{ model }}
    where {{ column_name }} < '{{ min_date }}'
       or {{ column_name }} > '{{ max_date }}'
{% endtest %}