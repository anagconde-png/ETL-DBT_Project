with source as (
        select * from {{ source('tpch_sf1', 'partsupp') }}
  ),
  renamed as (
      select
          {{ adapter.quote("PS_PARTKEY") }} as part_key,
        {{ adapter.quote("PS_SUPPKEY") }} as supplier_key,
        {{ adapter.quote("PS_AVAILQTY") }} as avaliable_quantity,
        {{ adapter.quote("PS_SUPPLYCOST") }} as supply_cost,
        {{ adapter.quote("PS_COMMENT") }} as comment

      from source
  )
  select * from renamed