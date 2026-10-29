with suppliers as (
    select * from {{ ref('stg_tpch_sf1_supplier') }}
),
nations as (
    select * from {{ ref('stg_tpch_sf1_nation') }}
),
regions as (
    select * from {{ ref('stg_tpch_sf1_region') }}
)

select
    s.supplier_key,
    s.name as supplier_name,
    s.address as supplier_address,
    s.phone as supplier_phone,
    s.account_balance,
    n.name as nation_name,
    r.name as region_name
from suppliers s
left join nations n using(nation_key)
left join regions r using(region_key)