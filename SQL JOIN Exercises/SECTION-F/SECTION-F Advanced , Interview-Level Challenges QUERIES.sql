select customers.customer_id,customers.full_name,max(orders.order_date) AS Latest_order
from customers
left join orders
on customers.customer_id = orders.customer_id 
group by customers.customer_id,customers.full_name;

select categories.category_name,max(products.product_name) AS top_selling_product
from  products
left join categories
on products.category_id = categories.category_id
group by  categories.category_name;

select customers.customer_id,customers.full_name,count(distinct categories.category_id) AS Category_count
from customers
join orders
on customers.customer_id = orders.customer_id
join order_items
on order_items.order_id = orders.order_id
join products
on products.product_id = order_items.product_id
join categories
on categories.category_id = products.category_id
group by customers.customer_id,customers.full_name
having category_count >=2;

select customers.customer_id, customers.full_name,count(orders.order_id) AS Total_orders
from customers
join orders
on customers.customer_id = orders.customer_id
group by customers.customer_id,customers.full_name
having Total_orders > 1;

select date_format(orders.order_date,'%y-%m')AS month,sum(order_items.quantity * order_items.unit_price) AS Monthly_revenue
from orders
join order_items
on orders.order_id = order_items.order_id
group by month
order by month