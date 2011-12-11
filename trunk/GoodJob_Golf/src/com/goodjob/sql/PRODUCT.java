package com.goodjob.sql;

public class PRODUCT {
	public static final String getSequenceId = "select last_insert_id()";
	
	public static final String region_select = "select * from tb_region where region_type= ?";
	public static final String region_insert = "insert into tb_region(region_type, region_name, etc)values(?,?,?)";
	public static final String region_delete = "delete from tb_region where region_seq = ?";
	
	public static final String menu_select = "select * from tb_menu";
	public static final String menu_insert = "insert into tb_menu(menu_name)values(?)";
	public static final String menu_delete = "delete from tb_menu where menu_seq = ?";
	
	/*----------------------------------------------------------------- tb_golflink*/
	public static final String golflink_insert 
		= 	"INSERT INTO tb_golflink( " +
				" menu_seq " +
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
				",golflink_guide) " +
			"VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	
	public static final String golflink_select_full
	=	"SELECT " +
			" a.golflink_seq " +
			",a.menu_seq " +
			",a.golflink_name " +
			",a.region_seq " +
			",b.region_name " +
			",a.holl_type " +
			",a.course_guide " +
			",a.golflink_address1 " +
			",a.golflink_address2 " +
			",a.point_x " +
			",a.point_y " +
			",a.img_main " +
			",a.img_sub1 " +
			",a.img_sub2 " +
			",a.img_sub3 " +
			",a.img_sub4 " +
			",a.cancel_term " +
			",a.view_yn" +
			",a.cancel_rule" +
			",a.promise_rule" +
			",a.use_guide" +
			",a.golflink_guide " +	
		"FROM tb_golflink a " +
		"INNER JOIN tb_region b on(a.region_seq = b.region_seq)" +
		"WHERE a.menu_seq = ?";	
	public static final String golflink_select
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
			"WHERE golflink_seq = ?";
	public static final String golflink_update
		=	"UPDATE tb_golflink " +
				" SET golflink_name = ? " +
				",region_seq = ? " +
				",holl_type = ?" +
				",course_guide = ? " +
				",golflink_address1 = ? " +
				",golflink_address2 = ? " +
				",point_x = ?" +
				",point_y = ?" +
				",img_main = ? " +
				",img_sub1 = ? " +
				",img_sub2 = ? " +
				",img_sub3 = ? " +
				",img_sub4 = ? " +
				",cancel_term = ? " +
				",view_yn = ? " +
				",cancel_rule = ?" +
				",promise_rule = ?" +
				",use_guide = ?" +
				",golflink_guide = ? " +
			"WHERE golflink_seq = ?";	
	public static final String golflink_delete 
		=	"DELETE FROM tb_golflink " +
			"WHERE golflink_seq = ?";
	
	/*----------------------------------------------------------------- tb_golflink_course*/
	public static final String golflink_course_insert
		= "INSERT INTO tb_golflink_course(golflink_seq, course_name)"
		+ "VALUES(?,?)";
	
	public static final String golflink_course_select
		=	"SELECT golflink_course_seq, golflink_seq, course_name " +
			"FROM tb_golflink_course " +
			"WHERE golflink_seq = ?";
	
	public static final String golflink_course_delete
		= "DELETE FROM tb_golflink_course "
		+ "WHERE golflink_course_seq = ?";
	
	/*----------------------------------------------------------------- tb_golflink_price*/
	public static final String golflink_price_insert
		=	"INSERT INTO tb_golflink_price(" +
				" golflink_seq" +
				",price_type" +
				",golflink_price)" +
			"VALUES(?,?,?)";
	public static final String golflink_price_select
		= 	"SELECT" +
				" golflink_seq" +
				",price_type" +
				",golflink_price " +
			"FROM tb_golflink_price "	+ 
			"WHERE golflink_seq = ?";
	
	public static final String golflink_price_update
		= 	"UPDATE tb_golflink_price " +
			"SET price_type = ?" +
			    ",golflink_price = ? " +
			"WHERE golflink_seq = ?";
	
	public static final String golflink_price_delete
		=	"DELETE FROM tb_golflink_price " +
			"WHERE golflink_seq = ?";
	
