/**
 * 
 */
package com.goodjob.sql;

/**
 * @author dubero
 *
 */
public class MEMBER {
	
	public static final int per_page = 20;
	
	//회원 리스트
	public static final String list = " select mem_no,mem_id,mem_name,mem_pwd,mem_mtel,sms_yn,email_yn,mem_type,reg_dt from tb_member where SECESSION = 'N' %s order by mem_no desc limit ? , ? ";
	
	//회원 상세
	public static final String view = " select * from tb_member where mem_no = ? ";
	
	//업데이트
	public static final String update = " update tb_member "+
										"set  MEM_NAME = ?, MEM_PWD = password(?), MEM_MTEL = ?, SMS_YN = ?, EMAIL_YN = ?, RECOMMEND = ? where MEM_ID = ?";
	
	//업데이트
	public static final String type_update = " update tb_member set MEM_TYPE = ? where MEM_ID = ?";
	
	//회원등록
	public static final String insert = " insert into tb_member "+ 
										" (MEM_NO,MEM_ID,MEM_NAME,MEM_PWD,MEM_MTEL,SMS_YN,EMAIL_YN,RECOMMEND,REG_DT)"+
										" values(? ,? ,? ,password(?) ,? ,? ,? ,? ,DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%s'))";
	
	//아이디 찾기
	public static final String id_find = " select mem_id where tb_member where mem_name = ? and mem_mtel = ? ";
	
	//비번 찾기
	public static final String pwd_find = " select mem_id , mem_name , mem_pwd from tb_member where mem_id = ? and mem_name = ? ";
	
	public static final String dup_id = " select count(*) as cnt from tb_member where mem_id= ? ";
	
	//탈퇴
	public static final String secession = " update tb_member set SECESSION = 'Y' , SECESSION_DT = now()  where mem_id= ? ";
	
	public static final String logon = " select mem_id , mem_pwd , mem_name , mem_mtel , password(?) as input_pwd from tb_member where mem_id= ? ";
}
