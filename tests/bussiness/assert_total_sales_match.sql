with orders as (
    select order_key, total_price 
    from {{ ref('stg_tpch_sf1_orders') }}
),
lineitems as (
    select order_key, sum(extended_price * (1 - discount) * (1 + tax)) as calc_total
    from {{ ref('stg_tpch_sf1_lineitem') }}
    group by order_key
)
select 
    o.order_key, 
    o.total_price, 
    l.calc_total,
    abs(o.total_price - l.calc_total) as diff
from orders o
join lineitems l on o.order_key = l.order_key
where abs(o.total_price - l.calc_total) > 1