/**
 * 
 */
package com.goodjob.board;

import java.io.Serializable;

/**
 * @author Administrator
 *
 */
public class BoardDto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 472777695132777620L;
	
	
	private int seq;
	private String mem_id;
	private String name;
	private String email;
	private String subject;
	private String content;
	private String password;
	private String readcount;
	private String reg_dt;
	private String filename;
	private String position;
	private int thread;
	private String ishtml;
	private String writeip;
	private String notice;
	private int reg_term;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String memId) {
		mem_id = memId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getReadcount() {
		return readcount;
	}
	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String regDt) {
		reg_dt = regDt;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getThread() {
		return thread;
	}
	public void setThread(int thread) {
		this.thread = thread;
	}
	public String getIshtml() {
		return ishtml;
	}
	public void setIshtml(String ishtml) {
		this.ishtml = ishtml;
	}
	public String getWriteip() {
		return writeip;
	}
	public void setWriteip(String writeip) {
		this.writeip = writeip;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public int getReg_term() {
		return reg_term;
	}
	public void setReg_term(int regTerm) {
		reg_term = regTerm;
	}
}
