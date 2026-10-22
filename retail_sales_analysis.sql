-- Create the database--

CREATE DATABASE retail_sales_analysis;
USE retail_sales_analysis;

-- Check whether it worked--

SHOW DATABASES;
SELECT DATABASE();

USE retail_sales_analysis;
-- Create the customers table--
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    city VARCHAR(100),
    signup_date DATE
);

-- Create the products table--

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Create the orders table--

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- Create the order_items table--

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    CONSTRAINT chk_quantity
        CHECK (quantity > 0),

    CONSTRAINT chk_item_price
        CHECK (unit_price >= 0),

    CONSTRAINT fk_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_items_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- Verify that all four tables exist--

SHOW TABLES;

DESCRIBE customers;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE order_items;

USE retail_sales_analysis;

-- Insert customers--

INSERT INTO customers
(customer_id, customer_name, email, city, signup_date)
VALUES
(1, 'Manju', 'manju@example.com', 'Chennai', '2025-01-10'),
(2, 'Maya', 'maya@example.com', 'Coimbatore', '2025-02-15'),
(3, 'Makesh', 'makesh@example.com', 'Bangalore', '2025-03-20'),
(4, 'Jaisz', 'jaisz@example.com', 'Chennai', '2025-04-05'),
(5, 'Srinika', 'srinika@example.com', 'Madurai', '2025-05-12'),
(6, 'Ravitha', 'ravitha@example.com', 'Coimbatore', '2025-06-18'),
(7, 'Kavya', 'kavya@example.com', 'Bangalore', '2025-07-22'),
(8, 'Priya', 'priya@example.com', 'Salem', '2025-08-09'),
(9, 'Harini', 'harini@example.com', 'Chennai', '2025-09-14'),
(10, 'Nithya', 'nithya@example.com', 'Trichy', '2025-10-25');

-- Verify the customers--

SELECT * FROM customers;

-- Insert Products Data--

USE retail_sales_analysis;

INSERT INTO products
(product_id, product_name, category, unit_price)
VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Smartphone', 'Electronics', 25000.00),
(103, 'Headphones', 'Electronics', 2000.00),
(104, 'T-Shirt', 'Clothing', 800.00),
(105, 'Jeans', 'Clothing', 1800.00),
(106, 'Office Chair', 'Furniture', 7500.00),
(107, 'Desk', 'Furniture', 12000.00),
(108, 'Water Bottle', 'Accessories', 500.00),
(109, 'Backpack', 'Accessories', 1500.00),
(110, 'Smart Watch', 'Electronics', 6000.00);

-- Verify the products--

SELECT * FROM products;

-- Insert Orders--
USE retail_sales_analysis;

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES
(1001, 1, '2025-11-01', 'Delivered'),
(1002, 2, '2025-11-03', 'Delivered'),
(1003, 3, '2025-11-05', 'Delivered'),
(1004, 1, '2025-11-10', 'Delivered'),
(1005, 4, '2025-11-12', 'Cancelled'),
(1006, 5, '2025-11-15', 'Delivered'),
(1007, 6, '2025-12-01', 'Delivered'),
(1008, 7, '2025-12-05', 'Delivered'),
(1009, 8, '2025-12-12', 'Pending'),
(1010, 9, '2025-12-18', 'Delivered'),
(1011, 10, '2026-01-02', 'Delivered'),
(1012, 2, '2026-01-05', 'Delivered'),
(1013, 3, '2026-01-09', 'Delivered'),
(1014, 5, '2026-01-15', 'Delivered'),
(1015, 1, '2026-01-20', 'Delivered');

-- Verify the orders --
SELECT * FROM orders;

