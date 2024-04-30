select
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    cast(purchase_price as float64) as purchase_price,
    round(s.quantity * cast(p.purchase_price as float64), 2) as purchase_cost,
    s.revenue - round(s.quantity * cast(p.purchase_price as float64), 2) as margin
from {{ ref("stg_raw__sales") }} as s
left join {{ ref("stg_raw__product") }} as p using (products_id)
