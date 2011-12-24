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
	public static final String list = " select mem_seq,mem_id,mem_name,mem_pwd,mem_jumin,mem_mtel,sms_yn,email_yn, "+
		" mem_type, date_format(reg_dt,''%Y-%m-%d %H:%i:%s'') reg_dt from tb_member {0} order by mem_seq desc limit ? , ? ";
	
	
	public static final String mem_total = " select count(*) total from tb_member {0} ";
	
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
	public static final String id_find = " select mem_id from tb_member where mem_name = ? and mem_mtel = ? ";
	
	//비번 찾기
	public static final String pwd_find = " select mem_pwd from tb_member where mem_id = ? and mem_mtel = ? ";
	
	//아이디 중복
	public static final String dup_id = " select count(*) as cnt from tb_member where mem_id= ? ";
	
	//주민번호 중복
	public static final String dup_jumin = " select count(*) as cnt from tb_member where mem_jumin= ? ";
	
	//탈퇴
	public static final String secession = " update tb_member set secession = 'Y' , secession_dt = now()  where mem_id= ? ";
	
	public static final String logon = " select mem_id , mem_pwd , mem_name , mem_mtel from tb_member where mem_id= ? ";
	
	public static final String logon_hist = "insert into tb_logon_history(mem_id,logon_type,reg_dt ) values( ? , ? , now())";
	
	public static final String info_to_seq = " select mem_mtel , mem_name , mem_id , sms_yn , email_yn from tb_member where mem_seq in (%s) ";
	
	public static final String mem_sub_list = "SELECT a.mem_seq , a.mem_id , "+
								"a.mem_name ,  "+
								"date_format(a.reg_dt,''%Y-%m-%d'') reg_dt , "+ 
								"a.mem_mtel ,  "+
								"a.sms_yn , a.email_yn , "+
								"count(b.mem_id) logon_cnt, "+ 
								"date_format(max(b.reg_dt),''%Y-%m-%d'') last_dt , "+ 
								"count(c.reserve_seq) reserve_cnt "+
								"FROM tb_member a left outer join tb_logon_history b on a.mem_id=b.mem_id "+
								"left outer join tb_golflink_reserve c on a.mem_id=c.reserve_uid " +
								" {0} \n {1} " +
								"GROUP BY a.mem_id, b.mem_id, c.reserve_uid " + 
								"order by a.mem_seq desc limit ? , ? ";
	public static final String mem_sub_total = "SELECT count(*) total "+
								"FROM tb_member a left outer join tb_logon_history b on a.mem_id=b.mem_id "+
								"left outer join tb_golflink_reserve c on a.mem_id=c.reserve_uid " +
								" {0} \n {1} " +
								"GROUP BY a.mem_id, b.mem_id, c.reserve_uid ";
}
