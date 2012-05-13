package com.goodjob.sql;

public class STATS {
	
	
	public static final String golf_stats
	=	"SELECT " +
	    	" date_format(A.reserve_day, ''%Y-%m-%d'') reserve_day " +
	    	",A.golflink_name reserve_prdt_name " +
	    	",SUM(IF (A.process_status = 0, 1, 0)) process_status0 " +
	    	",SUM(IF (A.process_status = 1, 1, 0)) process_status1 " +
	    	",SUM(IF (A.process_status = 3, 1, 0)) process_status3 " +
	    	",SUM(A.coupon_price) coupon_price " +
	    	",SUM(A.product_price) product_price " +
	    	",SUM(A.per_num) per_num , booking_day " +
	    "FROM tb_golflink_reserve A " +
	    	"INNER JOIN tb_golflink B on(A.golflink_seq = B.golflink_seq) " +
	    "WHERE A.process_status = 1 {0} " +
	    "GROUP BY booking_day, A.golflink_name " +
	    "ORDER BY booking_day, A.golflink_name ";
	
	public static final String package_stats
	=	"SELECT	" +
			" date_format(A.reserve_day, ''%Y-%m-%d'') reserve_day " +
			",CONCAT(A.package_name1 , ''+'', A.package_name2) package_name " +
			",SUM(IF (A.process_status = 0, 1, 0)) process_status0 " +
			",SUM(IF (A.process_status = 1, 1, 0)) process_status1 " +
			",SUM(IF (A.process_status = 3, 1, 0)) process_status3 " +
			",SUM(0) 'coupon_price' " +
			",SUM(A.package_price) product_price " +
			",SUM(A.per_num) per_num , tour_date " +
		"FROM tb_package_reserve A " +
			"INNER JOIN tb_package B on(A.package_seq = B.package_seq) " +
		"WHERE A.process_status = 1 {0} " +
		"GROUP BY tour_date, CONCAT(A.package_name1 , ''+'', A.package_name2) " +
		"ORDER BY tour_date, CONCAT(A.package_name1 , ''+'', A.package_name2) ";
	
	public static final String condo_stats
	=	"SELECT	" +
	    	" date_format(A.reserve_day, ''%Y-%m-%d'') reserve_day " +
	    	",A.condo_name reserve_prdt_name " +
	    	",SUM(IF (A.process_status = 0, 1, 0)) process_status0 " +
	    	",SUM(IF (A.process_status = 1, 1, 0)) process_status1 " +
	    	",SUM(IF (A.process_status = 3, 1, 0)) process_status3 " +
	    	",SUM(0) 'coupon_price' " +
	    	",SUM(A.condo_price) product_price " +
	    	",SUM(A.per_num) per_num , in_date " +
		"FROM tb_condo_reserve A " +
			"INNER JOIN tb_condo B on(A.condo_seq = B.condo_seq) " +
		"WHERE A.process_status = 1 {0} " +
	    "GROUP BY in_date, A.condo_name " +
	    "ORDER BY in_date, A.condo_name ";
	
	
	
}
