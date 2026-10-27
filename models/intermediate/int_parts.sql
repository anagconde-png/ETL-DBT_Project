select
    part_key,
    name as part_name,
    manufacturer,
    brand,
    type as part_type,
    size as part_size,
    container,
    retail_price
from {{ ref('stg_tpch_sf1_part') }}