with source as (
        select * from {{ source('tpch_sf1', 'supplier') }}
  ),
  renamed as (
      select
          {{ adapter.quote("S_SUPPKEY") }} as supplier_key,
        {{ adapter.quote("S_NAME") }} as name,
        {{ adapter.quote("S_ADDRESS") }} as address,
        {{ adapter.quote("S_NATIONKEY") }} as nation_key,
        {{ adapter.quote("S_PHONE") }} as phone,
        {{ adapter.quote("S_ACCTBAL") }} as account_balance,
        {{ adapter.quote("S_COMMENT") }} as comment

      from source
  )
  select * from renamed
    