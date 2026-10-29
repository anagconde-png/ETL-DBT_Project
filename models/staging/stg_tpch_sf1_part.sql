with source as (
        select * from {{ source('tpch_sf1', 'part') }}
  ),
  renamed as (
      select
          {{ adapter.quote("P_PARTKEY") }} as part_key,
        {{ adapter.quote("P_NAME") }} as name,
        {{ adapter.quote("P_MFGR") }} as manufacturer,
        {{ adapter.quote("P_BRAND") }} as brand,
        {{ adapter.quote("P_TYPE") }} as type,
        {{ adapter.quote("P_SIZE") }} as size,
        {{ adapter.quote("P_CONTAINER") }} as container,
        {{ adapter.quote("P_RETAILPRICE") }} as retail_price,
        {{ adapter.quote("P_COMMENT") }} as comment

      from source
  )
  select * from renamed
    