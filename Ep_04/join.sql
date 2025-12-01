select
    t1.order_id,
    t1.order_item_id,
    t1.product_id,
    t1.price,
    t2.product_category_name
    
FROM
order_items as t1

LEFT JOIN products as t2 ON t1.product_id = t2.product_id

GROUP BY t2.product_category_name