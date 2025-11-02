-- bebes acima de 1 foto
-- ou perfumaria acima de 5 fotos

select product_category_name,
        product_photos_qty

from products

where (product_category_name = 'bebes'
and product_photos_qty > 1)
or (product_category_name = 'perfumaria'
and product_photos_qty > 5)
