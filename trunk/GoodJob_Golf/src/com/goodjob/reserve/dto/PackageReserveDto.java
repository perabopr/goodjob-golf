package com.goodjob.reserve.dto;

import java.io.Serializable;

public class PackageReserveDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1485774607793161782L;
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
	private int site_seq = 1;
	
	public int getReserve_seq() {
		return reserve_seq;
	}
	public void setReserve_seq(int reserveSeq) {
		reserve_seq = reserveSeq;
	}
	public int getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(int menuSeq) {
		menu_seq = menuSeq;
	}
	public int getPackage_seq() {
		return package_seq;
	}
	public void setPackage_seq(int packageSeq) {
		package_seq = packageSeq;
	}
	public String getReserve_day() {
		return reserve_day;
	}
	public void setReserve_day(String reserveDay) {
		reserve_day = reserveDay;
	}
	public String getReserve_name() {
		return reserve_name;
	}
	public void setReserve_name(String reserveName) {
		reserve_name = reserveName;
	}
	public String getReserve_uid() {
		return reserve_uid;
	}
	public void setReserve_uid(String reserveUid) {
		reserve_uid = reserveUid;
	}
	public String getPackage_name1() {
		return package_name1;
	}
	public void setPackage_name1(String packageName1) {
		package_name1 = packageName1;
	}
	public String getPackage_name2() {
		return package_name2;
	}
	public void setPackage_name2(String packageName2) {
		package_name2 = packageName2;
	}
	public String getTour_date() {
		return tour_date;
	}
	public void setTour_date(String tourDate) {
		tour_date = tourDate;
	}
	public String getPer_num() {
		return per_num;
	}
	public void setPer_num(String perNum) {
		per_num = perNum;
	}
	public String getReserve_phone() {
		return reserve_phone;
	}
	public void setReserve_phone(String reservePhone) {
		reserve_phone = reservePhone;
	}
	public int getPackage_price() {
		return package_price;
	}
	public void setPackage_price(int packagePrice) {
		package_price = packagePrice;
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
	public void setProcess_status(String processStatus) {
		process_status = processStatus;
	}
	public int getBalance_price() {
		return balance_price;
	}
	public void setBalance_price(int balance_price) {
		this.balance_price = balance_price;
	}
	public int getSite_seq() {
		return site_seq;
	}
	public void setSite_seq(int siteSeq) {
		site_seq = siteSeq;
	}
}
