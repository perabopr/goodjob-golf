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
	
	public static final String list = "SELECT seq , name , email , subject , readcount , write_date , filename , position, thread FROM %s " +
										" %s ORDER BY thread desc , position LIMIT ? , ? ";
	
	public static final String totalcnt = "SELECT COUNT(*) AS CNT FROM %s %s ";
	
	public static final String max = " SELECT IFNULL(MAX(seq),0)+1 as seq FROM %s ";
	
	public static final String view = "SELECT * FROM %s WHERE seq = ? ";
	
	public static final String readcount = " UPDATE notice_bbs SET readcount = readcount + 1 WHERE seq = ? ";
	
	public static final String update = "UPDATE %s SET " + 
										 " name = ?, email = ?, subject = ?, content = ?, ishtml = ? where seq = ? ";
	
	public static final String insert = " INSERT INTO %s (seq,mem_id,name,email,subject,content,password,readcount,write_date,filename,position,thread,ishtml,writeip,notice) " + 
										 "VALUES (? , ? , ? , ? , ? , ? , ? , 0 , date_format(curdate(),?) , ? , ? , ? , ? , ? , ? )";
	
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
    "a.readcount, " +
    "a.join_status, " +
    "a.reg_dt " +
    "from tb_join_bbs a ";
	
	public static final String join_insert = "insert into tb_join_bbs(join_name,tel1,tel2,tel3,region,golflink_name,sex,age,join_person,rounding_dt,price_info1,price_info2,price_info3,content,readcount,join_status,reg_dt ) "+
					"values(?,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? , now() )";

	public static final String join_update = "update tb_join_bbs "+
	"set join_name = ?, tel1 = ?, tel2 = ?, tel3 = ?, region = ?, golflink_name = ?, sex = ?, age = ?, join_person = ?, rounding_dt = ?, price_info1 = ?, price_info2 = ?, price_info3 = ?, content = ?, join_status = ?  "+ 
	"where join_no = ? ";
	
	public static final String join_stats = "update tb_join_bbs set  join_status = ? where join_no = ? ";
	
	
	public static final String join_clist = "select a.cmt_no, " +
    "a.join_no, " +
    "a.cmt_name, " +
    "a.comment, " +
    "a.reg_dt " +
	"from tb_join_comment a ";
	
	public static final String join_cinsert = "insert into tb_join_comment(join_no,cmt_name,comment,reg_dt ) "+
	"values(? ,? ,? ,now()  ) ";
	
	public static final String join_cupdate = "update tb_join_comment set join_no = ?, cmt_name = ?, comment = ?, reg_dt = ? where cmt_no = ? ";
}
