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
	private String name;
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
	
}
