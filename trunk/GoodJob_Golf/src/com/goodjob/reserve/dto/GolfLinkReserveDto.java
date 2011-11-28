package com.goodjob.reserve.dto;

public class GolfLinkReserveDto {
	private int menu_seq;       
	private int productsub_seq; 
	private String golflink_name;  
	private String reserve_name;   
	private String reserve_day;    
	private String booking_day;    
	private String booking_time;   
	private String golflink_course;
	private String per_num;        
	private String reserve_phone;  
	private int product_price;  
	private String process_status;
	
	public int getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}
	public int getProductsub_seq() {
		return productsub_seq;
	}
	public void setProductsub_seq(int productsub_seq) {
		this.productsub_seq = productsub_seq;
	}
	public String getGolflink_name() {
		return golflink_name;
	}
	public void setGolflink_name(String golflink_name) {
		this.golflink_name = golflink_name;
	}
	public String getReserve_name() {
		return reserve_name;
	}
	public void setReserve_name(String reserve_name) {
		this.reserve_name = reserve_name;
	}
	public String getReserve_day() {
		return reserve_day;
	}
	public void setReserve_day(String reserve_day) {
		this.reserve_day = reserve_day;
	}
	public String getBooking_day() {
		return booking_day;
	}
	public void setBooking_day(String booking_day) {
		this.booking_day = booking_day;
	}
	public String getBooking_time() {
		return booking_time;
	}
	public void setBooking_time(String booking_time) {
		this.booking_time = booking_time;
	}
	public String getGolflink_course() {
		return golflink_course;
	}
	public void setGolflink_course(String golflink_course) {
		this.golflink_course = golflink_course;
	}
	public String getPer_num() {
		return per_num;
	}
	public void setPer_num(String per_num) {
		this.per_num = per_num;
	}
	public String getReserve_phone() {
		return reserve_phone;
	}
	public void setReserve_phone(String reserve_phone) {
		this.reserve_phone = reserve_phone;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProcess_status() {
		return process_status;
	}
	public void setProcess_status(String process_status) {
		this.process_status = process_status;
	} 
}
