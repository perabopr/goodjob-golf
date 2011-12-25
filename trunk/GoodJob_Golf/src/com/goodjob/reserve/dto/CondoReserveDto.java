/**
 * 
 */
package com.goodjob.reserve.dto;

import java.io.Serializable;

/**
 * @author Administrator
 *
 */
public class CondoReserveDto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3833437563907034889L;
	private int reserve_seq;
	private int menu_seq;
	private int condo_seq;
	private String reserve_day;
	private String reserve_name;
	private String condo_name;
	private String roomtype;
	private String in_date;
	private String out_date;
	private String reserve_phone;
	private int condo_price;
	private String process_status;
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
	public int getCondo_seq() {
		return condo_seq;
	}
	public void setCondo_seq(int condoSeq) {
		condo_seq = condoSeq;
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
	public String getCondo_name() {
		return condo_name;
	}
	public void setCondo_name(String condoName) {
		condo_name = condoName;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String inDate) {
		in_date = inDate;
	}
	public String getOut_date() {
		return out_date;
	}
	public void setOut_date(String outDate) {
		out_date = outDate;
	}
	public String getReserve_phone() {
		return reserve_phone;
	}
	public void setReserve_phone(String reservePhone) {
		reserve_phone = reservePhone;
	}
	public int getCondo_price() {
		return condo_price;
	}
	public void setCondo_price(int condoPrice) {
		condo_price = condoPrice;
	}
	public String getProcess_status() {
		return process_status;
	}
	public void setProcess_status(String processStatus) {
		process_status = processStatus;
	}
	
	
}
