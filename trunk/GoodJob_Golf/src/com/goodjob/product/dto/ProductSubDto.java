package com.goodjob.product.dto;

public class ProductSubDto {
	private int productsub_seq;
	private String productsub_seqs;
	private int product_seq;   
	private int golflink_course_seq;
	private String time_start;    
	private String time_end;      
	private int goodjob_price; 
	private int NH_price;      
	private String product_status;
	private String coupon_use_yn;
	private int real_nh_price;
	
	public int getProductsub_seq() {
		return productsub_seq;
	}
	public void setProductsub_seq(int productsub_seq) {
		this.productsub_seq = productsub_seq;
	}
	public String getProductsub_seqs() {
		return productsub_seqs;
	}
	public void setProductsub_seqs(String productsub_seqs) {
		this.productsub_seqs = productsub_seqs;
	}
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public int getGolflink_course_seq() {
		return golflink_course_seq;
	}
	public void setGolflink_course_seq(int golflink_course_seq) {
		this.golflink_course_seq = golflink_course_seq;
	}
	public String getTime_start() {
		return time_start;
	}
	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}
	public String getTime_end() {
		return time_end;
	}
	public void setTime_end(String time_end) {
		this.time_end = time_end;
	}
	public int getGoodjob_price() {
		return goodjob_price;
	}
	public void setGoodjob_price(int goodjob_price) {
		this.goodjob_price = goodjob_price;
	}
	public int getNH_price() {
		return NH_price;
	}
	public void setNH_price(int nH_price) {
		NH_price = nH_price;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	public String getCoupon_use_yn() {
		return coupon_use_yn;
	}
	public void setCoupon_use_yn(String coupon_use_yn) {
		this.coupon_use_yn = coupon_use_yn;
	}
	public int getReal_nh_price() {
		return real_nh_price;
	}
	public void setReal_nh_price(int realNhPrice) {
		real_nh_price = realNhPrice;
	}
	
}
