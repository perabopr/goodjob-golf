package com.goodjob.order.dto;

public class CondoDto {
	private int reserve_seq;
	private int menu_seq;
	private int condo_seq;
	private String reserve_day;
	private String reserve_uid;
	private String reserve_name;
	private String condo_name;
	private String roomtype;
	private int condoroom_seq;
	private String in_date;
	private String out_date;
	private int per_num;
	private int room_num;
	private String reserve_phone;
	private int condo_price;
	private String reserve_memo;
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
	public int getCondo_seq() {
		return condo_seq;
	}
	public void setCondo_seq(int condo_seq) {
		this.condo_seq = condo_seq;
	}
	public String getReserve_day() {
		return reserve_day;
	}
	public void setReserve_day(String reserve_day) {
		this.reserve_day = reserve_day;
	}
	public String getReserve_uid() {
		return reserve_uid;
	}
	public void setReserve_uid(String reserve_uid) {
		this.reserve_uid = reserve_uid;
	}
	public String getReserve_name() {
		return reserve_name;
	}
	public void setReserve_name(String reserve_name) {
		this.reserve_name = reserve_name;
	}
	public String getCondo_name() {
		return condo_name;
	}
	public void setCondo_name(String condo_name) {
		this.condo_name = condo_name;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public int getCondoroom_seq() {
		return condoroom_seq;
	}
	public void setCondoroom_seq(int condoroom_seq) {
		this.condoroom_seq = condoroom_seq;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	public String getOut_date() {
		return out_date;
	}
	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}
	public int getPer_num() {
		return per_num;
	}
	public void setPer_num(int per_num) {
		this.per_num = per_num;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getReserve_phone() {
		return reserve_phone;
	}
	public void setReserve_phone(String reserve_phone) {
		this.reserve_phone = reserve_phone;
	}
	public int getCondo_price() {
		return condo_price;
	}
	public void setCondo_price(int condo_price) {
		this.condo_price = condo_price;
	}
	public String getReserve_memo() {
		return reserve_memo;
	}
	public void setReserve_memo(String reserve_memo) {
		this.reserve_memo = reserve_memo;
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
