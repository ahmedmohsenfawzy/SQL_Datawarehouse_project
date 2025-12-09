/*
=========================================================
Store procedure: load bronze layer (source -> bronze)
=========================================================
Script purpose:
	this store procedure load the data into bronze schema from csv files.

	steps:
		1. truncate the bronze table before loading date.
		2. uses the Bulk insert command to load the date from the csv file to bronze table
	parameter: none.

	how to use?
		type -> EXEC bronze.load_bronze;

*/

create or alter procedure bronze.load_bronze as
begin
	declare @start_time datetime, @end_time datetime, @start_load datetime, @end_load datetime;
	begin try
		print('============================================================');
		print('loading bronze layer');
		print('============================================================');
		print('------------------------------------------------------------');
		print('loading crm table');
		print('------------------------------------------------------------');
		set @start_load = getdate();
		set @start_time = getdate();
		print 'Truncate Table : bronze.crm_cust_info';
		truncate table bronze.crm_cust_info;

		print 'Bulk Insert data into : bronze.crm_cust_info';
		bulk insert bronze.crm_cust_info
		from 'C:\ahmedmohsen\Learn\courses\SQL Data Warehouse Data Engineering Project\project-main\datasets\source_crm\cust_info.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast( datediff(second, @start_time, @end_time) as nvarchar) + 'seconds';

		set @start_time = getdate();
		print 'Truncate Table : bronze.crm_prd_info';
		truncate table bronze.crm_prd_info;

		print 'Bulk Insert data into : bronze.crm_prd_info';
		bulk insert bronze.crm_prd_info
		from 'C:\ahmedmohsen\Learn\courses\SQL Data Warehouse Data Engineering Project\project-main\datasets\source_crm\prd_info.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast( datediff(second, @start_time, @end_time) as nvarchar) + 'seconds';


		set @start_time = getdate();
		print 'Truncate Table : bronze.crm_sales_details';
		truncate table bronze.crm_sales_details;

		print 'Bulk Insert data into : bronze.crm_sales_details';
		bulk insert bronze.crm_sales_details
		from 'C:\ahmedmohsen\Learn\courses\SQL Data Warehouse Data Engineering Project\project-main\datasets\source_crm\sales_details.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast( datediff(second, @start_time, @end_time) as nvarchar) + 'seconds';


		print '-------------------------------------------------------';
		print 'Loading erp Table';
		print '-------------------------------------------------------';

		set @start_time = getdate();
		print 'Truncate Table :bronze.erp_cust_az12';
		truncate table bronze.erp_cust_az12;

		print 'Bulk Insert into :bronze.erp_cust_az12 ';
		bulk insert bronze.erp_cust_az12
		from 'C:\ahmedmohsen\Learn\courses\SQL Data Warehouse Data Engineering Project\project-main\datasets\source_erp\CUST_AZ12.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast( datediff(second, @start_time, @end_time) as nvarchar) + 'seconds';


		set @start_time = getdate();
		print 'Truncate Table :bronze.erp_loc_a101';
		truncate table bronze.erp_loc_a101;

		print 'Bulk Insert into :bronze.erp_loc_a101';
		bulk insert bronze.erp_loc_a101
		from 'C:\ahmedmohsen\Learn\courses\SQL Data Warehouse Data Engineering Project\project-main\datasets\source_erp\LOC_A101.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast( datediff(second, @start_time, @end_time) as nvarchar) + 'seconds';

		set @start_time = getdate();
		print 'Truncate Table :bronze.erp_px_cat_g1v2';
		truncate table bronze.erp_px_cat_g1v2;

		print 'Bulk Insert into :bronze.erp_px_cat_g1v2';
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\ahmedmohsen\Learn\courses\SQL Data Warehouse Data Engineering Project\project-main\datasets\source_erp\PX_CAT_G1V2.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast( datediff(second, @start_time, @end_time) as nvarchar) + 'seconds';
		set @end_load = getdate();
		print '>> the Full duration of load bronze layer: ' + cast( datediff(second, @start_load, @end_load) as nvarchar) + 'secends';
	end try
	begin catch
		print '============================================';
		print 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		print 'Error Message' + error_message();
		print 'Error Message' + cast (error_number() as nvarchar);
		print 'Error Message' + cast (error_state() as nvarchar);
		print '============================================';
	end catch
end;
