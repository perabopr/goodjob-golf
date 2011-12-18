package com.goodjob.reserve.dto;

public class ProductReserveDto {
	int golflink_seq;
	String product_date = "";
	int productsub_seq;
	String time_start = "";
	String course_name = "";
	String holl_type = "";
	String product_status = "";
	
	public int getGolflink_seq() {
		return golflink_seq;
	}
	public void setGolflink_seq(int golflink_seq) {
		this.golflink_seq = golflink_seq;
	}
	public String getProduct_date() {
		return product_date;
	}
	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}
	public int getProductsub_seq() {
		return productsub_seq;
	}
	public void setProductsub_seq(int productsub_seq) {
		this.productsub_seq = productsub_seq;
	}
	public String getTime_start() {
		return time_start;
	}
	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getHoll_type() {
		return holl_type;
	}
	public void setHoll_type(String holl_type) {
		this.holl_type = holl_type;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
}
