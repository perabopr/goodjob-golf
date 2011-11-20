/**
 * 
 */
package com.goodjob.sql;

/**
 * @author Administrator
 *
 */
public class ZIPCODE {

	public static final String address = "select zipcode, sido, gugun, dong, bunji from zipcode WHERE dong like CONCAT(?,'%')";
}
