-- receita por estado do seller, por produto da categoria mais vendida

with tb_categorias_mais_vendidas as (
    select t2.product_category_name
    from order_items as t1
    LEFT JOIN products as t2 on t1.product_id = t2.product_id

    GROUP BY product_category_name
    ORDER BY count(*) DESC

    limit 1
),

tb_receita_estado as (

    select
    t2.seller_state as 'estado',
    t1.product_id,
    t3.product_category_name,
    sum(t1.price) as 'receita'

FROM
order_items as t1

LEFT JOIN sellers as t2 ON t1.seller_id = t2.seller_id 
LEFT JOIN products as t3 ON t1.product_id = t3.product_id

GROUP BY 
        t2.seller_state,
        t1.product_id
)

select *

from 
tb_receita_estado as t1

inner join tb_categorias_mais_vendidas as t2
ON t1.product_category_name = t2.product_category_name