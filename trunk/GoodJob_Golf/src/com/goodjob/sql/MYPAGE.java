package com.goodjob.sql;

public class MYPAGE {

	//1 : 실시간 , 2 : 사전
	public static final String my_golf_reserve = "select a.reserve_seq," +
								"a.menu_seq," +
								"a.golflink_seq," +
								"a.product_seq," +
								"a.productsub_seq," +
								"date_format(a.reserve_day,''%Y.%m.%d'') reserve_day," +
								"a.reserve_name," +
								"a.reserve_uid," +
								"a.golflink_name," +
								"a.booking_day," +
								"a.booking_time_s," +
								"a.golflink_course,a.product_price,a.coupon_price," +
								"a.per_num , " +
								"a.golflink_course " +
							"from tb_golflink_reserve a " +
							"where reserve_uid = ? {0} order by menu_seq , a.reserve_seq desc ";
	
	public static final String my_package_reserve = "select a.reserve_seq, " +
							"       a.menu_seq, " +
							"       a.package_seq, " +
							"       date_format(a.reserve_day,''%Y.%m.%d %H:%i'') reserve_day, " +
							"       a.reserve_name, " +
							"       a.package_name1, " +
							"       a.package_name2,"+
							"       a.tour_date, " +
							"       a.per_num, " +
							"       a.reserve_phone, " +
							"       a.package_price, " +
							"       a.process_status, " +
							"       a.reserve_uid " +
							"  from tb_package_reserve a " +
							"  where menu_seq = ? and reserve_uid = ? {0} order by menu_seq , a.reserve_seq desc ";
	
	
	
	public static final String my_condo_reserve = "select a.reserve_seq, " +
							"       a.menu_seq, " +
							"       a.condo_seq, " +
							"       date_format(a.reserve_day,''%Y.%m.%d'') reserve_day, " +
							"       a.reserve_name, " +
							"       a.condo_name, " +
							"       a.roomtype,a.room_num, " +
							"       a.in_date, " +
							"       a.out_date, " +
							"       a.reserve_phone, " +
							"       a.condo_price, " +
							"       a.process_status, " +
							"       a.reserve_uid  " +
							"  from tb_condo_reserve a " +
							"where menu_seq = ? and reserve_uid = ? {0} order by menu_seq , a.reserve_seq desc ";
	
}
