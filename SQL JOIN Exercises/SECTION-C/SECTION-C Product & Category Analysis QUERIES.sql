select products.product_id, products.product_name,categories.category_name
from products
join categories
on products.category_id = categories.category_id;

select distinct categories.category_id,categories.category_name
from categories
join products
on products.category_id = categories.category_id where categories.category_id IS NULL;

select categories.category_name, count(products.product_id) AS No_of_products
from categories
join products
on products.category_id = categories.category_id 
group by category_name;
