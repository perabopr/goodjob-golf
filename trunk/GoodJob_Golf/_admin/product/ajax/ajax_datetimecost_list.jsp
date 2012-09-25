<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ 
page import="com.goodjob.product.dto.ProductSubSiteDto"%><%@ 
page import="com.goodjob.product.dto.MonthPriceDto"%><%@ 
page import="com.goodjob.product.MonthPriceDao"%><%@ 
page import="org.apache.commons.dbutils.*" %><%@ 
page import="org.apache.commons.lang.StringUtils"%><%@ 
page import="java.sql.*,java.util.*" %><%@ 
page import="org.apache.commons.dbutils.handlers.*" %><%@ 
page import="com.goodjob.product.dto.ProductDto"%><%@ 
page import="com.goodjob.product.dto.ProductSubDto"%><%@ 
page import="com.goodjob.product.productDao"%><%

String menuseq = request.getParameter("mnseq");
String golflinkseq = request.getParameter("glseq");
String pDate = StringUtils.trimToEmpty(request.getParameter("date"));
String[] arrDate = pDate.split("/");
String pYear = arrDate[0];
String pMonth = arrDate[1];
String pDay = arrDate[2];

ProductDto pdDto = new ProductDto();
pdDto.setMenu_seq(Integer.parseInt(menuseq));
pdDto.setGolflink_seq(Integer.parseInt(golflinkseq));
pdDto.setProduct_year(pYear);
pdDto.setProduct_month(pMonth);
pdDto.setProduct_day(pDay);

productDao pDao = new productDao();
List<ProductSubDto> arrPrdtSub = pDao.getProductSubSelect(pdDto);
String returnJson = "";

int index = 2;

if(arrPrdtSub != null && arrPrdtSub.size() > 0){

	returnJson = "{\"ProductSub\":[";
	for(int i = 0; i < arrPrdtSub.size();i++){
		returnJson += "{";
		returnJson += "\"a\":\"" + arrPrdtSub.get(i).getProductsub_seq() + "\",";
		returnJson += "\"b\":\"" + arrPrdtSub.get(i).getProduct_seq() + "\",";
		returnJson += "\"c\":\"" + arrPrdtSub.get(i).getGolflink_course_seq() + "\",";
		returnJson += "\"d\":\"" + arrPrdtSub.get(i).getTime_start() + "\",";
		returnJson += "\"e\":\"" + arrPrdtSub.get(i).getTime_end() + "\",";
		returnJson += "\"f\":\"" + arrPrdtSub.get(i).getGoodjob_price() + "\",";
		returnJson += "\"g\":\"" + arrPrdtSub.get(i).getNH_price() + "\",";
		returnJson += "\"h\":\"" + arrPrdtSub.get(i).getProduct_status() + "\",";
		returnJson += "\"i\":\"" + arrPrdtSub.get(i).getCoupon_use_yn() + "\",";
		returnJson += "\"j\":\"" + arrPrdtSub.get(i).getReal_nh_price() + "\",";
	
		/**
		  * 싸이트 가격 가져오기.
		*/
		List<ProductSubSiteDto> lstpss = pDao.getProductSubSite( arrPrdtSub.get(i).getProductsub_seq());
		String strSitePrice = "";
		for(int k = 0; k < lstpss.size();k++){
			strSitePrice += "{\"aa\":\"" + lstpss.get(k).getSite_seq() + "\",";
			strSitePrice += "\"bb\":\"" + lstpss.get(k).getPrice1() + "\",";
			strSitePrice += "\"cc\":\"" + lstpss.get(k).getPrice2() + "\",";
			strSitePrice += "\"dd\":\"" + lstpss.get(k).getPrice3() + "\"},";		
		}
		if(strSitePrice.length() > 0){
			strSitePrice = strSitePrice.substring(0, strSitePrice.length()-1);
		}
		returnJson += "\"k\":[" + strSitePrice + "]";
		returnJson += "},";
	}
	if(arrPrdtSub.size() > 0){
		returnJson = returnJson.substring(0, returnJson.length()-1);
	}
	returnJson += "]}";
}
else{
	
	/**
	 *메뉴골프장월별 - 가격가져오기.
	 */
	MonthPriceDao mPriceDao = new MonthPriceDao();
	MonthPriceDto mPriceDto = new MonthPriceDto();
	mPriceDto.setMenu_seq(Integer.parseInt(menuseq));
	mPriceDto.setService_seq(Integer.parseInt(golflinkseq));
	mPriceDto.setYearmonth(pYear+pMonth);
	List<MonthPriceDto> arrMPDto = mPriceDao.getMonthPrice(mPriceDto);
	
	returnJson = "{\"ProductSub\":[";
	for(int i = 0; i < index ;i++){
		returnJson += "{";
		returnJson += "\"a\":\"\",";
		returnJson += "\"b\":\"\",";
		returnJson += "\"c\":\"\",";
		returnJson += "\"d\":\"0600\",";
		returnJson += "\"e\":\"1200\",";
		returnJson += "\"f\":\"0\",";
		returnJson += "\"g\":\"0\",";
		returnJson += "\"h\":\"\",";
		returnJson += "\"i\":\"\",";
		returnJson += "\"j\":\"0\",";
		
		String strSitePrice = "";
		for(int k = 0; k < 2 ;k++){
			strSitePrice += "{\"aa\":\"\",";
			strSitePrice += "\"bb\":\"0\",";
			strSitePrice += "\"cc\":\"0\",";
			strSitePrice += "\"dd\":\"0\"},";		
		}
		if(strSitePrice.length() > 0){
			strSitePrice = strSitePrice.substring(0, strSitePrice.length()-1);
		}
		returnJson += "\"k\":[0]";
		returnJson += "},";
	}
	if(arrPrdtSub.size() > 0){
		returnJson = returnJson.substring(0, returnJson.length()-1);
	}
	returnJson += "]}";
}
out.println(returnJson);%>