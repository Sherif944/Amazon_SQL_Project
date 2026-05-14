/*
===========================
Create Database and Schemas
===========================
Script Purpose:
This script creates a new database named 'AMAZON' after checking if it already exists. 
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
within the database: 'bronze', 'silver', and 'gold'.

WARNING: 
Running this script will drop the entire 'AMAZON' database if it exists. 
All data in the database will be permanently deleted. Proceed with caution 
and ensure you have proper backups before running this script.
*/

IF EXISTS (SELECT 1 FROM sys.databases WHERE NAME = 'AMAZON')
BEGIN
	ALTER DATABASE AMAZON SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE AMAZON;
END
GO
CREATE DATABASE AMAZON;
GO

USE AMAZON
GO
  
-- Creating Schemas bronze, silver and gold 

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
