drop table if exists tb_dados_compra;
create table tb_dados_compra as

with tb_compras_clientes as (

    select
        t1.customer_state as estado,
        t2.*

    from customers as t1
    left join orders as t2
        on t1.customer_id = t2.customer_id
)

select *
from tb_compras_clientes;