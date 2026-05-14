-- Category Table
-- Checking the quality of the primary key
SELECT
	category_id,
	COUNT(*)
FROM bronze.category
GROUP BY category_id
HAVING COUNT(*) > 1 

-- Customers Table
-- Checking the quality of the primary key
SELECT
	customer_id,
	COUNT(*)
FROM bronze.customers
WHERE customer_id IS NULL
GROUP BY customer_id
HAVING COUNT(*) > 1
-- Checking Unwanted Spaces
SELECT
	customer_id,
	last_name
FROM bronze.customers
WHERE TRIM(last_name) != last_name

SELECT
	customer_id,
	first_name
FROM bronze.customers
WHERE TRIM(first_name) != first_name

SELECT
	customer_id,
	state
FROM bronze.customers
WHERE TRIM(state) != state

-- Sellers Table
-- Checking the quality of the Primary key

SELECT 
	seller_id,
	COUNT(*)
FROM bronze.sellers
WHERE seller_id IS NULL
GROUP BY seller_id
HAVING COUNT(*) > 1
-- Checking Unwanted Spaces
SELECT
	*
FROM bronze.sellers
WHERE TRIM(seller_name) != seller_name OR TRIM(origin) != origin

-- Products Table
-- Checking the quality of the Primary key

SELECT 
	product_id,
	COUNT(*)
FROM bronze.products
WHERE product_id IS NULL
GROUP BY product_id
HAVING COUNT(*) > 1
-- Checking Unwanted Spaces
SELECT
	*
FROM bronze.products
WHERE TRIM(product_name) != product_name


-- inventory Table
-- Checking the quality of the primary key
SELECT
	inventory_id,
	COUNT(*)
FROM bronze.inventory
WHERE inventory_id IS NULL
GROUP BY inventory_id
HAVING COUNT(*) > 1

-- Fixing the date column 
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
-- Checking the quality of the primary key

SELECT
	order_id,
	COUNT(*)
FROM bronze.orders
WHERE order_id IS NULL
GROUP BY order_id
HAVING COUNT(*) > 1


-- Checking Unwanted Spaces

SELECT * 
FROM bronze.orders
WHERE TRIM(order_status) != order_status

-- Fixing the date column 
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
-- Check the quality of primary key
SELECT
	order_item_id,
	COUNT(*)
FROM bronze.order_items
WHERE order_item_id IS NULL
GROUP BY order_item_id
HAVING COUNT(*) > 1

-- Checking Unwanted Spaces
 SELECT
	*
FROM bronze.order_items

-- Payment
SELECT
	payment_id,
	COUNT(*)
FROM bronze.payments
WHERE payment_id IS NULL
GROUP BY payment_id
HAVING COUNT(*) > 1

-- Check for unwanted spaces
SELECT * FROM bronze.payments
WHERE TRIM(payment_status) != payment_status

-- Fixing the date column
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
-- Check for the quality of the primary key
SELECT
	shipping_id,
	COUNT(*)
FROM bronze.shipping
WHERE shipping_id IS NULL
GROUP BY shipping_id
HAVING COUNT(*) > 1

-- Check for unwanted spaces
SELECT * FROM bronze.shipping
WHERE TRIM(shipping_prov) != shipping_prov


SELECT * FROM bronze.shipping
WHERE TRIM(delivery_status) != delivery_status

-- Fixing the date column
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
