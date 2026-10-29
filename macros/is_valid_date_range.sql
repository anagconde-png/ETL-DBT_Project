{% test is_valid_date_range(model, column_name, min_date='1990-01-01', max_date='2030-12-31') %}
    select *
    from {{ model }}
    where {{ column_name }} < '{{ min_date }}'
       or {{ column_name }} > '{{ max_date }}'
{% endtest %}