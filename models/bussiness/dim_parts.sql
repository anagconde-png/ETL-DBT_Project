with int_parts as (
    select * from {{ ref('int_parts') }}
)

select * from int_parts