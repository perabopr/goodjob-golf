
<%@page import="org.apache.commons.lang.math.NumberUtils"%><%@page import="com.goodjob.product.MonthPriceDao"%>
<%@page import="com.goodjob.product.dto.MonthPriceDto"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menuseq = request.getParameter("menuseq");
String serviceseq = request.getParameter("serviceseq");
String ymDate =request.getParameter("yearmonth");
String prices =request.getParameter("arrprices");

MonthPriceDao mpDao = new MonthPriceDao(); 
MonthPriceDto mpDto = new MonthPriceDto();
mpDto.setMenu_seq(Integer.parseInt(menuseq));
mpDto.setService_seq(Integer.parseInt(serviceseq));
mpDto.setYearmonth(ymDate);

//일단 다삭제.
mpDao.setMonthPriceDelete(mpDto);

String[] arrSitePrices = prices.split(",");

//하나씩 insert
for(int i = 0; i < arrSitePrices.length;i++){
	String[] arrItem = arrSitePrices[i].split(":");
	if(arrItem[0].equals("")){
		mpDto.setSite_seq(-1);
	}else{
		int site_seq = NumberUtils.toInt(arrItem[0] , 0);
		site_seq = (site_seq==0?site_seq++:site_seq);
		mpDto.setSite_seq(Integer.parseInt(arrItem[0]));
	}
	mpDto.setPrice1(Integer.parseInt(arrItem[1]));
	mpDto.setPrice2(Integer.parseInt(arrItem[2]));
	if(arrItem.length >= 4){
		mpDto.setPrice3(Integer.parseInt(StringUtils.defaultIfEmpty(arrItem[3], "0")));
	}else{
		mpDto.setPrice3(0);
	}
	
	mpDao.setMonthPriceInsert(mpDto);
}
%>