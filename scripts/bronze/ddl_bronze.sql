/*
DDL Script: Create Bronze Tables
=============================================================================
Script Purpose:
Run this to refine to re_define the DDL structure of 'bronze' Tables
=============================================================================
*/

create database DataWareHouse;

create schema bronze;

create schema silver;

create schema gold;


use datawarehouse;


 CREATE TABLE bronze.crm_cust_info (
    cstid INT, 
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr NVARCHAR(50),
    cst_create_date DATE
);

select * from bronze.crm_cust_info;

bulk insert bronze.crm_cust_info
from 'E:\datasets\datasets\source_crm\cust_info.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);


CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);


bulk insert bronze.crm_prd_info
from 'E:\datasets\datasets\source_crm\prd_info.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);


CREATE TABLE bronze.crm_sales_details (
    sls_ord_num   NVARCHAR(50),
    sls_prd_key   NVARCHAR(50),
    sls_cust_id   INT,
    sls_order_dt  int,
    sls_ship_dt   int,
    sls_due_dt    int,
    sls_sales     INT,
    sls_quantity  INT,
    sls_price     INT
);


bulk insert bronze.crm_sales_details
from 'E:\datasets\datasets\source_crm\sales_details.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);


create table bronze.erp_cust_az12(
cid  nvarchar(50),
bdate  date,
gen nvarchar(50)
);



bulk insert bronze.erp_cust_az12
from  'E:\datasets\datasets\source_erp\cust_az12.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);


create table bronze.erp_loc_a101(
cid nvarchar(50),
city nvarchar(50)
);


bulk insert bronze.erp_loc_a101
from  'E:\datasets\datasets\source_erp\loc_a101.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);


create table bronze.erp_px_cat_g1v2 (
id  nvarchar(50),
cat  nvarchar(50),
subcat  nvarchar(50),
maintenance  nvarchar(50)
);

bulk insert bronze.erp_px_cat_g1v2
from  'E:\datasets\datasets\source_erp\px_cat_g1v2.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);



