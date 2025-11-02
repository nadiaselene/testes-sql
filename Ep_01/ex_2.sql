-- fazer a contagem de quantos produtos têm na categoria artes
-- função count (*) não conta distintos


select count (*)

from products

where product_category_name = 'artes'