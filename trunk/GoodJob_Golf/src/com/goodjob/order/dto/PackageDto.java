package com.goodjob.order.dto;

public class PackageDto {
	private int reserve_seq;
	private int menu_seq;
	private int package_seq;
	private String reserve_day;
	private String reserve_name;
	private String reserve_uid;
	private String package_name1;
	private String package_name2;
	private String tour_date;
	private String per_num;
	private String reserve_phone;
	private int package_price;
	private int balance_price;
	private String request_content;
	private String process_status;
	private int site_seq = 0;
	
	public int getReserve_seq() {
		return reserve_seq;
	}
	public void setReserve_seq(int reserve_seq) {
		this.reserve_seq = reserve_seq;
	}
	public int getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}
	public int getPackage_seq() {
		return package_seq;
	}
	public void setPackage_seq(int package_seq) {
		this.package_seq = package_seq;
	}
	public String getReserve_day() {
		return reserve_day;
	}
	public void setReserve_day(String reserve_day) {
		this.reserve_day = reserve_day;
	}
	public String getReserve_name() {
		return reserve_name;
	}
	public void setReserve_name(String reserve_name) {
		this.reserve_name = reserve_name;
	}
	public String getReserve_uid() {
		return reserve_uid;
	}
	public void setReserve_uid(String reserve_uid) {
		this.reserve_uid = reserve_uid;
	}
	public String getPackage_name1() {
		return package_name1;
	}
	public void setPackage_name1(String package_name1) {
		this.package_name1 = package_name1;
	}
	public String getPackage_name2() {
		return package_name2;
	}
	public void setPackage_name2(String package_name2) {
		this.package_name2 = package_name2;
	}
	public String getTour_date() {
		return tour_date;
	}
	public void setTour_date(String tour_date) {
		this.tour_date = tour_date;
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
	public int getPackage_price() {
		return package_price;
	}
	public void setPackage_price(int package_price) {
		this.package_price = package_price;
	}
	public int getBalance_price() {
		return balance_price;
	}
	public void setBalance_price(int balance_price) {
		this.balance_price = balance_price;
	}
	public String getRequest_content() {
		return request_content;
	}
	public void setRequest_content(String request_content) {
		this.request_content = request_content;
	}
	public String getProcess_status() {
		return process_status;
	}
	public void setProcess_status(String process_status) {
		this.process_status = process_status;
	}
	public int getSite_seq() {
		return site_seq;
	}
	public void setSite_seq(int siteSeq) {
		site_seq = siteSeq;
	}
}
