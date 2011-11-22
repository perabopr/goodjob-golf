/**
 * 
 */
package com.goodjob.conf;

import java.util.ResourceBundle;

/**
 * @author Administrator
 *
 */
public class Config {

	public static ResourceBundle rb;
	static {
		rb = ResourceBundle.getBundle("com.goodjob.conf.env");
	}
	
	public static String get(String key){
		return rb.getString(key);
	}
}
