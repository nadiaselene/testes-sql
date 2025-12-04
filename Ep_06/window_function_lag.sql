-- tempo médio entre as vendas de cada seller

with tb_seller_order as (
    
    select 
        t1.order_id,
        date(t1.order_approved_at) as data_venda,
        t2.seller_id
    
    from orders as t1

    LEFT JOIN order_items as t2
    on t1.order_id = t2.order_id

    where
    order_status = 'delivered'
),

tb_seller_order_sort as (
    select *,
            ROW_NUMBER() over (partition by seller_id, data_venda) as date_seller_order

    from tb_seller_order
),

tb_seller_lag_data as (
    select order_id,
            seller_id,
            data_venda,
            lag(data_venda) over (partition by seller_id order by data_venda) as lag_data_venda


    from tb_seller_order_sort

    where date_seller_order = 1
),

tb_diff_data as (
    select *,
        julianday(data_venda) - julianday(lag_data_venda) as diff_venda

from tb_seller_lag_data

where lag_data_venda is not null)

SELECT
    DISTINCT (seller_id),
    round(AVG(diff_venda) OVER (PARTITION BY seller_id), 2) AS avg_venda_dias
FROM
    tb_diff_data