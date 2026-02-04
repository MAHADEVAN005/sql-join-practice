select orders.customer_id,customers.full_name,sum(order_items.quantity * order_items.unit_price) AS Total_revenue
from customers
join orders
on  customers.customer_id = orders.customer_id
join order_items
on orders.order_id = order_items.order_id
group by orders.customer_id,customers.full_name;

select orders.customer_id,customers.full_name,sum(order_items.quantity * order_items.unit_price) AS Total_revenue
from customers
join orders
on  customers.customer_id = orders.customer_id
join order_items
on orders.order_id = order_items.order_id
group by orders.customer_id,customers.full_name
order by Total_revenue desc
limit 3;

select categories.category_name,sum(order_items.quantity * order_items.unit_price) AS Total_revenue
from categories
join products
on categories.category_id = products.category_id
join order_items
on products.product_id = order_items.product_id
group by category_name
order by Total_revenue desc;

select products.product_name,sum(order_items.quantity) AS Quantity
from products
join order_items
on products.product_id = order_items.product_id
group by product_name
order by Quantity desc;

select customers.city,sum(order_items.quantity * order_items.unit_price) AS Total_revenue
from customers
join orders
on customers.customer_id = orders.customer_id
join order_items
on orders.order_id = order_items.order_id
group by customers.city
order by Total_revenue desc;

select orders.order_id
from orders
left join order_items
on orders.order_id = order_items.order_id where order_items.order_id is null;

select products.product_name
from products
left join order_items
on products.product_id = order_items.product_id where order_items.product_id is null;
