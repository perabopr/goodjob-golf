package com.goodjob.product.dto;

public class GolfLinkCourseDto {
	private int golflink_course_seq;
	private int golflink_seq;
	private String course_name;
	
	public int getGolflink_course_seq() {
		return golflink_course_seq;
	}
	public void setGolflink_course_seq(int golflink_course_seq) {
		this.golflink_course_seq = golflink_course_seq;
	}
	public int getGolflink_seq() {
		return golflink_seq;
	}
	public void setGolflink_seq(int golflink_seq) {
		this.golflink_seq = golflink_seq;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
}
