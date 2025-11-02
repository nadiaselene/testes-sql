-- selecionar apenas a categoria bebes e perfumaria

select product_category_name,
        product_photos_qty

from products

where product_category_name = 'bebes' or 'perfumaria'