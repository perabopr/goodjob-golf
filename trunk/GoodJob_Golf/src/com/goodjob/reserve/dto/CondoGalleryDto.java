package com.goodjob.reserve.dto;

public class CondoGalleryDto {
	private int condoimg_seq;
	private int condo_seq;
	private String condo_img = "";
	
	public int getCondoimg_seq() {
		return condoimg_seq;
	}
	public void setCondoimg_seq(int condoimg_seq) {
		this.condoimg_seq = condoimg_seq;
	}
	public int getCondo_seq() {
		return condo_seq;
	}
	public void setCondo_seq(int condo_seq) {
		this.condo_seq = condo_seq;
	}
	public String getCondo_img() {
		return condo_img;
	}
	public void setCondo_img(String condo_img) {
		this.condo_img = condo_img;
	}
}
