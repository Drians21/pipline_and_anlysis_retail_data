-- Dimensi Customer
CREATE TABLE IF NOT EXISTS dim_customers AS
SELECT DISTINCT
    customer_id,
    first_name,
    last_name,
    gender,
    address,
    zip_code
FROM customers;

-- Dimensi Supplier
CREATE TABLE IF NOT EXISTS dim_suppliers AS
SELECT DISTINCT
    supplier_id,
    supplier_name,
    supplier_country
FROM suppliers;

-- Dimensi Produk
CREATE TABLE IF NOT EXISTS dim_products AS
SELECT DISTINCT
    p.product_id,
    p.product_name,
    pc.category_name AS product_category
FROM products p
LEFT JOIN product_category pc ON p.category_id = pc.product_category_id;

-- Dimensi Login Attempts
CREATE TABLE IF NOT EXISTS dim_login_attempts as (
SELECT DISTINCT
    login_attempts_id,
    login_status,
    attempted_at
FROM login_attempts

);

-- create fact table
CREATE TABLE IF NOT EXISTS product_sales AS
SELECT
    oi.order_id,
    oi.product_id,
    o.customer_id,
    p.supplier_id,
    la.login_attempts_id,
    o.created_at AS order_date,
    oi.amount,
    c.dsicont_percent AS discount_percent,
    p.price
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN coupons c ON oi.coupon_id = c.coupon_id
LEFT JOIN login_attempts la ON la.customer_id = o.customer_id;
