-- trazer o tamanho médio, máximo e mínimo da descrição do produto, agrupado por categoria

select product_category_name,
        max(product_description_lenght) as tam_max_descrição,
        min(product_description_lenght) as tam_min_descrição,
        avg(product_description_lenght) as tam_medio_descrição

from products

where product_category_name is not NULL

group by product_category_name