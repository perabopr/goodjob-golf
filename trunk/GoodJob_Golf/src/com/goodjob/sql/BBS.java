/**
 * 
 */
package com.goodjob.sql;

/**
 * @author Administrator
 *
 */
public class BBS {

	public static final int per_page = 20;
	
	public static final String list = " SELECT seq , name , email , subject , content, readcount , date_format(reg_dt,''%Y-%m-%d'') reg_dt , filename , position, thread FROM {0} " +
										" {1} ORDER BY thread desc , position LIMIT ? , ? ";
	
	public static final String totalcnt = "SELECT COUNT(*) AS CNT FROM {0} {1} ";
	
	public static final String max = " SELECT IFNULL(MAX(seq),0)+1 as seq FROM %s ";
	
	public static final String view = "SELECT * FROM %s WHERE seq = ? ";
	
	public static final String readcount = " UPDATE %s SET readcount = readcount + 1 WHERE seq = ? ";
	
	public static final String update = "UPDATE %s SET " + 
										 " name = ?, email = ?, subject = ?, content = ?, ishtml = ? where seq = ? ";
	
	public static final String insert = " insert into %s (seq,mem_id,name,email,subject,content,password,readcount,reg_dt,filename,position,thread,ishtml,writeip,notice_yn) " + 
										 "values (?,?,?,?,?,?,?,0,curdate(),?,?,?,?,?,?)";
	
	public static final String delete = "DELETE FROM %s WHERE seq = ? ";
	
	public static final String join_list = "select a.join_seq , " +
    "a.join_name, " +
    "a.mem_id, " +
    "a.tel1, " +
    "a.tel2, " +
    "a.tel3, " +
    "a.region, " +
    "a.golflink_name, " +
    "a.sex, " +
    "a.age, " +
    "a.join_person, " +
    "a.rounding_dt, " +
    "a.price_info1, " +
    "a.price_info2, " +
    "a.price_info3, " +
    "a.content, " +
    "a.readcount,apply_count, " +
    "a.join_status, " +
    " date_format(a.reg_dt,''%y/%m/%d'') reg_dt " +
    " from tb_join_bbs a where 1=1 {0} order by a.join_seq desc limit ? , ? ";
	
	public static final String join_view = "select a.join_seq, " +
    "a.join_name, " +
    "a.mem_id, " +
    "a.tel1, " +
    "a.tel2, " +
    "a.tel3, " +
    "a.region, " +
    "a.golflink_name, " +
    "a.sex, " +
    "a.age, " +
    "a.join_person, " +
    "a.rounding_dt, " +
    "a.price_info1, " +
    "a.price_info2, " +
    "a.price_info3, " +
    "a.content, " +
    "a.readcount,apply_count, " +
    "a.join_status, " +
    " date_format(a.reg_dt,'%y/%m/%d') reg_dt " +
    "from tb_join_bbs a where join_seq = ? ";
	
	public static final String join_totalcnt = " select COUNT(*) AS CNT FROM tb_join_bbs %s ";
	
	public static final String join_readcount = " UPDATE tb_join_bbs SET readcount = readcount + 1 WHERE join_seq = ? ";
	
	//join_status - I : 진행중 , E : 완료   
	public static final String join_insert = "insert into tb_join_bbs(join_name,mem_id,tel1,tel2,tel3,region,golflink_name,"+
					"sex,age,join_person,rounding_dt,price_info1,price_info2,price_info3,content,join_status,reg_dt ) "+
					"values(?,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,'I', now() )";

	public static final String join_update = "update tb_join_bbs "+
	"set join_name = ?, tel1 = ?, tel2 = ?, tel3 = ?, region = ?, golflink_name = ?, sex = ?, age = ?, join_person = ?, rounding_dt = ?, "+
	"price_info1 = ?, price_info2 = ?, price_info3 = ?, content = ?  "+ 
	"where join_seq = ? ";

	public static final String join_delete = "DELETE FROM tb_join_bbs WHERE join_seq = ? ";
	
	public static final String join_status = "update tb_join_bbs set join_status = 'E' where join_seq = ? ";
	
	public static final String join_apply = "update tb_join_bbs set apply_count=apply_count + 1 where join_seq = ? ";
	
	public static final String join_clist = "select a.cmt_seq, " +
    "a.join_seq, " +
    "a.cmt_name, " +
    "a.mem_id, " +
    "a.comment, " +
    "date_format(a.reg_dt,'%Y-%m-%d') reg_dt  " +
	"from tb_join_comment a where a.join_seq = ? order by a.cmt_seq desc ";
	
	public static final String join_cinsert = "insert into tb_join_comment(join_seq,mem_id,cmt_name,comment,reg_dt ) "+
	"values(? ,? ,? ,? ,now()) ";
	
	public static final String join_cdelete = "DELETE FROM tb_join_comment WHERE join_seq = ? ";
	
	//-------------------- tb_partnership -----------------------------
	public static final String partnership_list = "select a.seq, " +
			"a.name, " +
			"a.email, " +
			"a.subject, " +
			"a.mobile, " +
			"a.content, " +
			"a.filename, " +
			"a.writeip, " +
			"date_format(a.reg_dt,''%Y-%m-%d %H:%i'') reg_dt " +
			"from tb_partnership a {0} limit ? , ?  ";
	
	public static final String partnership_total = "select count(*) cnt from tb_partnership a {0}";
	
	public static final String partnership = "select a.seq, " +
			"a.name, " +
			"a.email, " +
			"a.subject, " +
			"a.mobile, " +
			"a.content, " +
			"a.filename, " +
			"a.writeip, " +
			"date_format(a.reg_dt,'%Y-%m-%d %H:%i') reg_dt " +
			"from tb_partnership a where seq = ?  ";
	
	public static final String partnership_insert = "insert into tb_partnership( name,email,subject,mobile,content,filename,writeip,reg_dt ) "+
		" values( ?, ?, ?, ?, ?, ?, ?, now() ) ";
	
}
