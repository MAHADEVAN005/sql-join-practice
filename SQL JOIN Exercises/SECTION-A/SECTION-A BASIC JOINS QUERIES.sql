
SELECT orders.order_id, customers.full_name, customers.city, orders.order_date, orders.status
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id;


SELECT orders.order_id, customers.full_name, orders.order_date, customers.city
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
WHERE customers.city = 'Bangalore';


SELECT customers.full_name, orders.order_date
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
WHERE orders.status = 'Delivered';

SELECT DISTINCT customers.customer_id, customers.full_name
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT customers.customer_id, customers.full_name
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;