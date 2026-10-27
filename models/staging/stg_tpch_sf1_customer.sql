with source as (
        select * from {{ source('tpch_sf1', 'customer') }}
  ),
  renamed as (
      select
          {{ adapter.quote("C_CUSTKEY") }} as customer_key,
        {{ adapter.quote("C_NAME") }} as name,
        {{ adapter.quote("C_ADDRESS") }} as address,
        {{ adapter.quote("C_NATIONKEY") }} as nation_key,
        {{ adapter.quote("C_PHONE") }} as phone,
        {{ adapter.quote("C_ACCTBAL") }} as actual_balance,
        {{ adapter.quote("C_MKTSEGMENT") }} as market_segment,
        {{ adapter.quote("C_COMMENT") }} as comment

      from source
  )
  select * from renamed
    