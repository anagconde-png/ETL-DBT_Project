with lineitem as (
    select * from {{ ref('stg_tpch_sf1_lineitem') }}
),
orders as (
    select * from {{ ref('stg_tpch_sf1_orders') }}
)

select
    {{ generate_order_item_key("li.order_key", "li.line_number") }} as order_item_key,
    li.order_key,
    li.line_number,
    o.customer_key,
    li.part_key,
    li.supplier_key,
    o.order_date,
    li.shipment_date,
    li.commit_date,
    li.receipt_date,
    o.order_status,
    o.order_priority,
    li.return_flag,
    li.line_status,
    li.shipment_instructions,
    li.shipment_mode,
    o.clerk,
    li.comment as line_comment,
    o.comment as order_comment,
    li.quantity,
    li.extended_price,
    li.discount,
    li.tax,

from lineitem li
left join orders o using(order_key)