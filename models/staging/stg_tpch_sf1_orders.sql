{{
    config(
        materialized='incremental',
        unique_key = 'order_key'
    )
}}

with source as (
        select * from {{ source('tpch_sf1', 'orders') }}
  ),
  renamed as (
      select
          {{ adapter.quote("O_ORDERKEY") }} as order_key,
        {{ adapter.quote("O_CUSTKEY") }} as customer_key,
        {{ adapter.quote("O_ORDERSTATUS") }} as order_status,
        {{ adapter.quote("O_TOTALPRICE") }} as total_price,
        {{ adapter.quote("O_ORDERDATE") }} as order_date,
        {{ adapter.quote("O_ORDERPRIORITY") }} as order_priority,
        {{ adapter.quote("O_CLERK") }} as clerk,
        {{ adapter.quote("O_SHIPPRIORITY") }} as shipment_priority,
        {{ adapter.quote("O_COMMENT") }} as comment

      from source
  )
  select * from renamed

{% if is_incremental() %}
    where order_date >= (select max(order_date) from {{ this }})
{% endif %}
    