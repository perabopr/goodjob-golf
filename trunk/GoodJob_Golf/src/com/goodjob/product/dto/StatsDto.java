package com.goodjob.product.dto;

import java.io.Serializable;

public class StatsDto implements Serializable {
	private String reserve_day = "";
	private String reserve_prdt_name = "";
	private int process_status0 = 0;
	private int process_status1 = 0;
	private int process_status3 = 0;
	private int coupon_price = 0;
	private int product_price = 0;
	private int per_num = 0;
	private String reservedate_start = "";
	private String reservedate_end = "";
	private int menu_seq = 0;
	private int region_seq = 0;
	private String reserve_name = "";
	private String priceS = "";
	private String priceE = "";
	private String golflink_name = "";
	private String package_name = "";
	private String condo_name = "";
	
	public String getReserve_day() {
		return reserve_day;
	}
	public void setReserve_day(String reserve_day) {
		this.reserve_day = reserve_day;
	}
	public String getReserve_prdt_name() {
		return reserve_prdt_name;
	}
	public void setReserve_prdt_name(String reserve_prdt_name) {
		this.reserve_prdt_name = reserve_prdt_name;
	}
	public int getProcess_status0() {
		return process_status0;
	}
	public void setProcess_status0(int process_status0) {
		this.process_status0 = process_status0;
	}
	public int getProcess_status1() {
		return process_status1;
	}
	public void setProcess_status1(int process_status1) {
		this.process_status1 = process_status1;
	}
	public int getProcess_status3() {
		return process_status3;
	}
	public void setProcess_status3(int process_status3) {
		this.process_status3 = process_status3;
	}
	public int getCoupon_price() {
		return coupon_price;
	}
	public void setCoupon_price(int coupon_price) {
		this.coupon_price = coupon_price;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getPer_num() {
		return per_num;
	}
	public void setPer_num(int per_num) {
		this.per_num = per_num;
	}
	public String getReservedate_start() {
		return reservedate_start;
	}
	public void setReservedate_start(String reservedate_start) {
		this.reservedate_start = reservedate_start;
	}
	public String getReservedate_end() {
		return reservedate_end;
	}
	public void setReservedate_end(String reservedate_end) {
		this.reservedate_end = reservedate_end;
	}
	public int getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}
	public int getRegion_seq() {
		return region_seq;
	}
	public void setRegion_seq(int region_seq) {
		this.region_seq = region_seq;
	}
	public String getReserve_name() {
		return reserve_name;
	}
	public void setReserve_name(String reserve_name) {
		this.reserve_name = reserve_name;
	}
	public String getPriceS() {
		return priceS;
	}
	public void setPriceS(String priceS) {
		this.priceS = priceS;
	}
	public String getPriceE() {
		return priceE;
	}
	public void setPriceE(String priceE) {
		this.priceE = priceE;
	}
	public String getGolflink_name() {
		return golflink_name;
	}
	public void setGolflink_name(String golflink_name) {
		this.golflink_name = golflink_name;
	}
	public String getPackage_name() {
		return package_name;
	}
	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}
	public String getCondo_name() {
		return condo_name;
	}
	public void setCondo_name(String condo_name) {
		this.condo_name = condo_name;
	}
}
