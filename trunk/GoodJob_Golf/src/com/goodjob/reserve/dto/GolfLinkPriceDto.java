package com.goodjob.reserve.dto;

public class GolfLinkPriceDto {
	private int golflink_seq;   
	private String price_type;
	private int golflink_price;
	
	public int getGolflink_seq() {
		return golflink_seq;
	}
	public void setGolflink_seq(int golflink_seq) {
		this.golflink_seq = golflink_seq;
	}
	public String getPrice_type() {
		return price_type;
	}
	public void setPrice_type(String price_type) {
		this.price_type = price_type;
	}
	public int getGolflink_price() {
		return golflink_price;
	}
	public void setGolflink_price(int golflink_price) {
		this.golflink_price = golflink_price;
	}
}
