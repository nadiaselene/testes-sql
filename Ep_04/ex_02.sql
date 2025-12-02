-- qual o valor total da receita gerada por sellers de cada estado?
-- considere apenas pedidos entregues

select
  
    t2.seller_state as 'estado',
    
    sum(t1.price) as 'receita',

    count(t1.order_item_id) as 'quantidade_vendas',

    t3.order_status as 'status_pedido'

    
FROM
order_items as t1

LEFT JOIN sellers as t2 ON t1.seller_id = t2.seller_id 
LEFT JOIN orders as t3 ON t1.order_id = t3.order_id

WHERE
    t3.order_status = 'delivered'


GROUP BY estado

ORDER BY estado ASC