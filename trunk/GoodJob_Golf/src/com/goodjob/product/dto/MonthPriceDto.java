package com.goodjob.product.dto;

public class MonthPriceDto {
	private int menu_seq;
	private int service_seq;
	private String yearmonth;
	private int site_seq;
	private int price1;
	private int price2;
	private int price3;
	
	public int getMenu_seq() {
		return menu_seq;
	}
	public int getService_seq() {
		return service_seq;
	}
	public String getYearmonth() {
		return yearmonth;
	}
	public int getSite_seq() {
		return site_seq;
	}
	public int getPrice1() {
		return price1;
	}
	public int getPrice2() {
		return price2;
	}
	public int getPrice3() {
		return price3;
	}
	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}
	public void setService_seq(int service_seq) {
		this.service_seq = service_seq;
	}
	public void setYearmonth(String yearmonth) {
		this.yearmonth = yearmonth;
	}
	public void setSite_seq(int site_seq) {
		this.site_seq = site_seq;
	}
	public void setPrice1(int price1) {
		this.price1 = price1;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public void setPrice3(int price3) {
		this.price3 = price3;
	}	
}
