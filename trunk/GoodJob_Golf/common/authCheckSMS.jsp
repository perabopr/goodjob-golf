
<%@page import="com.goodjob.util.Utils"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%

	Map<String,String> params = new HashMap<String,String>();
	
	String sphone 		= StringUtils.defaultString(request.getParameter("sphone"), "");
	String auth_no 		= StringUtils.defaultString(request.getParameter("auth_no"), "");
	
	params.put("auth_no",auth_no);
	params.put("sphone",sphone);
	
	SMSDao sDao = new SMSDao();
	int check = sDao.authCheck(params);
	out.println(check);
%>

