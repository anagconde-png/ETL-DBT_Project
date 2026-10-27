{{
    config(
        materialized='incremental',
        unique_key=['order_key', 'line_number']
    )
}}

with source as (
        select * from {{ source('tpch_sf1', 'lineitem') }}
  ),
  renamed as (
      select
          {{ adapter.quote("L_ORDERKEY") }} as order_key,
        {{ adapter.quote("L_PARTKEY") }} as part_key,
        {{ adapter.quote("L_SUPPKEY") }} as supplier_key,
        {{ adapter.quote("L_LINENUMBER") }} as line_number,
        {{ adapter.quote("L_QUANTITY") }} as quantity,
        {{ adapter.quote("L_EXTENDEDPRICE") }} as extended_price,
        {{ adapter.quote("L_DISCOUNT") }} as discount,
        {{ adapter.quote("L_TAX") }} as tax,
        {{ adapter.quote("L_RETURNFLAG") }} as return_flag,
        {{ adapter.quote("L_LINESTATUS") }} as line_status,
        {{ adapter.quote("L_SHIPDATE") }} as shipment_date,
        {{ adapter.quote("L_COMMITDATE") }} as commit_date,
        {{ adapter.quote("L_RECEIPTDATE") }} as receipt_date,
        {{ adapter.quote("L_SHIPINSTRUCT") }} as shipment_instructions,
        {{ adapter.quote("L_SHIPMODE") }} as shipment_mode,
        {{ adapter.quote("L_COMMENT") }} as comment

      from source
  )
  select * from renamed

{% if is_incremental() %}
    where shipment_date >= (select max(shipment_date) from {{ this }})
{% endif %}
    