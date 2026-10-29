{% snapshot snp_customers %}

{{
    config(
      target_database='analytics_project',
      target_schema='snapshots',
      unique_key='c_custkey',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch_sf1', 'customer') }}

{% endsnapshot %}