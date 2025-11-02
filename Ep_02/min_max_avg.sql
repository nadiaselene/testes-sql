-- trazer o peso máximo e mínimo dentro do filtro desejado

select max(product_weight_g) as peso_maximo,
        min(product_weight_g) as peso_minimo,
        avg(product_weight_g) as peso_medio

from products

where product_category_name =  'eletronicos'