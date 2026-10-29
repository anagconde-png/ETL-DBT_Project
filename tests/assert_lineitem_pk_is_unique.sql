select
    order_key,
    line_number,
    count(*) as total_records
from {{ ref('stg_tpch_sf1_lineitem') }}
group by 1, 2
having total_records > 1