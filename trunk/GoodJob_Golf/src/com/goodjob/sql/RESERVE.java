package com.goodjob.sql;

public class RESERVE {
	public static final String getReserveGolf
	=	"SELECT " +
			" A.golflink_seq " +
			",A.golflink_name " +
			",A.event_price " +
			",B.region_name " +
		"FROM tb_golflink A " +
			"INNER JOIN tb_region B on(A.region_seq = B.region_seq) " +
		"WHERE A.view_yn = 'Y' %s " +
		"ORDER BY B.region_seq, A.golflink_name";
		
	
	public static final String getReserveGolfDate
	=	"SELECT " +
			" A.product_seq" +
			",A.product_year" +
			",A.product_month" +
			",A.product_day" +
			",A.product_date" +
			",A.view_yn" +
			",COUNT(*) 'product_cnt' " +
		"FROM tb_product A " +
			"INNER JOIN tb_product_sub B on(A.product_seq = B.product_seq) " +
		"WHERE A.golflink_seq = ? " +
			"AND A.product_date >= ? AND A.product_date <= ? " +
		"GROUP BY A.product_year, A.product_month, A.product_day " +
		"ORDER BY A.product_year, A.product_month, A.product_day";
	
	public static final String getProductSub_count
	=	"SELECT COUNT(*) AS cnt " +
		"FROM tb_product_sub A " +
			"INNER JOIN tb_product B ON(A.product_seq = B.product_seq) " +			
		"WHERE A.product_status = '0' " +
		"AND A.product_seq = ?";
	

	public static final String getDetailGolf
	=	"SELECT " +
			" golflink_seq " +
			",menu_seq " +
			",golflink_name " +
			",event_price " +
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
			",use_rule " +
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
			",A.coupon_use_yn " +
		"FROM tb_product_sub A " +
			"INNER JOIN tb_product B on(A.product_seq = B.product_seq) " +
			"LEFT OUTER JOIN tb_golflink_course C on(C.golflink_course_seq = A.golflink_course_seq) " +
			"INNER JOIN tb_golflink D on(B.golflink_seq = D.golflink_seq) " +
		"WHERE A.product_status = '0' " +
			"AND B.view_yn = 'Y' " +
			"AND B.golflink_seq = ? " +
			"AND B.product_date = ? ORDER BY time_start ";
	
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
			",A.coupon_use_yn " +
		"FROM tb_product_sub A " +
			"INNER JOIN tb_product B on(A.product_seq = B.product_seq) " +
			"LEFT OUTER JOIN tb_golflink_course C on(C.golflink_course_seq = A.golflink_course_seq) " +
			"INNER JOIN tb_golflink D on(B.golflink_seq = D.golflink_seq) " +
		"WHERE A.product_status = '0' " +
			"AND B.view_yn = 'Y' " +
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
			",booking_time_s" +
			",booking_time_e" +
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
			",NOW(),?,?" +
			",A.golflink_name" +
			",B.product_date" +
			",C.time_start" +
			",C.time_end" +
			",IFNULL(D.course_name, '')" +
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
	
	/**
	 * 추가 수정 view_yn 추가 
	 */
	public static final String getPackage_select
	=	"SELECT " +
			" a.package_seq " +
			",a.menu_seq " +
			",a.package_name1 " +
			",a.package_name2 " +
			",a.region_seq " +
			",a.saledate_start " +
			",a.saledate_end " +
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
			",a.use_rule " +
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
		"WHERE view_yn = 'Y' %s";
	
	//--------------------------------------------- condo
	public static final String condo_select_list = " select a.condo_seq, " +
				"a.condo_name, " +
				"a.region_seq, " +
				"a.img_main , " +
				"min(b.price_n1) price_n1 , " +
				"min(b.price_n2) price_n2 ,  " +
				"min(b.price_n3) price_n3 ,   " +
				"min(b.price_s1) price_s1 , " +
				"min(b.price_s2) price_s2 ,  " +
				"min(b.price_s3) price_s3  " +
				"from tb_condo a left outer join tb_condo_room b on(a.condo_seq=b.condo_seq) " +
				" where view_yn=''Y'' {0} " +
				"group by a.condo_seq order by condo_seq desc ";
	