	/*----------------------------------------------------------------- tb_golflink_reserve*/
	public static final String golflink_reserve_insert
		=	"INSERT INTO tb_golflink_reserve(" +
				"menu_seq" +
				",productsub_seq" +
				",golflink_name" +
				",reserve_name" +
				",reserve_day" +
				",booking_day" +
				",booking_time" +
				",golflink_course" +
				",per_num" +
				",reserve_phone" +
				",product_price" +
				",process_status)"+
			"VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	
	public static final String golflink_reserve_select
		=	"SELECT" +
				" menu_seq" +
				",productsub_seq" +
				",golflink_name" +
				",reserve_name" +
				",reserve_day" +
				",booking_day" +
				",booking_time" +
				",golflink_course" +
				",per_num" +
				",reserve_phone" +
				",product_price" +
				",process_status "+
			"FROM tb_golflink_reserve"+
			"WHERE golflink_seq = ?";
	
	public static final String golflink_reserve_update
		=	"UPDATE tb_golflink_reserve" +
				"SET golflink_name = ?" +
			    ",reserve_name = ?" +
			    ",reserve_day = ?" +
			    ",booking_day = ?" +
			    ",booking_time = ?" +
			    ",golflink_course = ?" +
			    ",per_num = ?" +
			    ",reserve_phone = ?" +
			    ",product_price = ?" +
			    ",process_status = ? " +
			"WHERE productsub_seq = ?";
	
	public static final String golflink_reserve_delete
		=	"DELETE FROM tb_golflink_reserve " +
			"WHERE productsub_seq = ?";
	
	/*----------------------------------------------------------------- tb_golflink_promise*/
	public static final String golflink_promise_select
		=	"SELECT " +
				" golflink_seq" +
				",promise1_type" + 
				",promise1" +
				",promise2_type" +
				",promise2" +
				",promise3_type" +
				",promise3" + 
				",promise4_type" +
				",promise4" + 
				",promise5_type" +
				",promise5" +
				",cancelrule " +
			"FROM tb_golflink_promise " +
			"WHERE golflink_seq = ?";
	public static final String golflink_promise_insert
		=	"INSERT INTO tb_golflink_promise(" +
			" golflink_seq" +
			",promise1_type" +
			",promise1" +
			",promise2_type" +
			",promise2" +
			",promise3_type" +
			",promise3" +
			",promise4_type" +
			",promise4" +
			",promise5_type" +
			",promise5" +
			",cancelrule" +
			")VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	public static final String golflink_promise_update
		=	"UPDATE tb_golflink_promise" +
				"SET " +
				" promise1_type = ?" +
				",promise1 = ?" +
				",promise2_type = ?" +
				",promise2 = ?" +
				",promise3_type = ?" +
				",promise3 = ?" +
				",promise4_type = ?" +
				",promise4 = ?" +
				",promise5_type = ?" +
				",promise5 = ?" +
				",cancelrule = ? " +
			"WHERE golflink_seq = ?";
	public static final String golflink_promise_delete
		=	"DELETE FROM tb_golflink_promise " +	
			"WHERE golflink_seq = ?";
	
	/*----------------------------------------------------------------- tb_product*/
	public static final String product_insert
		=	"INSERT INTO tb_product(" +
				" menu_seq" +
				",golflink_seq" +
				",product_year" +
				",product_month" +
				",product_day" +
				",view_yn)" +
			"VALUES(?,?,?,?,?,?)";	
	
	public static final String product_select
		=	"SELECT" +
				" product_seq" +
				",menu_seq" +
				",golflink_seq" +
				",product_year" +
				",product_month" +
				",product_day" +
				",view_yn " +
			"FROM tb_product " +
			"WHERE product_seq = ?";
	
	public static final String product_select_where
		=	"SELECT" +
				" product_seq" +
				",menu_seq" +
				",golflink_seq" +
				",product_year" +
				",product_month" +
				",product_day" +
				",view_yn " +
			"FROM tb_product " +
			"WHERE menu_seq = ? " +
			"AND golflink_seq = ? " +
			"AND product_year = ? " +
			"AND product_month = ? " +
			"ORDER BY product_year, product_month, product_day";
	
	public static final String product_update
		=	"UPDATE tb_product" +
				"SET view_yn = ? " +
		    "WHERE product_seq = ?";
	
