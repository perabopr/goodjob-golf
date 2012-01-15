package com.goodjob.coupon.dto;

public class CouponDto {
	private int coupon_seq = 0;
	private String coupon_name = "";
	private String coupon_type = "";
	private String coupon_code = "";
	private int sale_price = 0;
	private String expiredate_start = "";
	private String expiredate_end = "";
	private String reg_user = "";
	private String reg_date = "";
	private String use_date = "";
	private String mem_name;
	
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
	
	public String getCoupon_code() {
		return coupon_code;
	}
	public void setCoupon_code(String couponCode) {
		coupon_code = couponCode;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int salePrice) {
		sale_price = salePrice;
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
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String memName) {
		mem_name = memName;
	}
	
}
