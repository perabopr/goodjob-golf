package com.goodjob.product.dto;

import java.io.Serializable;

public class CondoPromiseDto implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5710602582464356682L;
	
	private int condo_seq;
	private String promise1_type = "";
	private String promise1 = "";
	private String promise2_type = "";
	private String promise2 = "";
	private String promise3_type = "";
	private String promise3 = "";
	private String promise4_type = "";
	private String promise4 = "";
	private String promise5_type = "";
	private String promise5 = "";
	private String cancelrule = "";
	
	
	public int getCondo_seq() {
		return condo_seq;
	}
	public void setCondo_seq(int condo_seq) {
		this.condo_seq = condo_seq;
	}
	public String getPromise1_type() {
		return promise1_type;
	}
	public void setPromise1_type(String promise1_type) {
		this.promise1_type = promise1_type;
	}
	public String getPromise1() {
		return promise1;
	}
	public void setPromise1(String promise1) {
		this.promise1 = promise1;
	}
	public String getPromise2_type() {
		return promise2_type;
	}
	public void setPromise2_type(String promise2_type) {
		this.promise2_type = promise2_type;
	}
	public String getPromise2() {
		return promise2;
	}
	public void setPromise2(String promise2) {
		this.promise2 = promise2;
	}
	public String getPromise3_type() {
		return promise3_type;
	}
	public void setPromise3_type(String promise3_type) {
		this.promise3_type = promise3_type;
	}
	public String getPromise3() {
		return promise3;
	}
	public void setPromise3(String promise3) {
		this.promise3 = promise3;
	}
	public String getPromise4_type() {
		return promise4_type;
	}
	public void setPromise4_type(String promise4_type) {
		this.promise4_type = promise4_type;
	}
	public String getPromise4() {
		return promise4;
	}
	public void setPromise4(String promise4) {
		this.promise4 = promise4;
	}
	public String getPromise5_type() {
		return promise5_type;
	}
	public void setPromise5_type(String promise5_type) {
		this.promise5_type = promise5_type;
	}
	public String getPromise5() {
		return promise5;
	}
	public void setPromise5(String promise5) {
		this.promise5 = promise5;
	}
	public String getCancelrule() {
		return cancelrule;
	}
	public void setCancelrule(String cancelrule) {
		this.cancelrule = cancelrule;
	}
}
