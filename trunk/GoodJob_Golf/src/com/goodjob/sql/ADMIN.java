package com.goodjob.sql;

public class ADMIN {

	public static final String list = " select a.admin_id,a.admin_pwd,a.admin_name,type,a.reg_date from tb_admin a order by a.reg_date ";
	
	public static final String insert = "insert into tb_admin( admin_id,admin_pwd,admin_name,type,reg_date ) values( ?, ?, ?, ?,now() )";
	
	public static final String update = "update tb_admin set admin_pwd = ?, admin_name = ? where admin_id = ? ";
	
	public static final String delete = "delete from tb_admin where admin_id = ? ";
	
	public static final String login = " select admin_pwd ,admin_name,type from tb_admin where admin_id = ? ";
}
