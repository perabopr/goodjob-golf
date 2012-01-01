<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.goodjob.order.dto.GolfLinkDto"%>
<%@page import="com.goodjob.order.GolfLinkDao"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String tablename = StringUtils.trimToEmpty(request.getParameter("tablename"));
String reserveseq = StringUtils.trimToEmpty(request.getParameter("reserveseq"));
String colname = StringUtils.trimToEmpty(request.getParameter("colname"));
String status = StringUtils.trimToEmpty(request.getParameter("status"));

String resultCode = "0";
String resultText = "실패";
Map<String,String> params = new HashMap<String,String>();
params.put("reserve_seq", reserveseq);
if(colname.equals("product_price")){
	params.put("product_price",status.replace(",",""));
}else if(colname.equals("process_status")){
	params.put("process_status",status);
}else if(colname.equals("per_num")){
	params.put("per_num",status);
}else if(colname.equals("booking_date")){
	String[] arrDates = status.split(" ");
	params.put("booking_day",arrDates[0].replace("-",""));
	params.put("booking_time",arrDates[1].replace(":",""));
}else if(colname.equals("package_price")){
	params.put("package_price",status);
}else if(colname.equals("condo_price")){
	params.put("condo_price",status);
}

GolfLinkDao glDao = new GolfLinkDao();
try{
	glDao.setStatusUpdate(tablename, params);
	resultCode = "1";
	resultText = "성공";
}
catch(Exception e){
		
}
String returnJson = "{\"reserveResult\":[";
returnJson += "{";
returnJson += "\"a\":\"" + resultCode + "\",";
returnJson += "\"b\":\"" + resultText + "\"";
returnJson += "}";
returnJson += "]}";
%>
<%out.println(returnJson);%>