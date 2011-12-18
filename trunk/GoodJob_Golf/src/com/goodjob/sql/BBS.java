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
	
	public static final String list = "SELECT seq , name , email , subject , readcount , date_format(write_date,''%Y-%m-%d'') write_date , filename , position, thread FROM {0} " +
										" {1} ORDER BY thread desc , position LIMIT ? , ? ";
	
	public static final String totalcnt = "SELECT COUNT(*) AS CNT FROM {0} {1} ";
	
	public static final String max = " SELECT IFNULL(MAX(seq),0)+1 as seq FROM %s ";
	
	public static final String view = "SELECT * FROM %s WHERE seq = ? ";
	
	public static final String readcount = " UPDATE notice_bbs SET readcount = readcount + 1 WHERE seq = ? ";
	
	public static final String update = "UPDATE %s SET " + 
										 " name = ?, email = ?, subject = ?, content = ?, ishtml = ? where seq = ? ";
	
	public static final String insert = " INSERT INTO %s (seq,mem_id,name,email,subject,content,password,readcount,write_date,filename,position,thread,ishtml,writeip,notice) " + 
										 "VALUES (? , ? , ? , ? , ? , ? , ? , 0 , now() , ? , ? , ? , ? , ? , ? )";
	
	public static final String reply = " INSERT INTO %s (seq,mem_id,name,email,subject,content,password,readcount,write_date,filename,position,thread,ishtml,writeip) " + 
										"VALUES (?,?,?,?,?,?,?,0,date_format(curdate(),?),?,?,?,?,?)";
	
	public static final String delete = "DELETE FROM %s WHERE seq = ? ";
	
	
	
	public static final String join_list = "select a.join_no, " +
    "a.join_name, " +
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
    " from tb_join_bbs a where 1=1 {0} order by a.join_no desc limit ? , ? ";
	
	public static final String join_view = "select a.join_no, " +
    "a.join_name, " +
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
    "from tb_join_bbs a where join_no = ? ";
	
	public static final String join_totalcnt = " select COUNT(*) AS CNT FROM tb_join_bbs %s ";
	
	public static final String join_readcount = " UPDATE tb_join_bbs SET readcount = readcount + 1 WHERE join_no = ? ";
	
	//join_status - I : 진행중 , E : 완료   
	public static final String join_insert = "insert into tb_join_bbs(join_name,tel1,tel2,tel3,region,golflink_name,"+
					"sex,age,join_person,rounding_dt,price_info1,price_info2,price_info3,content,join_status,reg_dt ) "+
					"values(?,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,'I', now() )";

	public static final String join_update = "update tb_join_bbs "+
	"set join_name = ?, tel1 = ?, tel2 = ?, tel3 = ?, region = ?, golflink_name = ?, sex = ?, age = ?, join_person = ?, rounding_dt = ?, "+
	"price_info1 = ?, price_info2 = ?, price_info3 = ?, content = ?  "+ 
	"where join_no = ? ";

	public static final String join_delete = "DELETE FROM tb_join_bbs WHERE join_no = ? ";
	
	public static final String join_status = "update tb_join_bbs set  join_status = 'E' where join_no = ? ";
	
	public static final String join_apply = "update tb_join_bbs set  apply_count = apply_count + 1 where join_no = ? ";
	
	
	public static final String join_clist = "select a.cmt_no, " +
    "a.join_no, " +
    "a.cmt_name, " +
    "a.comment, " +
    "date_format(a.reg_dt,'%Y-%m-%d') reg_dt  " +
	"from tb_join_comment a where a.join_no = ? order by a.cmt_no desc ";
	
	public static final String join_cinsert = "insert into tb_join_comment(join_no,cmt_name,comment,reg_dt ) "+
	"values(? ,? ,? ,now()) ";
	
	public static final String join_cdelete = "DELETE FROM tb_join_comment WHERE join_no = ? ";
}
