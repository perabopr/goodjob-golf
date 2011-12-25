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
	
	public static final String getProductReserve
	=	"SELECT " +				
			" A.productsub_seq" +
			",D.golflink_name" +
			",B.product_date" +
			",A.time_start" +
			",A.time_end" +
			",A.goodjob_price" +
			",A.NH_price" +
			",IFNULL(C.course_name, '') course_name" +
			",D.holl_type" +
			",A.product_status " +
		"FROM tb_product_sub A " +
			"INNER JOIN tb_product B on(A.product_seq = B.product_seq) " +
			"LEFT OUTER JOIN tb_golflink_course C on(C.golflink_course_seq = A.golflink_course_seq) " +
			"INNER JOIN tb_golflink D on(B.golflink_seq = D.golflink_seq) " +
		"WHERE A.product_status = '0' " +
			"AND B.golflink_seq = ? " +
			"AND B.product_date = ?";
	
	public static final String getGolfPromise
	=	"SELECT " +
			" C.promise1_type,C.promise1" +
			",C.promise2_type,C.promise2" +
			",C.promise3_type,C.promise3" + 
			",C.promise4_type,C.promise4" +
			",C.promise5_type,C.promise5" +
			",IFNULL(C.cancelrule,'') 'cancelrule'" +
			",IFNULL(D.use_rule,'') 'use_rule' " +
		"FROM tb_product_sub A " +
			"INNER JOIN tb_product B on(A.product_seq = B.product_seq) " +
			"INNER JOIN tb_golflink_promise C on(B.golflink_seq = C.golflink_seq) " +
			"INNER JOIN tb_golflink D on(B.golflink_seq = D.golflink_seq) " +
		"WHERE A.productsub_seq = ?";
	
	public static final String getProductReserve2
	=	"SELECT " +				
			" A.productsub_seq" +
			",D.golflink_name" +
			",B.product_date" +
			",A.time_start" +
			",A.time_end" +
			",IFNULL(C.course_name, '') course_name" +
			",D.holl_type" +
			",A.goodjob_price" +
			",A.NH_price" +
			",A.product_status " +
		"FROM tb_product_sub A " +
			"INNER JOIN tb_product B on(A.product_seq = B.product_seq) " +
			"LEFT OUTER JOIN tb_golflink_course C on(C.golflink_course_seq = A.golflink_course_seq) " +
			"INNER JOIN tb_golflink D on(B.golflink_seq = D.golflink_seq) " +
		"WHERE A.product_status = '0' " +
			"AND A.productsub_seq = ?";
	
	public static final String setGolfLinkReserve_insert
	=	"INSERT INTO tb_golflink_reserve(" +
			" menu_seq" +
			",golflink_seq" +
			",product_seq" +
			",productsub_seq" +
			",reserve_day" +
			",reserve_name" +
			",reserve_uid" +
			",golflink_name" +
			",booking_day" +
			",booking_time" +
			",golflink_course" +
			",per_num" +
			",reserve_phone" +
			",product_price" +
			",coupon_price" +
			",process_status" +
			",card_bill_num" +
		")SELECT " +
			" A.menu_seq" +
			",A.golflink_seq" +
			",B.product_seq" +
			",C.productsub_seq" +
			",curdate(),?,?" +
			",A.golflink_name, B.product_date, C.time_start, IFNULL(D.course_name, '')" +
			",?,?,?,?,?,? " +
		"FROM tb_golflink A " +
			"INNER JOIN tb_product B on(A.golflink_seq = B.golflink_seq) " +
			"INNER JOIN tb_product_sub C on(B.product_seq = C.product_seq) " +
			"LEFT OUTER JOIN tb_golflink_course D on(C.golflink_course_seq = D.golflink_course_seq) " +
		"WHERE C.productsub_seq = ?";
	
	public static final String setProductSub_update
	=	"UPDATE tb_product_sub " +
			"SET product_status = ? " +
		"WHERE productsub_seq = ?";
	
	public static final String getProduct_select
	=	"SELECT " +
			"product_seq" +
			",menu_seq" +
			",golflink_seq" +
			",product_year" +
			",product_month" +
			",product_day" +
			",product_date" +
			",view_yn " +
		"FROM tb_product " +
			"WHERE golflink_seq = ?";
	
	public static final String getPackage_select
	=	"SELECT " +
			" a.package_seq " +
			",a.package_name1 " +
			",a.package_name2 " +
			",a.region_seq " +
			",a.package_type " +
			",a.img_main " +
			",a.img_sub " +
			",a.img_sub1 " +
			",a.img_sub2 " +
			",a.img_sub3 " +
			",a.img_sub4 " +
			",a.address1 " +
			",a.address2 " +
			",a.point_x " +
			",a.point_y " +
			",a.view_yn " +
			",a.package_guide " +
			",a.use_guide " +
			",a.golflink_guide " +
			",a.way_map " +
			",b.peak_n_mon " +
			",b.peak_n_tue " +
			",b.peak_n_wed " +
			",b.peak_n_thu " +
			",b.peak_n_fri " +
			",b.peak_n_sat " +
			",b.peak_n_sun " +
			",b.peak_s_mon " +
			",b.peak_s_tue " +
			",b.peak_s_wed " +
			",b.peak_s_thu " +
			",b.peak_s_fri " +
			",b.peak_s_sat " +
			",b.peak_s_sun " +
			",b.off_n_mon " +
			",b.off_n_tue " +
			",b.off_n_wed " +
			",b.off_n_thu " +
			",b.off_n_fri " +
			",b.off_n_sat " +
			",b.off_n_sun " +
			",b.off_s_mon " +
			",b.off_s_tue " +
			",b.off_s_wed " +
			",b.off_s_thu " +
			",b.off_s_fri " +
			",b.off_s_sat " +
			",b.off_s_sun " +
		"FROM tb_package a " +
			"INNER JOIN tb_package_price b ON(a.package_seq = b.package_seq) " +
		"WHERE 1=1 %s";
}
