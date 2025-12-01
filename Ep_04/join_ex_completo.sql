-- qual a receita de cada categoria de pedidos?
-- e o total de vendas? em unidades e em pedidos

select
    DISTINCT COALESCE(T2.product_category_name, 'outros') as 'categorias',
    
    sum(t1.price) as 'receita',

    count(t1.order_item_id) as 'quantidade_vendas',

    count(DISTINCT t1.order_id) as 'quantidade_pedidos'
    
FROM
order_items as t1

LEFT JOIN products as t2 ON t1.product_id = t2.product_id

GROUP BY categorias

order by receita DESC
