SELECT order_items.order_id, products.product_name, order_items.quantity, order_items.unit_price
FROM order_items
JOIN products
ON order_items.product_id = products.product_id;

SELECT order_items.order_id, products.product_name, order_items.quantity, order_items.unit_price,
       (order_items.quantity * order_items.unit_price) AS line_total
FROM order_items
JOIN products
ON order_items.product_id = products.product_id;

SELECT order_items.order_id,
       SUM(order_items.quantity * order_items.unit_price) AS total_order_amount
FROM order_items
GROUP BY order_items.order_id;

SELECT order_items.order_id,
       SUM(order_items.quantity * order_items.unit_price) AS total_order_amount
FROM order_items
GROUP BY order_items.order_id
ORDER BY total_order_amount DESC
LIMIT 5;

SELECT order_items.order_id,
       products.product_name,
       categories.category_name,
       order_items.quantity,
       order_items.unit_price
FROM order_items
JOIN products
ON order_items.product_id = products.product_id
JOIN categories
ON products.category_id = categories.category_id;