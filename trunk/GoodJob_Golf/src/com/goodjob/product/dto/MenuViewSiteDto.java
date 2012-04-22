package com.goodjob.product.dto;

public class MenuViewSiteDto {
	private int menu_seq;
	private String menu_name = "";
	private int service_seq;
	private int site_seq;
	private String site_name = "";
	
	public int getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getService_seq() {
		return service_seq;
	}
	public void setService_seq(int service_seq) {
		this.service_seq = service_seq;
	}
	public int getSite_seq() {
		return site_seq;
	}
	public void setSite_seq(int site_seq) {
		this.site_seq = site_seq;
	}
	public String getSite_name() {
		return site_name;
	}
	public void setSite_name(String site_name) {
		this.site_name = site_name;
	}
}
