/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

-- Creating procedure bronze.load_bronze


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	TRUNCATE TABLE bronze.category 
	BULK INSERT bronze.category 
	FROM 'D:\Data Analysis\Projects\3 - Amazon Project\Dataset\category.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
		);

	TRUNCATE TABLE bronze.customers 
	BULK INSERT bronze.customers 
	FROM 'D:\Data Analysis\Projects\3 - Amazon Project\Dataset\customers.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
		);

	TRUNCATE TABLE bronze.inventory 
	BULK INSERT bronze.inventory 
	FROM 'D:\Data Analysis\Projects\3 - Amazon Project\Dataset\inventory.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
		);

	TRUNCATE TABLE bronze.order_items 
	BULK INSERT bronze.order_items 
	FROM 'D:\Data Analysis\Projects\3 - Amazon Project\Dataset\order_items.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
		);

	TRUNCATE TABLE bronze.orders 
	BULK INSERT bronze.orders 
	FROM 'D:\Data Analysis\Projects\3 - Amazon Project\Dataset\orders.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
		);

	TRUNCATE TABLE bronze.payments 
	BULK INSERT bronze.payments 
	FROM 'D:\Data Analysis\Projects\3 - Amazon Project\Dataset\payments.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
		);

	TRUNCATE TABLE bronze.products 
	BULK INSERT bronze.products 
	FROM 'D:\Data Analysis\Projects\3 - Amazon Project\Dataset\products.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
		);

	TRUNCATE TABLE bronze.sellers 
	BULK INSERT bronze.sellers 
	FROM 'D:\Data Analysis\Projects\3 - Amazon Project\Dataset\sellers.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
		);

	TRUNCATE TABLE bronze.shipping 
	BULK INSERT bronze.shipping 
	FROM 'D:\Data Analysis\Projects\3 - Amazon Project\Dataset\shipping.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
		);
END
