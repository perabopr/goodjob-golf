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
	
	private Integer join_no;
	private String join_name;
	private String tel1;
	private String tel2;
	private String tel3;
	private String region;
	private String golflink_name;
	private String sex;
	private Integer age=0;
	private Integer join_person=0;
	private String rounding_dt;
	private String price_info1;
	private String price_info2;
	private String price_info3;
	private String content;
	private Integer readcount;
	private Integer apply_count;
	private String join_status;
	private String reg_dt;
	
	private Integer cmt_no;
	private String cmt_name;
	private String comment;
	
	public Integer getJoin_no() {
		return join_no;
	}
	public void setJoin_no(Integer join_no) {
		this.join_no = join_no;
	}
	public String getJoin_name() {
		return join_name;
	}
	public void setJoin_name(String join_name) {
		this.join_name = join_name;
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
	public void setGolflink_name(String golflink_name) {
		this.golflink_name = golflink_name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Integer getJoin_person() {
		return join_person;
	}
	public void setJoin_person(Integer join_person) {
		this.join_person = join_person;
	}
	public String getRounding_dt() {
		return rounding_dt;
	}
	public void setRounding_dt(String rounding_dt) {
		this.rounding_dt = rounding_dt;
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
	public Integer getReadcount() {
		return readcount;
	}
	
	public Integer getApply_count() {
		return apply_count;
	}
	public void setApply_count(Integer applyCount) {
		apply_count = applyCount;
	}
	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
	public String getJoin_status() {
		return join_status;
	}
	public void setJoin_status(String join_status) {
		this.join_status = join_status;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public Integer getCmt_no() {
		return cmt_no;
	}
	public void setCmt_no(Integer cmt_no) {
		this.cmt_no = cmt_no;
	}
	public String getCmt_name() {
		return cmt_name;
	}
	public void setCmt_name(String cmt_name) {
		this.cmt_name = cmt_name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
}
