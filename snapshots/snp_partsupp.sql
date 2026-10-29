{% snapshot snp_partsupp %}

{{
    config(
      target_database='analytics_project',
      target_schema='snapshots',
      unique_key="ps_partkey || '-' || ps_suppkey",
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch_sf1', 'partsupp') }}

{% endsnapshot %}