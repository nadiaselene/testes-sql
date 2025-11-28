
select DISTINCT COALESCE(product_category_name, 'outros') as 'categorias'

from products

ORDER BY product_category_name 
 