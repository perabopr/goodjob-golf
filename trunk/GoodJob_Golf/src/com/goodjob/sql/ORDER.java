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
			",reserve_day "+
			",reserve_name "+
			",reserve_uid "+
			",golflink_name "+
			",booking_day "+
			",booking_time "+
			",golflink_course "+
			",per_num "+
			",reserve_phone "+
			",product_price "+
			",coupon_price "+
			",process_status "+
		"FROM {0}" +
		" {1} ORDER BY reserve_seq desc LIMIT ? , ? ";
	
	public static final String listPackage
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
		"FROM {0}" +
		" {1} ORDER BY reserve_seq desc LIMIT ? , ? ";
	
	public static final String listCondo
	=	"SELECT " +
			" reserve_seq " +
			",menu_seq " +
			",condo_seq " +
			",reserve_day " +
			",reserve_name " +
			",condo_name " +
			",roomtype " +
			",in_date " +
			",out_date " +
			",reserve_phone " +
			",condo_price " +
			",process_status " +
		"FROM {0}" +
		" {1} ORDER BY reserve_seq desc LIMIT ? , ? ";
	
	public static final String totalcnt = "SELECT COUNT(*) AS CNT FROM {0} {1} ";
	
	public static final String max = " SELECT IFNULL(MAX(seq),0)+1 as seq FROM %s ";
	
	public static final String view = "SELECT * FROM %s WHERE seq = ? ";
	
	public static final String update = "UPDATE {0} SET {1} WHERE reserve_seq = ?";
}
