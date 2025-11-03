-- query que apresenta o tam médio, máximo e mínimo do NOME do objeto por categoria
-- limitar aos 10 primeiros resultados


select product_category_name as categoria_do_produto,
        max(product_name_lenght) as tam_max_nome,
        min(product_name_lenght) as tam_min_nome,
        avg(product_name_lenght) as tam_medio_nome

from products

where product_category_name is not NULL

group by product_category_name

limit 10