package com.goodjob.sql;

public class ORDER {

	public static final int per_page = 20;
	
	public static final String listRealPre 
	=	"SELECT " +
			" reserve_seq " +
			",menu_seq " +
			",golflink_seq "+
			",product_seq "+
			",productsub_seq "+
			",date_format(reserve_day,''%Y-%m-%d %H:%i'') reserve_day "+
			",reserve_name "+
			",reserve_uid "+
			",golflink_name "+
			",booking_day "+
			",booking_time_s "+
			",booking_time_e "+
			",golflink_course "+
			",per_num "+
			",reserve_phone "+
			",product_price "+
			",coupon_price "+
			",process_status "+
			",site_seq " +
		"FROM {0}" +
		" {1} ORDER BY reserve_seq desc LIMIT ? , ? ";
	
	public static final String RealPre
	=	"SELECT " +
			" reserve_seq " +
			",menu_seq " +
			",golflink_seq "+
			",product_seq "+
			",productsub_seq "+
			",reserve_day "+
			",reserve_name "+
			",reserve_uid "+
			",golflink_name "+
			",booking_day "+
			",booking_time_s "+
			",booking_time_e "+
			",golflink_course "+
			",per_num "+
			",reserve_phone "+
			",product_price "+
			",coupon_price "+
			",process_status "+
			",site_seq " +
		"FROM tb_golflink_reserve " +
		"WHERE reserve_seq = ?";
	
	public static final String listPackage
	=	"SELECT " +
			" reserve_seq" +
			",menu_seq " +
			",package_seq " +
			",date_format(reserve_day,''%Y-%m-%d %H:%i'') reserve_day " +
			",reserve_name " +
			",reserve_uid " +
			",package_name1 " +
			",package_name2 " +
			",tour_date " +
			",per_num " +
			",reserve_phone " +
			",package_price " +
			",balance_price " +
			",IFNULL(request_content, '''') request_content " +
			",process_status " +
			",site_seq " +
		"FROM {0}" +
		" {1} ORDER BY reserve_seq desc LIMIT ? , ? ";
	
	public static final String Package
	=	"SELECT " +
			" reserve_seq" +
			",menu_seq " +
			",package_seq " +
			",reserve_day " +
			",reserve_name " +
			",reserve_uid " +
			",package_name1 " +
			",package_name2 " +
			",tour_date " +
			",per_num " +
			",reserve_phone " +
			",package_price " +
			",IFNULL(request_content, '''') request_content " +
			",process_status " +
			",site_seq " +
		"FROM tb_package_reserve " +
		"WHERE reserve_seq = ?";
	
	public static final String listCondo
	=	"SELECT " +
			" reserve_seq " +
			",menu_seq " +
			",condo_seq " +
			",date_format(reserve_day,''%Y-%m-%d %H:%i'') reserve_day " +
			",reserve_uid " +
			",reserve_name " +
			",condo_name " +
			",roomtype " +
			",condoroom_seq " +
			",in_date " +
			",out_date " +
			",per_num " +
			",room_num " +
			",reserve_phone " +
			",condo_price " +
			",reserve_memo " +
			",process_status " +
			",site_seq " +
		"FROM {0}" +
		" {1} ORDER BY reserve_seq desc LIMIT ? , ? ";
	
	public static final String Condo
	=	"SELECT " +
			" reserve_seq " +
			",menu_seq " +
			",condo_seq " +
			",reserve_day " +
			",reserve_uid " +
			",reserve_name " +
			",condo_name " +
			",roomtype " +
			",condoroom_seq " +
			",in_date " +
			",out_date " +
			",per_num " +
			",room_num " +
			",reserve_phone " +
			",condo_price " +
			",reserve_memo " +
			",process_status " +
			",site_seq " +
		"FROM tb_condo_reserve " +
		"WHERE reserve_seq = ?";
	
	public static final String totalcnt = "SELECT COUNT(*) AS cnt FROM {0} {1} ";
	
	public static final String max = " SELECT IFNULL(MAX(seq),0)+1 as seq FROM %s ";
	
	public static final String view = "SELECT * FROM %s WHERE seq = ? ";
	
	public static final String update = "UPDATE {0} SET {1} WHERE reserve_seq = ?";
		
	public static final String product_sub_status_update
	=	"UPDATE tb_product_sub " +
		"SET product_status = ? " +
		"WHERE productsub_seq = ?";
	
	public static final String product_sub_seq_select
	=	"SELECT " +
			" reserve_seq " +
			",menu_seq " +
			",golflink_seq " +
			",product_seq " +
			",productsub_seq " +
		"FROM tb_golflink_reserve " +
		"WHERE reserve_seq = ?";

	//통합 검색
	public static final String reserveTotalSearch_select
	=	"SELECT " +
			" reserve_seq " +
			",menu_seq " +
			",reserve_day " +
			",reserve_name " +
			",reserve_uid " +
			",reserve_phone " +
			",golflink_name " +
			",booking_day " +
			",process_status " +
			",site_seq " +
		"FROM tb_golflink_reserve " +
		" {0} " +
		"UNION ALL " +
		"SELECT " +
			" reserve_seq " +
			",menu_seq " +
			",reserve_day " +
			",reserve_name " +
			",reserve_uid " +
			",reserve_phone " +
			",CASE package_name2 WHEN '''' THEN package_name1 ELSE CONCAT(package_name1 , ''+'' , package_name2) END " +
			",tour_date " +
			",process_status " + 
			",site_seq " +
		"FROM tb_package_reserve " +
		" {1} " +
		"UNION ALL " +
		"SELECT " +
			" reserve_seq " +
			",menu_seq " +
			",reserve_day " +
			",reserve_name " +
			",reserve_uid " +
			",reserve_phone " +
			",condo_name " +
			",in_date " +
			",process_status " +
			",site_seq " +
		"FROM tb_condo_reserve " +
		" {2} " +
		" order by reserve_day desc {3} ";
}
