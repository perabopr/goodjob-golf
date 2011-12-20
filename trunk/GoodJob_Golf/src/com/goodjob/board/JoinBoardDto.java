/**
 * 
 */
package com.goodjob.board;

import java.io.Serializable;

/**
 * @author bluecara
 *
 */
public class JoinBoardDto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3339936204596487598L;
	
	private int join_seq;
	private String join_name;
	private String mem_id;
	private String tel1;
	private String tel2;
	private String tel3;
	private String region;
	private String golflink_name;
	private String sex;
	private String age;
	private int join_person = 0;
	private String rounding_dt;
	private String price_info1;
	private String price_info2;
	private String price_info3;
	private String content;
	private int readcount;
	private int apply_count;
	private String join_status;
	private String reg_dt;
	
	private int cmt_seq;
	private String cmt_name;
	private String comment;
	
	public int getJoin_seq() {
		return join_seq;
	}
	public void setJoin_seq(int joinSeq) {
		join_seq = joinSeq;
	}
	public String getJoin_name() {
		return join_name;
	}
	public void setJoin_name(String joinName) {
		join_name = joinName;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String memId) {
		mem_id = memId;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getGolflink_name() {
		return golflink_name;
	}
	public void setGolflink_name(String golflinkName) {
		golflink_name = golflinkName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public int getJoin_person() {
		return join_person;
	}
	public void setJoin_person(int joinPerson) {
		join_person = joinPerson;
	}
	public String getRounding_dt() {
		return rounding_dt;
	}
	public void setRounding_dt(String roundingDt) {
		rounding_dt = roundingDt;
	}
	public String getPrice_info1() {
		return price_info1;
	}
	public void setPrice_info1(String priceInfo1) {
		price_info1 = priceInfo1;
	}
	public String getPrice_info2() {
		return price_info2;
	}
	public void setPrice_info2(String priceInfo2) {
		price_info2 = priceInfo2;
	}
	public String getPrice_info3() {
		return price_info3;
	}
	public void setPrice_info3(String priceInfo3) {
		price_info3 = priceInfo3;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getApply_count() {
		return apply_count;
	}
	public void setApply_count(int applyCount) {
		apply_count = applyCount;
	}
	public String getJoin_status() {
		return join_status;
	}
	public void setJoin_status(String joinStatus) {
		join_status = joinStatus;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String regDt) {
		reg_dt = regDt;
	}
	public int getCmt_seq() {
		return cmt_seq;
	}
	public void setCmt_seq(int cmtSeq) {
		cmt_seq = cmtSeq;
	}
	public String getCmt_name() {
		return cmt_name;
	}
	public void setCmt_name(String cmtName) {
		cmt_name = cmtName;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
