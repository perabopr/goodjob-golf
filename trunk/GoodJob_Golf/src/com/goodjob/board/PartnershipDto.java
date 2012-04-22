/**
 * 
 */
package com.goodjob.board;

import java.io.Serializable;

/**
 * @author bluecara
 *
 */
public class PartnershipDto implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4865466620709689060L;
	
	private int seq;
	private String name;
	private String email;
	private String subject;
	private String mobile;
	private String content;
	private String filename;
	private String writeip;
	private String reg_dt;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getWriteip() {
		return writeip;
	}
	public void setWriteip(String writeip) {
		this.writeip = writeip;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
}