	public static final String product_delete
		=	"DELETE FROM tb_product " +
			"WHERE product_seq = ?";
	
	/*----------------------------------------------------------------- tb_product_sub*/
	public static final String product_sub_insert
		=	"INSERT INTO tb_product_sub(" +
				" product_seq" +
				",golflink_course_seq" +
				",time_start" +
				",time_end" +
				",goodjob_price" +
				",NH_price" +
				",product_status)" +
			"VALUES(?,?,?,?,?,?,?)";
	
	public static final String product_sub_select
		=	"SELECT" +
				" productsub_seq" +
				",product_seq" +
				",golflink_course_seq" +
				",time_start" +
				",time_end" +
				",goodjob_price" +
				",NH_price" +
				",product_status " +
			"FROM tb_product_sub " +
			"WHERE productsub_seq = ?";
	
	public static final String product_sub_select_date
		=	"SELECT "+
				" a.productsub_seq" +
				",a.product_seq" +
				",a.golflink_course_seq" +
				",a.time_start" +
				",a.time_end" + 
				",a.goodjob_price" + 
				",a.NH_price" +
				",a.product_status " + 
				"FROM tb_product_sub a " +
				"INNER JOIN tb_product b ON(a.product_seq = b.product_seq) " +
				"WHERE b.menu_seq = ? " +
				"AND b.golflink_seq = ? " +
				"AND b.product_year = ? " +
				"AND b.product_month = ? " +
				"AND b.product_day = ? " +
				"ORDER BY a.productsub_seq";
				

	public static final String product_sub_update
		=	"UPDATE tb_product_sub " +
			"SET golflink_course_seq = ?" +
			",time_start = ?" +
			",time_end = ?" +
			",goodjob_price = ?" +
			",NH_price = ?" +
			",product_status = ? " +
			"WHERE productsub_seq = ?";

	public static final String product_sub_delete
		=	"DELETE FROM tb_product_sub " +
			"WHERE product_seq = ? " +
			"AND productsub_seq NOT IN (%s)";

