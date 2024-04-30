SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    CAST(purchase_price AS FLOAT64), 
    ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) as purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) as margin
FROM {{ref("stg_raw__sales")}} as s
LEFT JOIN {{ref("stg_raw__product")}} as p 
    USING (products_id)