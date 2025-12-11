select
    t1.estado,
    round(sum(t2.price), 2) as preço_unidade,
    sum(t2.order_item_id) as qtd_pedido,
    round((round(sum(t2.price), 2) / sum(t2.order_item_id)),2) as ticket_medio

from tb_dados_compra as t1

left join order_items as t2
on t1.order_id = t2.order_id

group by estado

order by ticket_medio DESC