	/*----------------------------------------------------------------- tb_package*/
	public static final String package_select
		=	"SELECT " +
				" a.package_seq" +
				",a.package_name1" +
				",a.package_name2" +
				",a.region_seq" +
				",b.region_name" +
				",a.package_type" +
				",a.img_main" +
				",a.img_sub" +
				",a.img_sub1" +
				",a.img_sub2" +
				",a.img_sub3" +
				",a.img_sub4" +
				",a.address1" +
				",a.address2" +
				",a.point_x" +
				",a.point_y" +
				",a.view_yn" +
				",a.package_guide" +
				",a.use_guide" +
				",a.golflink_guide" +
				",a.way_map " +
			"FROM tb_package a " +
			"	INNER JOIN tb_region b on(a.region_seq = b.region_seq) " +
			"WHERE 1=1 " + "%s";
	public static final String package_insert
		=	"INSERT INTO tb_package(" +
				" package_name1" +
				",package_name2" +
				",region_seq" +
				",package_type" +
				",img_main" +
				",img_sub" +
				",img_sub1" +
				",img_sub2" +
				",img_sub3" +
				",img_sub4" +
				",address1" +
				",address2" +
				",point_x" +
				",point_y" +
				",view_yn" +
				",package_guide" +
				",use_guide" +
				",golflink_guide" +
				",way_map" +
			")VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	public static final String package_update
		=	"UPDATE tb_package " +
			"SET " +
				" package_name1 = ?" +
				",package_name2 = ?" +
				",region_seq = ?" +
				",package_type = ?" +
				",img_main = ?" +
				",img_sub = ?" +
				",img_sub1 = ?" +
				",img_sub2 = ?" +
				",img_sub3 = ?" +
				",img_sub4 = ?" +
				",address1 = ?" +
				",address2 = ?" +
				",point_x = ?" +
				",point_y = ?" +
				",view_yn = ?" +
				",package_guide = ?" +
				",use_guide = ?" +
				",golflink_guide = ?" +
				",way_map = ? " +
			"WHERE package_seq = ?";
	public static final String package_delete
		=	"DELETE FROM tb_package " +
			"WHERE package_seq = ?";
	/*----------------------------------------------------------------- tb_package_price*/
	public static final String package_price_select
		=	"SELECT "+
				" package_seq" +
				",peak_n_mon" +
				",peak_n_tue" +
				",peak_n_wed" +
				",peak_n_thu" +
				",peak_n_fri" +
				",peak_n_sat" +
				",peak_n_sun" +
				",peak_s_mon" +
				",peak_s_tue" +
				",peak_s_wed" +
				",peak_s_thu" +
				",peak_s_fri" +
				",peak_s_sat" +
				",peak_s_sun" +
				",off_n_mon" +
				",off_n_tue" +
				",off_n_wed" +
				",off_n_thu" +
				",off_n_fri" +
				",off_n_sat" +
				",off_n_sun" +
				",off_s_mon" +
				",off_s_tue" +
				",off_s_wed" +
				",off_s_thu" +
				",off_s_fri" +
				",off_s_sat" +
				",off_s_sun " +
			"FROM tb_package_price " +
			"WHERE package_seq = ?";
	public static final String package_price_insert
		=	"INSERT INTO tb_package_price(" +
				" package_seq" +
				",peak_n_mon" +
				",peak_n_tue" +
				",peak_n_wed" +
				",peak_n_thu" +
				",peak_n_fri" +
				",peak_n_sat" +
				",peak_n_sun" +
				",peak_s_mon" +
				",peak_s_tue" +
				",peak_s_wed" +
				",peak_s_thu" +
				",peak_s_fri" +
				",peak_s_sat" +
				",peak_s_sun" +
				",off_n_mon" +
				",off_n_tue" +
				",off_n_wed" +
				",off_n_thu" +
				",off_n_fri" +
				",off_n_sat" +
				",off_n_sun" +
				",off_s_mon" +
				",off_s_tue" +
				",off_s_wed" +
				",off_s_thu" +
				",off_s_fri" +
				",off_s_sat" +
				",off_s_sun " +
			")VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	public static String package_price_update
		=	"UPDATE tb_package_price " +
				"SET " +
				" peak_n_mon = ?" +
				",peak_n_tue = ?" +
				",peak_n_wed = ?" +
				",peak_n_thu = ?" +
				",peak_n_fri = ?" +
				",peak_n_sat = ?" +
				",peak_n_sun = ?" +
				",peak_s_mon = ?" +
				",peak_s_tue = ?" +
				",peak_s_wed = ?" +
				",peak_s_thu = ?" +
				",peak_s_fri = ?" +
				",peak_s_sat = ?" +
				",peak_s_sun = ?" +
				",off_n_mon = ?" +
				",off_n_tue = ?" +
				",off_n_wed = ?" +
				",off_n_thu = ?" +
				",off_n_fri = ?" +
				",off_n_sat = ?" +
				",off_n_sun = ?" +
				",off_s_mon = ?" +
				",off_s_tue = ?" +
				",off_s_wed = ?" +
				",off_s_thu = ?" +
				",off_s_fri = ?" +
				",off_s_sat = ?" +
				",off_s_sun = ?" +
			"WHERE package_seq = ?";
	public static String package_price_delete
		=	"DELETE FROM tb_package_price " +
			"WHERE package_seq = ?";
	/*----------------------------------------------------------------- tb_package_promise*/
	public static final String package_promise_select
		=	"SELECT " +
				" package_seq" +
				",promise1_type" + 
				",promise1" +
				",promise2_type" +
				",promise2" +
				",promise3_type" +
				",promise3" + 
				",promise4_type" +
				",promise4" + 
				",promise5_type" +
				",promise5" +
				",cancelrule " +
			"FROM tb_package_promise " +
			"WHERE package_seq = ?";
	public static final String package_promise_insert
		=	"INSERT INTO tb_package_promise(" +
			" package_seq" +
			",promise1_type" +
			",promise1" +
			",promise2_type" +
			",promise2" +
			",promise3_type" +
			",promise3" +
			",promise4_type" +
			",promise4" +
			",promise5_type" +
			",promise5" +
			",cancelrule" +
			")VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	public static final String package_promise_update
		=	"UPDATE tb_package_promise" +
				"SET " +
				" promise1_type = ?" +
				",promise1 = ?" +
				",promise2_type = ?" +
				",promise2 = ?" +
				",promise3_type = ?" +
				",promise3 = ?" +
				",promise4_type = ?" +
				",promise4 = ?" +
				",promise5_type = ?" +
				",promise5 = ?" +
				",cancelrule = ? " +
			"WHERE package_seq = ?";
	public static final String package_promise_delete
		=	"DELETE FROM tb_package_promise " +	
			"WHERE package_seq = ?";
	/*----------------------------------------------------------------- tb_condo*/
	public static final String condo_select
		=	"SELECT " +
				" condo_seq" +
				",condo_name" +
				",region_seq" +
				",saledate_start" +
				",saledate_end" +
				",img_main" +
				",address1" +
				",address2" +
				",point_x" +
				",point_y" +
				",view_yn" +
				",condo_info" +
				",detail_info" +
				",way_map" +
				",edit_rule " +
			"FROM tb_condo " + 
			"WHERE 1=1 %s";
	public static final String condo_insert
		=	"INSERT INTO tb_condo(" +
				"condo_name" +
				",region_seq" +
				",saledate_start" +
				",saledate_end" +
				",img_main" +
				",address1" +
				",address2" +
				",point_x" +
				",point_y" +
				",view_yn" +
				",condo_info" +
				",detail_info" +
				",way_map" +
				",edit_rule) " +
			"VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	public static final String condo_update
		=	"UPDATE tb_condo " +
				"SET " +
				" condo_name = ?" +
				",region_seq = ?" +
				",saledate_start = ?" +
				",saledate_end = ?" +
				",img_main = ?" +
				",address1 = ?" +
				",address2 = ?" +
				",point_x = ?" +
				",point_y = ?" +
				",view_yn = ?" +
				",condo_info = ?" +
				",detail_info = ?" +
				",way_map = ?" +
				",edit_rule = ? " +
			"WHERE condo_seq = ?";
	public static final String condo_delete
		=	"DELETE FROM tb_condo " +
			"WHERE condo_seq = ?";
	/*----------------------------------------------------------------- tb_condo_gallery*/
	public static final String condo_gallery_select
		=	"SELECT " +
				" condoimg_seq" +
				",condo_seq" +
				",condo_img " +
			"FROM tb_condo_gallery" +
			"WHERE condo_seq = ?";
	public static final String condo_gallery_insert
		=	"INSERT INTO tb_condo_gallery(" +
				" condo_seq" +
				",condo_img) "+
			"VALUES(?,?)";
	public static final String condo_gallery_update
		=	"UPDATE tb_condo_gallery " +
				"SET " +
				" condo_seq = ?" +
				",condo_img = ? "+
			"WHERE condoimg_seq = ?";
	
