/**
 * 
 */
package com.goodjob.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

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
}
