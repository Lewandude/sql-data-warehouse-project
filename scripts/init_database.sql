/*
============================================================
Create Database and Schemas
============================================================

Script Purpose:
	This Script creates a new database named "DWH_Project" after checking if it already exists.
	If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
	within the database: 'bronze', 'silver', and 'gold'.

WARNING: 
	Running these scripts will drop the entire 'DWH_Project' database if it exists.
	All data in the database will be permanently deleted. 
	Proceed with caution and ensure you have proper backups before running this script.
*/

use master;
go

-- drop and recreate the 'DWH_Project' database

if exists (select 1 from sys.databases where name = 'DWH_Project')
begin 
	alter database DWH_Project set single_user with rollback immediate;
	drop database DWH_Project;
end;

go

create database DWH_Project;
go

use DWH_Project;
go
create schema bronze;
go
create schema silver;
go
create schema gold;
go


