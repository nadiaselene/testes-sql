-- quantos produtos tem volume acima de 5L?

SELECT product_category_name as categoria, product_id as sku,
    product_length_cm * product_height_cm * product_width_cm / 1000 as volume

from products

where volume > 5
