-- trazer contagens diferentes usando o 'as' para renomear as colunas

select
count (*) as quantidade_linhas,
count (product_id) as quantidade_produtos,
count (DISTINCT product_id) as quantidade_distinta_produtos,
count (DISTINCT product_category_name) as quantidade_distinta_cat

FROM products

where product_category_name = 'artes'
