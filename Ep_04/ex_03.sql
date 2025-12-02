-- qual o peso médio dos produtos vendidos por sellers de cada estado?
-- considere apenas pedidos entregues

select
  
    t2.seller_state as 'estado',

    t3.order_status as 'status_pedido',

    count(t1.order_item_id) as 'quantidade_vendas',

    (t4.product_weight_g * 100)  as 'peso',

    ROUND((t4.product_weight_g * 100)/count(t1.order_item_id), 2) as 'peso_médio_kg'




    
FROM
order_items as t1

LEFT JOIN sellers as t2 ON t1.seller_id = t2.seller_id 
LEFT JOIN orders as t3 ON t1.order_id = t3.order_id
LEFT JOIN products as t4 ON t1.product_id = t4.product_id

WHERE
    t3.order_status = 'delivered'


GROUP BY estado

ORDER BY estado ASC