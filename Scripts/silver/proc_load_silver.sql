/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
Actions Performed:
    - Inserts transformed and cleansed data from Bronze into Silver tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/

-- Transforming and loading data into silver layer


CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
	-- Category Table

	INSERT INTO silver.category (category_id, category_name)
	SELECT
		category_id,
		category_name
	FROM [bronze].[category]

	-- Customers Table
	TRUNCATE TABLE silver.customers
	INSERT INTO silver.customers(customer_id, first_name, last_name, state)
	SELECT
		customer_id,
		first_name,
		last_name,
		state
	FROM bronze.customers

	-- Seller table
	INSERT INTO silver.sellers(seller_id, seller_name, origin)
	SELECT
		seller_id,
		seller_name,
		origin
	FROM bronze.sellers

	-- Products Table
	INSERT INTO silver.products(product_id, product_name, price, cogs, category_id)
	SELECT
		product_id,
		product_name,
		price,
		cogs,
		category_id
	FROM bronze.products

	-- Inventory table
	INSERT INTO silver.inventory(inventory_id, product_id, stock, warehouse_id, last_stock_date)
	SELECT
		inventory_id,
		product_id,
		stock,
		warehouse_id,
		CASE
			WHEN clean_date_1 IS NULL THEN clean_date
			WHEN clean_date IS NULL THEN clean_date_1
			ELSE NULL
		END the_last_stock_date
	FROM(
	SELECT
		*,
		TRY_CAST(last_stock_date AS DATE) clean_date_1,
		TRY_CONVERT(DATE, last_stock_date, 3) clean_date
	FROM bronze.inventory) t

	-- Orders Table
	INSERT INTO silver.orders(order_id, order_date, customer_id, seller_id, order_status)
	SELECT
		order_id,
		CASE
			WHEN clean_date_1 IS NULL THEN clean_date_2
			WHEN clean_date_2 IS NULL THEN clean_date_1
			ELSE 'n/a'
		END order_date,
		customer_id,
		seller_id,
		order_status
	FROM
	(
	SELECT
		order_id,
		order_date,
		TRY_CAST(order_date AS DATE) clean_date_1,
		TRY_CONVERT(DATE, order_date, 3) clean_date_2,
		customer_id,
		seller_id,
		order_status
	FROM bronze.orders)t

	-- Order Items Table
	INSERT INTO silver.order_items(order_item_id, order_id, product_id, quantity, price_per_unit)
	SELECT
		order_item_id,
		order_id,
		product_id,
		quantity,
		price_per_unit
	FROM bronze.order_items

	-- Payment Table
	TRUNCATE TABLE silver.payments
	INSERT INTO silver.payments(payment_id, order_id, payment_date, payment_status)
	SELECT
		payment_id,
		order_id,
		CASE
			WHEN clean_date_1 IS NULL THEN clean_date_2
			WHEN clean_date_2 IS NULL THEN clean_date_1
			ELSE 'n/a'
		END payment_date,
		payment_status
	FROM(
	SELECT
		payment_id,
		order_id,
		payment_date,
		TRY_CAST(payment_date AS DATE) clean_date_1,
		TRY_CONVERT(DATE, payment_date, 3) clean_date_2,
		payment_status
	FROM bronze.payments)t

	-- Shipping Table
	INSERT INTO silver.shipping(shipping_id, order_id, shipping_date, return_date, shipping_prov, delivery_status)
	SELECT
		shipping_id,
		order_id,
		CASE
			WHEN clean_date_1 IS NULL THEN clean_date_2
			WHEN clean_date_2 IS NULL THEN clean_date_1
			ELSE 'n/a'
		END shipping_date,
		return_date,
		shipping_prov,
		delivery_status
	FROM
	(
	SELECT
		shipping_id,
		order_id,
		shipping_date,
		TRY_CAST(shipping_date AS DATE) clean_date_1,
		TRY_CONVERT(DATE, shipping_date, 3) clean_date_2,
		return_date,
		shipping_prov,
		delivery_status
	FROM bronze.shipping)t
END
