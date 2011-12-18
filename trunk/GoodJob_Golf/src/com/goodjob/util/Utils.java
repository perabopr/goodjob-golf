/**
 * 
 */
package com.goodjob.util;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

/**
 * @author Administrator
 *
 */
public class Utils {

	/**
	*	현재 년월일시분초로 표시 yyyyMMddHHmmssSSS
	*	@param 날짜표시시 적절한 param 형태로 포멧
	*	@return 포멧된 날짜
	*/
	public static String getDate(String format){
		String date = "";
		try{
			SimpleDateFormat formater = new SimpleDateFormat(format);
			date = formater.format(new Date());
		}catch(Exception e){}
		return date;
	}
	
	public static String numberFormat(int num){
		NumberFormat format = NumberFormat.getInstance();
		return format.format(num);
	}
	/**
	 * 인증번호 
	 * @param length
	 * @return
	 */
	public static String authNumber(int length)
	{
	     Random rnd = new Random();
	     String numTemp[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
	     String auth = "";

	     for(int i=0; i<length; i++)
	     {
	           auth = auth+numTemp[rnd.nextInt(10)];
	      }
	      return auth;
	}
	
	/**
	 * <pre>
	 * String getCookie
	 * 쿠키로 저장된 값(userid)이 있으면 값을 가져온다
	 * @param request
	 * @param name
	 * @return
	 * </pre>
	 */
	public static String getCookie(HttpServletRequest request, String name)
	{		 
		Cookie[] cookie = request.getCookies();
		String value = "";
		
		if(cookie == null) return "";
		
		for(int i=0; i<cookie.length;i++){
			if(name.equals(cookie[i].getName()))
				value = StringUtils.trimToEmpty(cookie[i].getValue());
		}

		return value;
	}
	
	/**
	 * <pre>
	 * void setCookie
	 * 쿠키값을 설정한다
	 * @param response
	 * @param name
	 * @param value
	 * </pre>
	 */
	public static void setCookie(HttpServletResponse response, String name, String value)	{
		
		Cookie cookie=new Cookie(name,value);		//일반적 쿠키 
		response.addCookie(cookie);
	}
	
	/**
	 * <pre>
	 * void setCookie
	 * 쿠키값을 설정한다
	 * @param response
	 * @param name
	 * @param value
	 * @param time 	쿠키 시간 
	 * </pre>
	 */
	public static void setCookie(HttpServletResponse response, String name, String value , int time)	{
		
		Cookie cookie=new Cookie(name,value);		//쿠키 세팅
		cookie.setMaxAge(60*time);							//쿠키 시간 세팅
		response.addCookie(cookie);						//실제 쿠키
	}
}
