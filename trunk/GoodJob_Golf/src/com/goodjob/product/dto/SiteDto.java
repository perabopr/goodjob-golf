package com.goodjob.product.dto;

public class SiteDto {
	private int site_seq;
	private String site_name = "";
	private String phone_num = "";
	private String use_yn = "";
	
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
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
}
