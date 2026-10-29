with customers as (
    select * from {{ ref('stg_tpch_sf1_customer') }}
),
nations as (
    select * from {{ ref('stg_tpch_sf1_nation') }}
),
regions as (
    select * from {{ ref('stg_tpch_sf1_region') }}
)

select
    c.customer_key,
    c.name as customer_name,
    c.address as customer_address,
    c.phone as customer_phone,
    c.account_balance,
    c.market_segment,
    n.name as nation_name,
    r.name as region_name
from customers c
left join nations n using(nation_key)
left join regions r using(region_key)