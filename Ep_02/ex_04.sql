-- query que apresente o tamanho médio, máx e mín do nome do objeto por categoria
-- descrição maior que 100
-- exibir apenas categorias com tam médio da descrição maior que 500

-- o where > 100 vem antes porque primeiro selecionamos as descrições maiores que 100
-- o having vem depois porque é um filtro feito após o agrupamento

select product_category_name as categoria_do_produto,
        max(product_name_lenght) as tam_max_nome,
        min(product_name_lenght) as tam_min_nome,
        avg(product_name_lenght) as tam_medio_nome,
        avg(product_description_lenght) as tam_medio_descrição

from products

where product_category_name is not NULL
and product_description_lenght > 100

group by product_category_name

having tam_medio_descrição > 500

order by tam_medio_nome