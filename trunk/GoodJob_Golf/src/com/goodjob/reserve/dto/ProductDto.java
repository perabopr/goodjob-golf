package com.goodjob.reserve.dto;

public class ProductDto {
	private int product_seq;  
	private int menu_seq;     
	private int golflink_seq; 
	private String product_year; 
	private String product_month;
	private String product_day;  
	private String view_yn;
	
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public int getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}
	public int getGolflink_seq() {
		return golflink_seq;
	}
	public void setGolflink_seq(int golflink_seq) {
		this.golflink_seq = golflink_seq;
	}
	public String getProduct_year() {
		return product_year;
	}
	public void setProduct_year(String product_year) {
		this.product_year = product_year;
	}
	public String getProduct_month() {
		return product_month;
	}
	public void setProduct_month(String product_month) {
		this.product_month = product_month;
	}
	public String getProduct_day() {
		return product_day;
	}
	public void setProduct_day(String product_day) {
		this.product_day = product_day;
	}
	public String getView_yn() {
		return view_yn;
	}
	public void setView_yn(String view_yn) {
		this.view_yn = view_yn;
	} 
}
