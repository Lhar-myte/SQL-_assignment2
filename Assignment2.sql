-- * Customers
-- > customer_id (primary key)
-- > name
-- > phone_number
-- > address (street, city)
CREATE database company;
USE company;
CREATE table customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT, 
Customer_name VARCHAR(50) NOT NULL, 
phone_number NUMERIC(50) NOT NULL, 
address VARCHAR(50) NOT NULL)
;

CREATE table products(
product_id INT PRIMARY KEY AUTO_INCREMENT, 
product_name VARCHAR(50) NOT NULL,
category VARCHAR(50) NOT NULL,
price NUMERIC(50) NOT NULL,
stock_quantity NUMERIC(50) NOT NULL)
;
ALTER table products
MODIFY category VARCHAR(60)
;



CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_name, phone_number, address) VALUES
('Bamidele olamide', '08147047062', 'Iwo-road'),
('Bob Smith', '08147047067', 'Dugbe'),
('Alade Ibrahim', '09047047062', 'Challenge'),
('David Brown', '08143567062', 'Dugbe'),
('Olumide Davis', '08147556062', 'Ojoo'),
('Frank jide', '08147047060', 'Dugbe'),
('Grace Badmus', '08147047462', 'Iwo-road'),
('Henry Clark', '07147047067', 'Ojoo'),
('Abdulattef Bashiru', '08147047062', 'Dugbe'),
('Jack temitope', '08147047089', 'Apata')
;

INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop', 'gadget', 180000.00, 20),
('Cooker', 'home appliances', 15080.00, 50),
('Headphones', 'phone accessories', 15500.00, 100),
('Keyboard', 'gadget', 8000.00, 70),
('Speaker', 'electronics', 15000.00, 40)
;

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2025-07-01', 850000.00),
(2, '2025-07-02', 500000.00),
(3, '2025-07-03', 8000.00),
(4, '2025-07-04', 23000.00),
(5, '2025-07-05', 15000.00),
(6, '2025-07-06', 15500.00),
(7, '2025-07-07', 8000.00),
(8, '2025-07-08', 880000.00),
(9, '2025-07-09', 15000.00),
(10, '2025-07-10', 8000.00)
;


INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 180000.00),       
(1, 3, 1, 15500.00),        
(2, 2, 1, 15080.00),      
(4, 5, 1, 8000.00),       
(7, 4, 2, 15000.00)
;        

SELECT *
FROM customers;

SELECT *
FROM products;

SELECT *
FROM order_items;

SELECT *
FROM orders;

INSERT INTO customers (customer_name, phone_number, address)
VALUES ('Mary Koleosho','09145656714', 'Round-about')
;

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(2, '2025-07-02', 500000.00)
;

UPDATE products
SET stock_quantity = stock_quantity - 75
WHERE product_id = 1
;


DELETE FROM order_items
WHERE order_id = 4;

DELETE FROM orders
WHERE order_id = 4;

SELECT * FROM orders
WHERE customer_id = 2;



