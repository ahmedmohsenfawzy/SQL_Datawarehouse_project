/*
====================================================
DDL Script: create bronze table
====================================================
Script prepoes:
	this script create the tables for "bronze" layer/schema, if the table exists
	the table drop then recreated.
	
	run this code to re-define the "bronze" tables
====================================================
*/


if object_id ('bronze.crm_cust_info', 'u') is not null
	drop table bronze.crm_cust_info;
create table bronze.crm_cust_info(
	cst_id				int,
	cst_key				varchar(50),
	cst_firstname		varchar(50),
	cst_lastname		varchar(50),
	cst_marital_status  varchar(50),
	cst_gndr		    varchar(50),
	cst_create_date		date
);

if object_id ('bronze.crm_prd_info', 'u') is not null
	drop table bronze.crm_prd_info;
create table bronze.crm_prd_info(
	prd_id			int,
	prd_key			varchar(50),
	prd_nm			varchar(50),
	prd_cost		int,
	prd_line		varchar(50),
	prd_start_dt	datetime,
	prd_end_dt		datetime
);

if object_id ('bronze.crm_sales_details', 'u') is not null
	drop table bronze.crm_sales_details;
create table bronze.crm_sales_details(
	sls_ord_num		 varchar(50),
	sls_prd_key		 varchar(50),
	sls_cust_id		 int,
	sls_order_dt	 int,
	sls_ship_dt		 int,
	sls_due_dt		 int,
	sls_sales		 int,
	sls_quantity	 int,
	sls_price int
);

if object_id ('bronze.erp_cust_az12', 'u') is not null
	drop table bronze.erp_cust_az12;
create table bronze.erp_cust_az12(
	cid		varchar(50),
	bdate	date,
	gen		varchar(50)
);

if object_id ('bronze.erp_loc_a101', 'u') is not null
	drop table bronze.erp_loc_a101;
create table bronze.erp_loc_a101(
	cid		varchar(50),
	cntry	varchar(50)
);

if object_id ('bronze.erp_px_cat_g1v2', 'u') is not null
	drop table bronze.erp_px_cat_g1v2;
create table bronze.erp_px_cat_g1v2(
	id			varchar(50),
	cat			varchar(50),
	subcat		varchar(50),
	maintenance varchar(50)
);
