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
	public static final String list = " select mem_seq,mem_id,mem_name,mem_pwd,mem_jumin,mem_mtel,sms_yn,email_yn,secession, "+
		" mem_type, date_format(reg_dt,''%Y-%m-%d %H:%i:%s'') reg_dt from tb_member {0} order by mem_seq desc limit ? , ? ";
	
	
	public static final String mem_total = " select count(*) total from tb_member {0} ";
	
	//회원 상세
	public static final String view = " select * from tb_member where mem_id = ? ";
	
	//업데이트
	public static final String update = " update tb_member set mem_pwd = ? ,mem_mtel = ?, sms_yn = ?, email_yn = ? where mem_id = ?";
	
	//업데이트
	public static final String passwd_update = " update tb_member set mem_pwd = ? where mem_id = ?";
	
	//업데이트
	public static final String type_update = " update tb_member set MEM_TYPE = ? where MEM_ID = ?";
	
	//비번 업데이트
	public static final String memo_update = " update tb_member set memo = ? where MEM_ID = ?";
	
	//회원등록
	public static final String insert = " insert into tb_member (mem_id,mem_name,mem_pwd,mem_jumin,mem_mtel,sms_yn,email_yn,mem_type,secession,reg_dt) "+
										"values (? ,? ,?,? ,? ,? ,?,'0','N',now()) ";
	
	//아이디 찾기
	public static final String id_find = " select mem_id from tb_member where mem_name = ? and mem_mtel = ? ";
	
	//비번 찾기
	public static final String pwd_find = " select mem_pwd from tb_member where mem_name = ? and mem_id = ? ";
	
	//아이디 중복
	public static final String dup_id = " select count(*) as cnt from tb_member where mem_id= ? ";
	
	//주민번호 중복
	public static final String dup_jumin = " select count(*) as cnt from tb_member where mem_jumin= ? ";
	
	//어드민 탈퇴 처리탈퇴
	public static final String secession = " update tb_member set secession = ? , secession_dt = now()  where mem_id= ? ";
	
	//
	public static final String user_secession = " update tb_member set secession = 'H',secession_dt = now(),memo = ? where mem_id= ? ";
	
	public static final String logon = "select mem_id , mem_pwd , mem_name , mem_mtel,secession from tb_member where mem_id= ? ";
	
	public static final String logon_hist = "insert into tb_logon_history(mem_id,logon_type,reg_dt ) values( ? , ? , now())";
	
	public static final String info_to_seq = " select mem_mtel , mem_name , mem_id , sms_yn , email_yn from tb_member where mem_seq in (%s) ";
	
	public static final String mem_sub_list = "select a.mem_seq , a.mem_id , "+
								"a.mem_name ,  "+
								"date_format(a.reg_dt,''%Y-%m-%d'') reg_dt , "+ 
								"a.mem_mtel ,  "+
								"a.sms_yn , a.email_yn , "+
								"count(b.reserve_uid) reserve_cnt "+
								"from tb_member a left outer join tb_golflink_reserve b on a.mem_id=b.reserve_uid "+
								" {0} " +
								"group by a.mem_id, b.reserve_uid {1} " + 
								"order by a.mem_seq desc limit ? , ? ";
	
	public static final String mem_sub_total = "SELECT count(*) total "+
								"from tb_member a left outer join tb_golflink_reserve b on a.mem_id=b.reserve_uid "+
								" {0} " +
								"group by a.mem_id, b.reserve_uid ";
	
	public static final String mem_sub_total2 = " select ifnull(count(mem_id),0) total from tb_member a , tb_golflink_reserve c "+
								" where a.mem_id=c.reserve_uid group by reserve_uid having count(reserve_seq) = ? "; 
	
	public static final String check = "SELECT auth_no,UNIX_TIMESTAMP(now())-send_date as diff FROM tb_email_auth where auth_no=? and email=? and use_yn='N' order by seq limit 1 ";
	
	//인증
	public static final String auth = "insert into tb_email_auth(email,auth_no,send_date) values (? , ? , UNIX_TIMESTAMP(now()))";
	
	public static final String auth_update = "update tb_email_auth set use_yn='Y' where email = ? ";
	
	public static final String history_count = "select count(mem_id) logon_cnt , max(reg_dt) last_dt from tb_logon_history where mem_id= ? ";
}
