package com.goodjob.reserve.dto;

public class CondoRoomDto {
	private int condoterm_seq;
	private int condo_seq;
	private String roomtype = "";
	private int price_n1;
	private int price_n2;
	private int price_n3;
	private int price_s1;
	private int price_s2;
	private int price_s3;
	
	public int getCondoterm_seq() {
		return condoterm_seq;
	}
	public void setCondoterm_seq(int condoterm_seq) {
		this.condoterm_seq = condoterm_seq;
	}
	public int getCondo_seq() {
		return condo_seq;
	}
	public void setCondo_seq(int condo_seq) {
		this.condo_seq = condo_seq;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public int getPrice_n1() {
		return price_n1;
	}
	public void setPrice_n1(int price_n1) {
		this.price_n1 = price_n1;
	}
	public int getPrice_n2() {
		return price_n2;
	}
	public void setPrice_n2(int price_n2) {
		this.price_n2 = price_n2;
	}
	public int getPrice_n3() {
		return price_n3;
	}
	public void setPrice_n3(int price_n3) {
		this.price_n3 = price_n3;
	}
	public int getPrice_s1() {
		return price_s1;
	}
	public void setPrice_s1(int price_s1) {
		this.price_s1 = price_s1;
	}
	public int getPrice_s2() {
		return price_s2;
	}
	public void setPrice_s2(int price_s2) {
		this.price_s2 = price_s2;
	}
	public int getPrice_s3() {
		return price_s3;
	}
	public void setPrice_s3(int price_s3) {
		this.price_s3 = price_s3;
	}
}
