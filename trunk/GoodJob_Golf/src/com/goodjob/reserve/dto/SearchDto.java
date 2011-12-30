package com.goodjob.reserve.dto;

public class SearchDto {
	private String product_date = "";
	private int golflink_seq = 0; 
	private String golflink_name = "";
	private String time_start = "";
	private String course_name = "";
	private String product_status = "";
	
	public String getProduct_date() {
		return product_date;
	}
	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}
	public int getGolflink_seq() {
		return golflink_seq;
	}
	public void setGolflink_seq(int golflink_seq) {
		this.golflink_seq = golflink_seq;
	}
	public String getGolflink_name() {
		return golflink_name;
	}
	public void setGolflink_name(String golflink_name) {
		this.golflink_name = golflink_name;
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
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}	
}
