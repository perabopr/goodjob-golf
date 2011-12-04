package com.goodjob.sql;

public class RESERVE {
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
			"VALUES(last_insert_id(),?,?)";
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
	
	public static final String product_update
		=	"UPDATE tb_product" +
				"SET product_year = ?" +
				",product_month = ?" +
			    ",product_day = ?" +
			    ",view_yn = ? " +
		    "WHERE product_seq = ?";
	
	public static final String product_delete
		=	"DELETE FROM tb_product " +
			"WHERE product_seq = ?";
	
	/*----------------------------------------------------------------- tb_product_sub*/
	public static final String product_sub_insert
		=	"INSERT INTO tb_product_sub(" +
				" product_seq" +
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
				",time_start" +
				",time_end" +
				",goodjob_price" +
				",NH_price" +
				",product_status " +
			"FROM tb_product_sub " +
			"WHERE productsub_seq = ?";

	public static final String product_sub_update
		=	"UPDATE tb_product_sub " +
			"SET time_start = ?" +
			",time_end = ?" +
			",goodjob_price = ?" +
			",NH_price = ?" +
			",product_status = ? " +
			"WHERE productsub_seq = ?";

	public static final String product_sub_delete
		=	"DELETE FROM tb_product_sub " +
			"WHERE productsub_seq = ?";
}
