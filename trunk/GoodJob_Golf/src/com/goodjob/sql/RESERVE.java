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
}
