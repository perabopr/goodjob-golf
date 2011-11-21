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
	
	
	private Integer seq;
	private String mem_id;
	private String name;
	private String email;
	private String subject;
	private String content;
	private String password;
	private String readcount;
	private String write_date;
	private String filename;
	private String position;
	private Integer thread;
	private String ishtml;
	private String writeip;
	private String notice;
	
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
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
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String writeDate) {
		write_date = writeDate;
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
	public Integer getThread() {
		return thread;
	}
	public void setThread(Integer thread) {
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
	
	
}
