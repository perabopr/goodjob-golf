package com.goodjob.sql;

public class RESERVE {
	public static final String getReserveGolf
	=	"SELECT " +
			" A.golflink_seq " +
			",A.golflink_name " +
		"FROM tb_golflink A " +
		"WHERE A.view_yn = 'Y' %s";
		/*
			"AND A.region_seq = 1 "
			"AND A.menu_seq = 1 " +
			"AND A.golflink_name LIKE '%2%'	";
		*/
	public static final String getReserveGolfDate
	=	"SELECT " +
			" A.product_year" +
			",A.product_month" +
			",A.product_day" +
			",A.product_date" +
			",count(*) 'product_cnt' " +
		"FROM tb_product A " +
			"INNER JOIN tb_product_sub B on(A.product_seq = B.product_seq) " +
		"WHERE A.view_yn = 'Y' " +
			"AND B.product_status = '0' " +
			"AND A.golflink_seq = ? " +
			"AND A.product_date >= ? AND A.product_date <= ? " +
		"GROUP BY A.product_year, A.product_month, A.product_day ";	

	public static final String getDetailGolf
		=	"SELECT " +
				" golflink_seq " +
				",menu_seq " +
				",golflink_name " +
				",region_seq " +
				",holl_type " +
				",course_guide " +
				",golflink_address1 " +
				",golflink_address2 " +
				",point_x " +
				",point_y " +
				",img_main " +
				",img_sub1 " +
				",img_sub2 " +
				",img_sub3 " +
				",img_sub4 " +
				",cancel_term " +
				",view_yn" +
				",cancel_rule" +
				",promise_rule" +
				",use_guide" +
				",golflink_guide " +	
			"FROM tb_golflink " +
			"WHERE view_yn = 'Y' " +
				"AND golflink_seq = ?";	

	public static final String getDetailGolfPrice
		= 	"SELECT" +
				" golflink_seq" +
				",price_type" +
				",golflink_price " +
			"FROM tb_golflink_price "	+ 
			"WHERE golflink_seq = ?";
}
