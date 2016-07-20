-- 1. Get all customers and their addresses.
Select first_name, last_name, street, city, state, zip from customers INNER JOIN addresses on customers.id = addresses.customer_id;

-- 2. Get all orders and their line items.
Select order_date, total, unit_price, quantity from orders INNER JOIN line_items on orders.id = line_items.order_id;

-- 3. Which warehouses have cheetos?
select warehouse.warehouse from warehouse inner join warehouse_product on (warehouse.id = warehouse_product.warehouse_id) inner join products on (products.id = warehouse_product.product_id) where products.description = 'cheetos';

-- 4. Which warehouses have diet pepsi?
select warehouse.warehouse from warehouse inner join warehouse_product on (warehouse.id = warehouse_product.warehouse_id) inner join products on (products.id = warehouse_product.product_id) where products.description = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
select customers.*, orders.order_date from customers inner join addresses on (customers.id = addresses.customer_id) inner join orders on (addresses.id = orders.address_id);

-- 6. How many customers do we have?
select count(first_name) from customers;

-- 7. How many products do we carry?
select count(description) from products;

-- 8. What is the total available on-hand quantity of diet pepsi?
select sum(on_hand) from warehouse_product Inner join products on products.id = warehouse_product.product_id where description = 'diet pepsi';
