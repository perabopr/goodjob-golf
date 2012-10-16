/**
 * 
 */
package com.goodjob.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.text.StringCharacterIterator;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

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
	
	public static String getDate(String format , int day){
		String date = "";
		try{
			Calendar cal = Calendar.getInstance();
			cal.add(cal.DATE, day);
			SimpleDateFormat formater = new SimpleDateFormat(format);
			date = formater.format(cal.getTimeInMillis());
			
		}catch(Exception e){}
		return date;
	}
	
	public static String numberFormat(int num){
		NumberFormat format = NumberFormat.getInstance();
		return format.format(num);
	}
	
	public static String dateFormat(String date , String pattern){
		if(date.length() < 8)
			return date;
		else
			return date.substring(0,4)+pattern+date.substring(4,6)+pattern+date.substring(6,8);
	}
	
	/**
	 * 인증번호 
	 * @param length
	 * @return
	 */
	public static String authNumber(int length)
	{
	     Random rnd = new Random();
	     String num[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
	     String abcd[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
	     
	     StringBuffer auth = new StringBuffer();

	     for(int i=0; i<length; i++)
	     {
	    	 if(i%4==0)
	    		 auth.append(abcd[rnd.nextInt(25)]);
	    	 else
	    		 auth.append(num[rnd.nextInt(10)]);
	      }
	      return auth.toString();
	}
	
	public static String smsAuthNumber(int length)
	{
	     Random rnd = new Random();
	     String num[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
	     //String abcd[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
	     
	     StringBuffer auth = new StringBuffer();

	     for(int i=0; i<length; i++)
	     { 
	    	auth.append(num[rnd.nextInt(10)]);
	     }
	     return auth.toString();
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
	
	/**
	 * 인코딩
	 * @param str
	 * @return String
	 */
	public static String encoder(String str){
		try{
			str = URLEncoder.encode(str, "utf-8");
		}catch(Exception e){}

		return str;
	}

	/**
	 * 디코딩
	 * @param str
	 * @return String
	 */
	public static String decoder(String str){
		try{
			str = URLDecoder.decode(str, "utf-8");
		}catch(Exception e){}

		return str;
	}
	
	/**
	 * 
	 * @param coupon
	 * @return
	 */
	public static List<String[]> getCouponRead(File coupon){
		
		BufferedReader br;
		List<String[]> couponList = new ArrayList<String[]>();
		
		try{
			
			br = new BufferedReader(new InputStreamReader(new FileInputStream(coupon)));
			String tmp = "";
			while((tmp = br.readLine())!= null){
				couponList.add(StringUtils.split(StringUtils.trimToEmpty(tmp), ","));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return couponList;
	}
	
	/**
	 * 
	 * @param str
	 * @param strings
	 * @return
	 */
	public static boolean indexOf(String str , String... strings){
		for(String temp : strings){
			if(str.indexOf(temp)>-1)
				return true;
		}
		return false;
	}
	
	public static String getWeekName(String year , String month , String days){
		
		String week = "";
		Calendar cal= Calendar.getInstance ();
	    
	    cal.set(Calendar.YEAR, NumberUtils.toInt(year));
	    cal.set(Calendar.MONTH, NumberUtils.toInt(month)-1);
	    cal.set(Calendar.DATE, NumberUtils.toInt(days));
	    
	    
	    switch (cal.get(Calendar.DAY_OF_WEEK)){
	    case 1:
	    	week = "(일)";
	        break;
	    case 2:
	        week = "(월)";
	        break;
	    case 3:
	        week = "(화)";
	        break;
	    case 4:
	        week = "(수)";
	        break;
	    case 5:
	        week = "(목)";
	        break;
	    case 6:
	        week = "(금)";
	        break;
	    case 7:
	        week = "(토)";
	        break;
	    }
	    
	    return week;
	}
	
	public static String getIsWeek(String date){
		
		String week = "";
		
		if(date == null || date.length() < 10)
			return "normal";
		
		String[] arrDate = date.split("-");
		
		Calendar cal= Calendar.getInstance ();
	    
	    cal.set(Calendar.YEAR, NumberUtils.toInt(arrDate[0]));
	    cal.set(Calendar.MONTH, NumberUtils.toInt(arrDate[1])-1);
	    cal.set(Calendar.DATE, NumberUtils.toInt(arrDate[2]));
	    
	    
	    switch (cal.get(Calendar.DAY_OF_WEEK)){
	    case 1:
	    	week = "red_s";
	        break;
	    case 7:
	        week = "blue_s";
	        break;
	    default :
	    	week = "normal";
	    	break;
	    }
	    
	    return week;
	}
	
	public static String getCutstring(String param, int len, String tail)
    {
        if(param.length() <= len)
            return param;
        StringCharacterIterator sci = new StringCharacterIterator(param);
        StringBuffer buffer = new StringBuffer();
        buffer.append(sci.first());
        for(int i = 1; i < len; i++)
            if(i < len - 1)
            {
                buffer.append(sci.next());
            } else
            {
                char c = sci.next();
                if(c != ' ')
                    buffer.append(c);
            }

        buffer.append(tail);
        return buffer.toString();
    }
	
}
