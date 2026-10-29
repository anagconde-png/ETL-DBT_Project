with int_order_items as (select * from {{ ref('int_order_items') }})

select * from int_order_items