-- considerando apenas o anos de 2017 e pedidos entregues:

-- qual a receita de cada categoria de pedidos?
-- e o total de vendas? em unidades e em pedidos

select
    DISTINCT COALESCE(T2.product_category_name, 'outros') as 'categorias',
    
    sum(t1.price) as 'receita',

    count(t1.order_item_id) as 'quantidade_vendas',

    count(DISTINCT t1.order_id) as 'quantidade_pedidos',

    t3.order_status as 'status_pedido',

    t3.order_approved_at as 'hora_data_pedido'

    
FROM
order_items as t1

LEFT JOIN products as t2 ON t1.product_id = t2.product_id
LEFT JOIN orders as t3 ON t1.order_id = t3.order_id

WHERE
    t3.order_status = 'delivered'
    and
    t3.order_approved_at BETWEEN '2017-01-01 00:00:00' and '2017-12-31 23:59:59'

GROUP BY categorias

order by receita DESC
