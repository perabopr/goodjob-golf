/*
 * 작성된 날짜: 2004. 4. 23.
 * 
 * Email : gundallover@hotmail.com
 * 
 * author gundallove
 * 
 */
package com.goodjob.mail;

/**
 * 
 * MailException.java
 */
public class MailException extends Exception{
	
	/**
	 * 클래스 생성자
	 */
	public MailException(){
		super();
	}
	
	/**
	 * 클래스 생성자
	 */
	public MailException(String s){
		super(s);
	}

	/**
	 * 메일 에러 생성자
	 * @param s1 에러 위치
	 * @param s2 에러메세지
	 */
	public MailException(String s1 , String s2){
	    System.out.println(s1 + " : ");
	    System.out.println(s2);
	}
}
