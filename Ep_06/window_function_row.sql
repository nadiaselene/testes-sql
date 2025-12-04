-- qual o produto mais vendido por seller
-- considere apenas pedidos entregues

with tab_vendas as (
    
    select 
        t2.seller_id,
        t2.product_id,
        count (*) as qtd_venda_produto,
        sum(price) as receita
    
    from orders as t1

    LEFT JOIN order_items as t2
    on t1.order_id = t2.order_id

    where
    order_status = 'delivered'

    group by t2.seller_id,
            t2.product_id

    order by t2.seller_id
),

tab_agrup_sellers as (
    select *,
        ROW_NUMBER() over ( partition by seller_id
                            ORDER BY qtd_venda_produto desc,
                            receita desc) as order_qtd

    from tab_vendas
)

select seller_id,
        product_id,
        qtd_venda_produto,
        order_qtd

from tab_agrup_sellers

where order_qtd = 1