select
    DISTINCT case 
         when product_category_name is null then 'outros'
         when product_category_name = 'alimentos' 
            or product_category_name = 'alimentos_bebidas'
            or product_category_name = 'bebidas'
                then 'alimentos'
        when product_category_name in ('artes', 'artes_e_artesanato')
                then 'artes'
        else product_category_name
        end as categorias
from products

ORDER BY product_category_name 