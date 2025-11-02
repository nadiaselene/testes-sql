-- agrupar peso máximo, mínimo e média por categoria de produto

select product_category_name,
        max(product_weight_g) as maior_peso,
        min(product_weight_g) as menor_peso,
        avg(product_weight_g) as peso_medio

from products

group by product_category_name