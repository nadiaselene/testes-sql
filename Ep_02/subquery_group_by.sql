select * 

from (
select seller_state as uf_vendedor,
        count (DISTINCT seller_id) as qtd_vendedores

from sellers

group by seller_state )

where qtd_vendedores > 10