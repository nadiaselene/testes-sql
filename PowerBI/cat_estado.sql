select
    t2.estado as 'estado',

    t1.product_id,

    t3.product_category_name,
    
    sum(t1.price) as 'receita',


CASE WHEN
    t3.product_category_name like '%casa%'
    then 'itens_casa'
    WHEN
    t3.product_category_name like '%alimentos%'
    then 'alimentos'
    WHEN
    t3.product_category_name like '%bebidas%'
    then 'alimentos'
    WHEN
    t3.product_category_name like '%construcao%'
    then 'construcao'
    WHEN
    t3.product_category_name like '%eletrodomesticos%'
    then 'eletrodomesticos'
    WHEN
    t3.product_category_name like '%fashion%'
    then 'fashion'
    WHEN
    t3.product_category_name like '%livros%'
    then 'livros'
    WHEN
    t3.product_category_name like '%moveis%'
    then 'moveis'
    WHEN
    t3.product_category_name like '%portateis%'
    then 'portateis'
    WHEN
    t3.product_category_name like '%telefonia%'
    then 'telefonia'
    ELSE t3.product_category_name
    end as categoria_grupo
    
FROM
order_items as t1

LEFT JOIN tb_dados_compra as t2 ON t1.order_id = t2.order_id 
LEFT JOIN products as t3 ON t1.product_id = t3.product_id


WHERE t3.product_category_name in (
    select t2.product_category_name
    from order_items as t1
    LEFT JOIN products as t2 on t1.product_id = t2.product_id

    GROUP BY product_category_name
    ORDER BY count(*) DESC
)


GROUP BY 
        t1.product_id