package com.goodjob.coupon.dto;

public class CouponDto {
	private int coupon_seq = 0;
	private String coupon_name = "";
	private String coupon_type = "";
	private int coupon_code = 0;
	private int sale_code = 0;
	private String expiredate_start = "";
	private String expiredate_end = "";
	private String reg_user = "";
	private String reg_date = "";
	private String use_date = "";
	
	public int getCoupon_seq() {
		return coupon_seq;
	}
	public void setCoupon_seq(int coupon_seq) {
		this.coupon_seq = coupon_seq;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getCoupon_type() {
		return coupon_type;
	}
	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}
	public int getCoupon_code() {
		return coupon_code;
	}
	public void setCoupon_code(int coupon_code) {
		this.coupon_code = coupon_code;
	}
	public int getSale_code() {
		return sale_code;
	}
	public void setSale_code(int sale_code) {
		this.sale_code = sale_code;
	}
	public String getExpiredate_start() {
		return expiredate_start;
	}
	public void setExpiredate_start(String expiredate_start) {
		this.expiredate_start = expiredate_start;
	}
	public String getExpiredate_end() {
		return expiredate_end;
	}
	public void setExpiredate_end(String expiredate_end) {
		this.expiredate_end = expiredate_end;
	}
	public String getReg_user() {
		return reg_user;
	}
	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getUse_date() {
		return use_date;
	}
	public void setUse_date(String use_date) {
		this.use_date = use_date;
	}
}
