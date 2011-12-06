package com.goodjob.reserve.dto;

public class ProductSubDto {
	private int productsub_seq;
	private int product_seq;   
	private String golflink_course;
	private String time_start;    
	private String time_end;      
	private int goodjob_price; 
	private int NH_price;      
	private String product_status;
	
	public int getProductsub_seq() {
		return productsub_seq;
	}
	public void setProductsub_seq(int productsub_seq) {
		this.productsub_seq = productsub_seq;
	}
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public String getGolflink_course() {
		return golflink_course;
	}
	public void setGolflink_course(String golflink_course) {
		this.golflink_course = golflink_course;
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
}
