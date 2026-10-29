{% snapshot snp_parts %}

{{
    config(
      target_database='analytics_project',
      target_schema='snapshots',
      unique_key='p_partkey',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch_sf1', 'part') }}

{% endsnapshot %}