/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
    Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/

-- Category Tbale
DROP TABLE IF EXISTS silver.category
GO
CREATE TABLE silver.category(
	category_id	INT PRIMARY KEY,
	category_name NVARCHAR(MAX)
);

-- Customer Table
DROP TABLE IF EXISTS silver.customers
GO
CREATE TABLE silver.customers(
	customer_id	INT PRIMARY KEY,
	first_name	NVARCHAR(MAX),
	last_name	NVARCHAR(MAX), 	
	state	NVARCHAR(MAX)
);

-- Seller Table
DROP TABLE IF EXISTS silver.sellers
GO
CREATE TABLE silver.sellers(
	seller_id INT PRIMARY KEY,
	seller_name	 NVARCHAR(MAX),
	origin	NVARCHAR(MAX)
);

-- Products Table
DROP TABLE IF EXISTS silver.products
GO
CREATE TABLE silver.products(
	product_id	INT PRIMARY KEY,
	product_name	NVARCHAR(MAX),
	price	FLOAT,
	cogs	FLOAT,
	category_id	INT, -- FK
	CONSTRAINT products_fk_category FOREIGN KEY (category_id) REFERENCES silver.category (category_id) 
);

-- Orders Table
DROP TABLE IF EXISTS silver.orders
GO
CREATE TABLE silver.orders(
	order_id	INT PRIMARY KEY,
	order_date	DATE,
	customer_id	INT, -- FK
	seller_id	INT, -- FK
	order_status NVARCHAR(MAX),
	CONSTRAINT orders_fk_customers FOREIGN KEY (customer_id) REFERENCES silver.customers (customer_id),
	CONSTRAINT orders_fk_sellers FOREIGN KEY (seller_id) REFERENCES silver.sellers (seller_id)
);

-- Orders_Items Table
DROP TABLE IF EXISTS silver.order_items
GO
CREATE TABLE silver.order_items(
	order_item_id	INT PRIMARY KEY,
	order_id	INT, -- FK
	product_id	INT, -- FK
	quantity	INT,
	price_per_unit	FLOAT,
	CONSTRAINT order_items_fk_orders FOREIGN KEY (order_id) REFERENCES silver.orders (order_id),
	CONSTRAINT order_items_fk_products FOREIGN KEY (product_id) REFERENCES silver.products (product_id)
);


-- Payments Table
DROP TABLE IF EXISTS silver.payments
GO
CREATE TABLE silver.payments(
	payment_id	INT PRIMARY KEY,
	order_id	INT, --FK
	payment_date	DATE,
	payment_status	NVARCHAR(MAX),
	CONSTRAINT payments_fk_orders FOREIGN KEY (order_id) REFERENCES silver.orders (order_id)
);

-- Shipping Table
DROP TABLE IF EXISTS silver.shipping
GO
CREATE TABLE silver.shipping(
	shipping_id	INT PRIMARY KEY,
	order_id	INT, --FK
	shipping_date DATE,	
	return_date	DATE,
	shipping_prov	NVARCHAR(MAX),
	delivery_status	NVARCHAR(MAX),
	CONSTRAINT shipping_fk_orders FOREIGN KEY (order_id) REFERENCES silver.orders (order_id)
);

-- Inventory Table
DROP TABLE IF EXISTS silver.inventory
GO
CREATE TABLE silver.inventory(
	inventory_id	INT PRIMARY KEY,
	product_id	INT, --FK
	stock	INT,
	warehouse_id	INT,	
	last_stock_date	DATE,
	CONSTRAINT inventory_fk_products FOREIGN KEY (product_id) REFERENCES silver.products (product_id)
);