-- Insert order items--

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 101, 1, 55000.00),
(2, 1001, 103, 2, 2000.00),
(3, 1002, 104, 3, 800.00),
(4, 1002, 105, 1, 1800.00),
(5, 1003, 102, 1, 25000.00),
(6, 1003, 110, 1, 6000.00),
(7, 1004, 106, 1, 7500.00),
(8, 1004, 108, 2, 500.00),
(9, 1005, 107, 1, 12000.00),
(10, 1006, 109, 2, 1500.00),
(11, 1006, 104, 2, 800.00),
(12, 1007, 101, 1, 55000.00),
(13, 1007, 103, 1, 2000.00),
(14, 1008, 102, 2, 25000.00),
(15, 1008, 110, 1, 6000.00),
(16, 1009, 108, 3, 500.00),
(17, 1010, 106, 2, 7500.00),
(18, 1010, 109, 1, 1500.00),
(19, 1011, 107, 1, 12000.00),
(20, 1011, 108, 2, 500.00),
(21, 1012, 105, 2, 1800.00),
(22, 1012, 104, 1, 800.00),
(23, 1013, 101, 1, 55000.00),
(24, 1013, 110, 2, 6000.00),
(25, 1014, 102, 1, 25000.00),
(26, 1014, 103, 2, 2000.00),
(27, 1015, 106, 1, 7500.00),
(28, 1015, 109, 3, 1500.00);

-- Verify the data--

SELECT COUNT(*) AS total_order_items
FROM order_items;

-- Data validation + first SQL analysis--Verifying correct num of records in all table--

SELECT 'customers' AS table_name, COUNT(*) AS total_rows
FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;


SELECT * FROM order_items;

-- Analyse order status-- How many orders are Delivered, Pending, and Cancelled?--

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- Calculate completed sales revenue--Our revenue formula is:Revenue=Quantity*Unit Price--
SELECT
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered';

-- Monthly revenue--Which month generated the highest sales revenue?--

SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

-- Top 5 products by revenue--Which products contribute the most revenue?--
SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Category performance--Which product category generates the highest revenue?--
SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY total_revenue DESC;

-- KPI — Total revenue--


SELECT
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered';

-- KPI — Total delivered orders--


SELECT
    COUNT(*) AS total_delivered_orders
FROM orders
WHERE order_status = 'Delivered';

-- KPI — Average Order Value (AOV)--AOV=Delivered revenue/Delivered Orders--

SELECT
    SUM(oi.quantity * oi.unit_price)
        / COUNT(DISTINCT o.order_id) AS average_order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered';

-- KPI — Revenue contribution by category--What percentage of delivered revenue comes from each product category?--

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS category_revenue,
    ROUND(
        100.0 * SUM(oi.quantity * oi.unit_price)
        / (
            SELECT SUM(oi2.quantity * oi2.unit_price)
            FROM order_items oi2
            JOIN orders o2
                ON oi2.order_id = o2.order_id
            WHERE o2.order_status = 'Delivered'
        ),
        2
    ) AS revenue_percentage
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY revenue_percentage DESC;

-- Advanced SQL--Can we classify each product's revenue as High, Medium, or Low?--

SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    CASE
        WHEN SUM(oi.quantity * oi.unit_price) >= 50000
            THEN 'High Revenue'
        WHEN SUM(oi.quantity * oi.unit_price) >= 10000
            THEN 'Medium Revenue'
        ELSE 'Low Revenue'
    END AS revenue_category
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

-- Find the top-selling products using a window function--

SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(oi.quantity * oi.unit_price) DESC
    ) AS revenue_rank
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY revenue_rank;

WITH ProductSales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_name,
    total_revenue
FROM ProductSales
WHERE total_revenue >= 10000
ORDER BY total_revenue DESC;

-- Find product categories with high sales revenue--

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
HAVING SUM(oi.quantity * oi.unit_price) > 10000
ORDER BY total_revenue DESC;

-- Compare monthly revenue--

WITH MonthlySales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
),
SalesComparison AS (
    SELECT
        sales_month,
        total_revenue,
        LAG(total_revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM MonthlySales
)
SELECT
    sales_month,
    total_revenue,
    previous_month_revenue,
    ROUND(
        (total_revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0) * 100,
        2
    ) AS growth_percentage
FROM SalesComparison
ORDER BY sales_month;

-- Check your retail data--

USE retail_sales_analysis;

-- Check 1: Duplicate customer IDs
`

-- Check 2: Missing customer names
SELECT *
FROM customers
WHERE customer_name IS NULL
   OR TRIM(customer_name) = '';

-- Check 3: Missing product prices
SELECT *
FROM products
WHERE unit_price IS NULL
   OR unit_price < 0;

-- Check 4: Invalid order item quantities or prices
SELECT *
FROM order_items
WHERE quantity <= 0
   OR unit_price < 0;
















