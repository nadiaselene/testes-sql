-- query que apresente o tamanho médio, máx e mín do nome do objeto por categoria
-- considerar apenas as descrições maiores que 50

select product_category_name as categoria_do_produto,
        max(product_name_lenght) as tam_max_nome,
        min(product_name_lenght) as tam_min_nome,
        avg(product_name_lenght) as tam_medio_nome

from products

where product_category_name is not NULL

group by product_category_name

having product_description_lenght > 50