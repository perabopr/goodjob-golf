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
	public static final String list = " select mem_seq,mem_id,mem_name,mem_pwd,mem_jumin,mem_mtel,sms_yn,email_yn,"+
	"mem_type,reg_dt from tb_member where 1=1 %s order by mem_seq desc limit ? , ? ";
	
	//회원 상세
	public static final String view = " select * from tb_member where mem_id = ? ";
	
	//업데이트
	public static final String update = " update tb_member "+
										" set mem_pwd = ?, mem_mtel = ?, sms_yn = ?, email_yn = ? where mem_id = ?";
	
	//업데이트
	public static final String type_update = " update tb_member set MEM_TYPE = ? where MEM_ID = ?";
	
	public static final String memo_update = " update tb_member set memo = ? where MEM_ID = ?";
	
	//회원등록
	public static final String insert = " insert into tb_member (mem_id,mem_name,mem_pwd,mem_jumin,mem_mtel,sms_yn,email_yn,mem_type,secession,reg_dt) "+
										"values (? ,? ,?,? ,? ,? ,?,'F','N',now()) ";
	
	//아이디 찾기
	public static final String id_find = " select mem_id where tb_member where mem_name = ? and mem_mtel = ? ";
	
	//비번 찾기
	public static final String pwd_find = " select mem_pwd from tb_member where mem_id = ? and mem_mtel = ? ";
	
	//아이디 중복
	public static final String dup_id = " select count(*) as cnt from tb_member where mem_id= ? ";
	
	//주민번호 중복
	public static final String dup_jumin = " select count(*) as cnt from tb_member where mem_jumin= ? ";
	
	//탈퇴
	public static final String secession = " update tb_member set secession = 'Y' , secession_dt = now()  where mem_id= ? ";
	
	public static final String logon = " select mem_id , mem_pwd , mem_name , mem_mtel from tb_member where mem_id= ? ";
}
