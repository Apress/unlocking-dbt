{{
  config(
    materialized = 'incremental',
    unique_key = 'OrderId',
    incremental_predicates=['DBT_INTERNAL_DEST.UpdatedAt > dateadd(day, -7, current_date())']
  )
}}

with get_orders_revenue as(
  select
    pro.OrderId,
    sum(pro.Price) as Revenue
  from {{ ref('int_orders_items_products_joined') }} as pro
  group by 1
)

select
  ord.OrderId,
  ord.OrderPlacedTimestamp,
  ord.UpdatedAt,
  ord.OrderStatus,
  ord.SalesPerson,
  rev.Revenue
from get_orders_revenue as rev
join {{ ref('stg_furniture_mart_orders') }} as ord
  on rev.OrderId = ord.OrderId
{% if is_incremental() %}
where ord.UpdatedAt > (select max(UpdatedAt) from {{ this }})
{% endif %}