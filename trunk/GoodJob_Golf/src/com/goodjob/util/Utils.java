/**
 * 
 */
package com.goodjob.util;

import java.text.SimpleDateFormat;
import java.util.Date;

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
}
