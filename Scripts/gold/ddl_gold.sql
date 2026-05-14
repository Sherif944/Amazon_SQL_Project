/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse.
    The Gold layer represents the final dimension and fact tables (Star Schema).

    Each view performs transformations and combines data from the Silver layer
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- Building the gold layer ' fact and dimension tables ' following the star schema model

-- Creating fact table ' gold.fact_sales':

CREATE VIEW gold.fact_sales AS
SELECT
	oi.order_item_id,
	oi.order_id,
	oi.product_id,
	o.customer_id,
	o.seller_id,
	oi.quantity,
	oi.price_per_unit,
	p.price AS product_price,
	o.order_date,
	pa.payment_date
FROM silver.order_items oi
LEFT JOIN silver.orders o
ON oi.order_id = o.order_id
LEFT JOIN silver.products p
ON oi.product_id = p.product_id
LEFT JOIN silver.payments pa
ON oi.order_id = pa.order_id

-- Creating Dimension tables:
-- gold.dim_products
CREATE VIEW gold.dim_products AS
SELECT
	p.product_id,
	i.inventory_id,
	i.warehouse_id,
	p.category_id,
	c.category_name,
	p.product_name,
	i.stock,
	p.price,
	p.cogs,
	i.last_stock_date
FROM silver.products p
LEFT JOIN silver.inventory i
ON p.product_id = i.product_id
LEFT JOIN silver.category c
ON p.category_id = c.category_id

-- gold.dim_customers
CREATE VIEW gold.dim_customers AS
SELECT
	customer_id,
	first_name,
	last_name,
	state
FROM silver.customers


-- gold.dim_sellers:
CREATE VIEW gold.dim_sellers AS
SELECT
	seller_id,
	seller_name,
	origin
FROM silver.sellers


-- gold.dim_payments:
CREATE VIEW gold.dim_payments AS
SELECT
	payment_id,
	order_id,
	payment_date,
	payment_status
FROM silver.payments


-- gold.dim_shipping
CREATE VIEW gold.dim_shipping AS
SELECT
	shipping_id,
	order_id,
	shipping_date,
	return_date,
	shipping_prov,
	delivery_status
FROM silver.shipping
