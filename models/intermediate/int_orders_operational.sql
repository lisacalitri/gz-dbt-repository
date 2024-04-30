select 
  o.orders_id,
  o.date_date,
  cast(s.ship_cost as int64),
  round(o.margin + s.shipping_fee - (s.logcost + cast(s.ship_cost as int64)),2) as operational_margin, 
  o.quantity,
  o.revenue,
  o.purchase_cost,
  o.margin,
  s.shipping_fee,
  s.logcost,
  s.ship_cost
from {{ref("int_orders_margin")}} as o
left join {{ref("stg_raw__ship")}} as s 
  using(orders_id)
order by orders_id desc