	public static final String condo_select = " select a.condo_seq, " +
	" a.condo_name, " +
	" a.region_seq, " +
	" a.saledate_start, " +
	" a.saledate_end, " +
	" a.img_main, " +
	" a.address1, " +
	" a.address2, " +
	" a.point_x, " +
	" a.point_y, " +
	" a.view_yn, " +
	" a.reserve_start, " +
	" a.reserve_end, " +
	" a.condo_info, " +
	" a.detail_info, " +
	" a.way_map, " +
	" a.use_rule, " +
	" min(b.price_n1) price_n1 , " +
	" min(b.price_n2) price_n2 ,  " +
	" min(b.price_n3) price_n3 ,   " +
	" min(b.price_s1) price_s1 , " +
	" min(b.price_s2) price_s2 ,  " +
	" min(b.price_s3) price_s3  " +
	" from tb_condo a left outer join tb_condo_room b on(a.condo_seq=b.condo_seq)  " +
	" where a.condo_seq = ? group by b.condo_seq ";
	
	public static final String condo_gallery_select
	=	"SELECT " +
			" condoimg_seq " +
			",condo_seq " +
			",condo_img " +
		"FROM tb_condo_gallery " +
		"WHERE condo_seq = ? " +
		"ORDER BY condoimg_seq";
	
	public static final String condo_room_select = " SELECT  " +
	"  a.condoroom_seq  " +
	" ,a.condo_seq  " +
	" ,a.roomtype  " +
	" ,a.price_n1  " +
	" ,a.price_n2  " +
	" ,a.price_n3  " +
	" ,a.price_s1  " +
	" ,a.price_s2  " +
	" ,a.price_s3  " +
	" FROM tb_condo_room a " +
	" WHERE a.condo_seq = ?  ORDER BY a.condoroom_seq ";
	
	public static final String condo_promise = "SELECT " +
			" A.promise1_type,A.promise1" +
			",A.promise2_type,A.promise2" +
			",A.promise3_type,A.promise3" + 
			",A.promise4_type,A.promise4" +
			",A.promise5_type,A.promise5" +
			",IFNULL(A.cancelrule,'') 'cancelrule'" +
			",B.use_rule "+
		"FROM tb_condo_promise A INNER JOIN tb_condo B on(A.condo_seq= B.condo_seq) " +
		"WHERE A.condo_seq = ?";
	
	public static final String condo_reserve_insert = 
	"insert into tb_condo_reserve(menu_seq,condo_seq,reserve_day,reserve_name, "+
	"reserve_uid,condo_name,roomtype,condoroom_seq,in_date, "+
	"out_date,room_num,per_num,reserve_phone,condo_price,reserve_memo ) "+
	"values(?, ?, now(), ?, "+
	" ?, ?, ?, ?, ?,  "+
	" ?, ?, ?, ?, ?, ?) ";
	
	
	public static final String getPackagePromise
	=	"SELECT " +
			" A.promise1_type,A.promise1" +
			",A.promise2_type,A.promise2" +
			",A.promise3_type,A.promise3" + 
			",A.promise4_type,A.promise4" +
			",A.promise5_type,A.promise5" +
			",IFNULL(A.cancelrule,'') 'cancelrule'" +
			",B.use_rule "+
			",B.userinfo_terms " +
		"FROM tb_package_promise A " +
			"INNER JOIN tb_package B on(A.package_seq = B.package_seq) " +
		"WHERE A.package_seq = ?";
	
	public static final String setPackageReserve_insert
	=	"INSERT INTO tb_package_reserve(" +
			" menu_seq" +
			",package_seq" +
			",reserve_day" +
			",reserve_name" +
			",reserve_uid" +
			",package_name1" +
			",package_name2" +
			",tour_date" +
			",per_num" +
			",reserve_phone" +
			",package_price" +
			",request_content" +
			",process_status) " +
		"SELECT " +
			" ? " +
			",a.package_seq " +
			",NOW() " +
			",? " +
			",? " +
			",a.package_name1 " +
			",a.package_name2 " +
			",? " +
			",? " +
			",? " +
			",? " +
			",? " +
			",? " +
		"FROM tb_package a " +
			"INNER JOIN tb_package_price b on(a.package_seq = b.package_seq) " +
		"WHERE a.package_seq = ?";
	
	
	
	public static final String getSearch
	=	"SELECT " +
			" b.product_date " +
			",a.golflink_seq " +
			",a.golflink_name " +
			",c.time_start " +
			",c.time_end " +
			",d.course_name " +
		"FROM tb_golflink a " +
			"INNER JOIN tb_product b ON(a.golflink_seq = b.golflink_seq) " +
		    "INNER JOIN tb_product_sub c ON(b.product_seq = c.product_seq) " +
			"LEFT OUTER JOIN tb_golflink_course d ON(c.golflink_course_seq = d.golflink_course_seq) " +
		"WHERE c.product_status = '0' " +
			"AND b.view_yn = 'Y' " +
			"AND b.product_date >= ? %s " +
		"ORDER BY a.menu_seq, a.golflink_seq, b.product_date, c.time_start";
}