	public static final String condo_gallery_delete
		=	"DELETE FROM tb_condo_gallery" +
			"WHERE condo_seq = ? " +
			"AND condoimg_seq NOT IN (%s)";			
	/*----------------------------------------------------------------- tb_condo_term*/
	public static final String condo_term_select
		=	"SELECT " +
				" condoterm_seq" +
				",condo_seq" +
				",reserve_start" +
				",reserve_end" +
				",price_n1" +
				",price_n2" +
				",price_n3" +
				",price_s1" +
				",price_s2" +
				",price_s3 " +
			"FROM tb_condo_reserve_term " +
			"WHERE condo_seq = ? " +
			"ORDER BY condoterm_seq";
	public static final String condo_term_insert
		=	"INSERT INTO tb_condo_reserve_term(" +
				"condo_seq" +
				",reserve_start" +
				",reserve_end" +
				",price_n1" +
				",price_n2" +
				",price_n3" +
				",price_s1" +
				",price_s2" +
				",price_s3) " +
			"VALUES(?,?,?,?,?,?,?,?,?)";
	public static final String condo_term_update
		=	"UPDATE tb_condo_reserve_term " +
				"SET " +
				" reserve_start = ?" +
				",reserve_end = ?" +
				",price_n1 = ?" +
				",price_n2 = ?" +
				",price_n3 = ?" +
				",price_s1 = ?" +
				",price_s2 = ?" +
				",price_s3 = ? "+
			"WHERE condoterm_seq = ?";
	public static final String condo_term_delete
		=	"DELETE FROM tb_condo_reserve_term " +
			"WHERE condo_seq = ? " +
			"AND condoterm_seq NOT IN (%s)";
}
