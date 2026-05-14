/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
    Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

-- Category Tbale
DROP TABLE IF EXISTS bronze.category
GO
CREATE TABLE bronze.category(
	category_id	INT,
	category_name NVARCHAR(MAX)
);

-- Customer Table
DROP TABLE IF EXISTS bronze.customers
GO
CREATE TABLE bronze.customers(
	customer_id	INT,
	first_name	NVARCHAR(MAX),
	last_name	NVARCHAR(MAX), 	
	state	NVARCHAR(MAX)
);

-- Seller Table
DROP TABLE IF EXISTS bronze.sellers
GO
CREATE TABLE bronze.sellers(
	seller_id INT,
	seller_name	 NVARCHAR(MAX),
	origin	NVARCHAR(MAX)
);

-- Products Table
DROP TABLE IF EXISTS bronze.products
GO
CREATE TABLE bronze.products(
	product_id	INT,
	product_name	NVARCHAR(MAX),
	price	FLOAT,
	cogs	FLOAT,
	category_id	INT
);

-- Orders Table
DROP TABLE IF EXISTS bronze.orders
GO
CREATE TABLE bronze.orders(
	order_id	INT,
	order_date	NVARCHAR(MAX),
	customer_id	INT, 
	seller_id	INT, 
	order_status NVARCHAR(MAX)
);

-- Orders_Items Table
DROP TABLE IF EXISTS bronze.order_items
GO
CREATE TABLE bronze.order_items(
	order_item_id	INT,
	order_id	INT,
	product_id	INT,
	quantity	INT,
	price_per_unit	FLOAT
);


-- Payments Table
DROP TABLE IF EXISTS bronze.payments
GO
CREATE TABLE bronze.payments(
	payment_id	INT,
	order_id	INT,
	payment_date	NVARCHAR(MAX),
	payment_status	NVARCHAR(MAX)
);

-- Shipping Table
DROP TABLE IF EXISTS bronze.shipping
GO
CREATE TABLE bronze.shipping(
	shipping_id	INT,
	order_id	INT,
	shipping_date NVARCHAR(MAX),	
	return_date	NVARCHAR(MAX),
	shipping_prov	NVARCHAR(MAX),
	delivery_status	NVARCHAR(MAX)
);

-- Inventory Table
DROP TABLE IF EXISTS bronze.inventory
GO
CREATE TABLE bronze.inventory(
	inventory_id	INT,
	product_id	INT,
	stock	INT,
	warehouse_id	INT,	
	last_stock_date	NVARCHAR(MAX)
);
