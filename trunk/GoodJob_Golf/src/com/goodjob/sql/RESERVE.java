package com.goodjob.sql;

public class RESERVE {
	public static final String region_select = "select * from tb_region";
	public static final String region_insert = "insert into tb_region(region_type, region_name, etc)values(?,?,?)";
	public static final String region_delete = "delete from tb_region where region_seq = ?";
	
	public static final String menu_select = "select * from tb_menu";
	public static final String menu_insert = "insert into tb_menu(menu_name)values(?)";
	public static final String menu_delete = "delete from tb_menu where menu_seq = ?";
}
