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
	
	public static final String list = "SELECT seq , name , email , subject , readcount , write_date , filename , position, thread FROM notice_bbs " +
										" %s ORDER BY thread desc , position LIMIT ? , ? ";
	
	public static final String totalcnt = "SELECT COUNT(*) AS CNT FROM notice_bbs %s ";
	
	public static final String max = " SELECT IFNULL(MAX(seq),0)+1 as seq FROM notice_bbs ";
	
	public static final String view = "SELECT seq , name , email , subject , content, readcount , write_date , " + 
										"filename , position, thread  FROM notice_bbs WHERE seq = ? ";
	
	public static final String readcount = " UPDATE notice_bbs SET readcount = readcount + 1 WHERE seq = ? ";
	
	public static final String update = "UPDATE notice_bbs SET " + 
										 " name = ?, email = ?, subject = ?, content = ?, ishtml = ? where seq = ? ";
	
	public static final String insert = " INSERT INTO notice_bbs (seq,mem_id,name,email,subject,content,password,readcount,write_date,filename,position,thread,ishtml,writeip) " + 
										 "VALUES (?,?,?,?,?,?,?,0,date_format(curdate(),'%Y-%m-%d'),?,?,?,?,?)";
	
	public static final String reply = " INSERT INTO notice_bbs (seq,mem_id,name,email,subject,content,password,readcount,write_date,filename,position,thread,ishtml,writeip) " + 
										"VALUES (?,?,?,?,?,?,?,0,date_format(curdate(),'%Y-%m-%d'),?,?,?,?,?)";
	
	public static final String delete = "DELETE FROM notice_bbs WHERE seq = ? ";
	
}
