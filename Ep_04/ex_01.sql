-- qual o valor total da receita gerada por clientes de cada estado?
-- considere apenas pedidos entregues

select
  
    t2.customer_state as 'estado',
    
    sum(t3.price) as 'receita',

    count(t3.order_item_id) as 'quantidade_vendas',

    t1.order_status as 'status_pedido'

    
FROM
orders as t1

LEFT JOIN customers as t2 ON t1.customer_id = t2.customer_id 
LEFT JOIN order_items as t3 ON t1.order_id = t3.order_id

WHERE
    t1.order_status = 'delivered'


GROUP BY estado

ORDER BY estado ASC