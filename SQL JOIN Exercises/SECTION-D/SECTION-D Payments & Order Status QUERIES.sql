select orders.order_id,
if(payments.payment_id IS NULL, 'Not Paid', 'paid')AS payment_status
from orders
left join payments
on orders.order_id = payments.order_id;

select order_items.order_id,payments.paid_amount,sum(order_items.quantity * order_items.unit_price) AS Order_total ,
(sum(order_items.quantity * order_items.unit_price)-(payments.paid_amount)) AS pending
from order_items
left join payments
on order_items.order_id = payments.order_id 
group by order_items.order_id, payments.paid_amount
having payments.paid_amount < Order_total;

select orders.order_id,count(payments.paid_amount)AS payments
from orders
join payments
on orders.order_id = payments.order_id 
group by orders.order_id
having payments > 1;

select orders.order_id,sum(payments.paid_amount) as Total_paid
from orders
join payments
on orders.order_id = payments.order_id 
group by orders.order_id;

select orders.order_id,orders.status,
if(payments.paid_amount IS NULL, 'Not paid','paid') AS Payments
from orders
left join payments
on orders.order_id = payments.order_id where orders.status = 'Delivered' and payments.payment_id IS NULL;
