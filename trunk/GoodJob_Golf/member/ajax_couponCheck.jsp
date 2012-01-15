<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String user_Id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));
String couponCode = StringUtils.trimToEmpty(request.getParameter("couponcode"));

int returnValue = 0;

if(user_Id.length() > 0 && couponCode.length() > 0){
	CouponDao cpDao = new CouponDao();
	returnValue = cpDao.chkCouponReg(couponCode, user_Id);
}

String returnJson = "{\"CouponCode\":[";
returnJson += "{";
returnJson += "\"rv\":\"" + returnValue + "\"";
returnJson += "}";
returnJson += "]}";
out.println(returnJson);%>