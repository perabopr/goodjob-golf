package com.goodjob.product.dto;

import java.io.Serializable;

public class MenuDto implements Serializable {
	private int menu_seq;
	private String menu_name;
	
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
}
