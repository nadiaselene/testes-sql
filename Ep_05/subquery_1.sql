-- receita por estado do seller, por produto da categoria mais vendida

select
  
    t2.seller_state as 'estado',

    t1.product_id,

    t3.product_category_name,
    
    sum(t1.price) as 'receita'

    
FROM
order_items as t1

LEFT JOIN sellers as t2 ON t1.seller_id = t2.seller_id 
LEFT JOIN products as t3 ON t1.product_id = t3.product_id

WHERE t3.product_category_name in (
    select t2.product_category_name
    from order_items as t1
    LEFT JOIN products as t2 on t1.product_id = t2.product_id

    GROUP BY product_category_name
    ORDER BY count(*) DESC

    limit 1

)


GROUP BY 
        t2.seller_state,
        t1.product_id