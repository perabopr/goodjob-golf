/**
 * 
 */
package com.goodjob.sql;

/**
 * @author dubero
 *
 */
public class SMS {

	public static final int per_page = 10;
	
	//sms 로그
	public static final String log = " insert into tb_sms_log(mem_id,message,rtel,stel,rdate,rtime,reg_dt ) values (?,?,?,?,?,?,now()) ";
	
	//리스트
	public static final String list = "select * from tb_sms_log %s order by idx desc limit ? ,? ";
	
	//인증
	public static final String auth = "insert into tb_sms_auth(tel_no,auth_no,send_date) values (? , ? , UNIX_TIMESTAMP(now()))";
	
	//인증체크
	public static final String check = "SELECT auth_no,UNIX_TIMESTAMP(now())-send_date as diff FROM tb_sms_auth where auth_no=? and tel_no=? order by idx limit 1 ";
}
