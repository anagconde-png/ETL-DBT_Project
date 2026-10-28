{% snapshot snp_suppliers %}

{{
    config(
      target_database='analytics_project',
      target_schema='snapshots',
      unique_key='s_suppkey',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch_sf1', 'supplier') }}

{% endsnapshot %}