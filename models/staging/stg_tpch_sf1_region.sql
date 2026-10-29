with source as (
        select * from {{ source('tpch_sf1', 'region') }}
  ),
  renamed as (
      select
          {{ adapter.quote("R_REGIONKEY") }} as region_key,
        {{ adapter.quote("R_NAME") }} as name,
        {{ adapter.quote("R_COMMENT") }} as comment

      from source
  )
  select * from renamed
    