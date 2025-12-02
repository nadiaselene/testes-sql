-- qual o peso médio dos produtos vendidos por sellers de cada estado?
-- considere apenas pedidos entregues no ano de 2017

select
  
    t2.seller_state as 'estado',

    t3.order_status as 'status_pedido',

    t3.order_approved_at as 'hora_data_pedido',

    count(t1.order_item_id) as 'quantidade_vendas',

    avg(ROUND(t4.product_weight_g, 1)) as 'peso_médio'

    
FROM
order_items as t1

LEFT JOIN sellers as t2 ON t1.seller_id = t2.seller_id 
LEFT JOIN orders as t3 ON t1.order_id = t3.order_id
LEFT JOIN products as t4 ON t1.product_id = t4.product_id

WHERE
    t3.order_status = 'delivered'
    AND
    t3.order_approved_at BETWEEN '2017-01-01 00:00:00' and '2017-12-31 23:59:59'



GROUP BY estado

ORDER BY estado ASC