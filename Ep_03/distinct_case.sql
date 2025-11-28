-- lista das categorias por odem alfabética

select
    DISTINCT case 
         when product_category_name is null then 'outros'
         else product_category_name 
        end as categorias
from products

ORDER BY product_category_name 