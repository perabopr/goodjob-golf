/**
 * 
 */
package com.goodjob.member;

/**
 * @author Administrator
 *
 */
public class AdminDto {

	private String admin_id;
	private String admin_pwd;
	private String admin_name;
	private String reg_date;
	private String type;
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String adminId) {
		admin_id = adminId;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String adminPwd) {
		admin_pwd = adminPwd;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String adminName) {
		admin_name = adminName;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String regDate) {
		reg_date = regDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
