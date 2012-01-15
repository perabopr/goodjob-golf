package com.goodjob.sql;

public class COUPON {
	public static final String chkCouponReg
	=	"SELECT " +
			" coupon_seq " +
			",coupon_name " +
			",coupon_type " +
			",coupon_code " +
			",sale_price " +
			",expiredate_start " +
			",expiredate_end " +
			",reg_user " +
			",reg_date " +
			",use_date " +
		"FROM tb_coupon " +
		"WHERE coupon_code = ?";
	
	public static final String listUserCoupon
	=	"SELECT " +
			" coupon_seq " +
			",coupon_name " +
			",coupon_type " +
			",coupon_code " +
			",sale_price " +
			",expiredate_start " +
			",expiredate_end " +
			",reg_user " +
			",reg_date " +
			",use_date " +
		"FROM tb_coupon " +
		"WHERE reg_user = ? {0}";
	
	public static final String coupon_insert = "insert into tb_coupon_main(coupon_name,coupon_type,coupon_code,sale_price,expiredate_start,expiredate_end,reg_date) "+
	"values( ?, ?, ?, ?, ?, ?,now())";
	
	public static final String coupon_list = "";
}
