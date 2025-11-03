-- faça a lista de todas as categorias distintas que existem na base de produtos ordenados de forma alfabética

select  DISTINCT product_category_name as categorias

from products

where categorias is not null

order by product_category_name ASC