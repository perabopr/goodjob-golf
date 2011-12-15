/**
 * 
 */
package com.goodjob.member;

import java.io.Serializable;

/**
 * @author dubero
 *
 */
public class MemberDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8799454796893112030L;
	
	private Long mem_no;
	private String mem_id;
	private String mem_name;
	private String mem_pwd;
	private String mem_jumin;
	private String mem_mtel;
	private String sms_yn;
	private String email_yn;
	private String mem_type;
	private String recommend;
	private String secession;
	private String reg_dt;
	private String login_dt;
	private int login_attempt;
	private String input_pwd;
	
	
	public Long getMem_no() {
		return mem_no;
	}
	public void setMem_no(Long mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	
	public String getMem_jumin() {
		return mem_jumin;
	}
	public void setMem_jumin(String memJumin) {
		mem_jumin = memJumin;
	}
	public String getMem_mtel() {
		return mem_mtel;
	}
	public void setMem_mtel(String mem_mtel) {
		this.mem_mtel = mem_mtel;
	}
	public String getSms_yn() {
		return sms_yn;
	}
	public void setSms_yn(String sms_yn) {
		this.sms_yn = sms_yn;
	}
	public String getEmail_yn() {
		return email_yn;
	}
	public void setEmail_yn(String email_yn) {
		this.email_yn = email_yn;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getSecession() {
		return secession;
	}
	public void setSecession(String secession) {
		this.secession = secession;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getLogin_dt() {
		return login_dt;
	}
	public void setLogin_dt(String login_dt) {
		this.login_dt = login_dt;
	}
	
	public int getLogin_attempt() {
		return login_attempt;
	}
	public void setLogin_attempt(int login_attempt) {
		this.login_attempt = login_attempt;
	}
	public String getMem_type() {
		return mem_type;
	}
	public void setMem_type(String memType) {
		mem_type = memType;
	}
	public String getInput_pwd() {
		return input_pwd;
	}
	public void setInput_pwd(String inputPwd) {
		input_pwd = inputPwd;
	}
}
