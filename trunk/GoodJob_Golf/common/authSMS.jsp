
<%@page import="com.goodjob.util.Utils"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%

	Map<String,String> params = new HashMap<String,String>();
	
	String msg 			= "[굳잡골프]인증번호는 %s 입니다.";
	String rphone 		= "02-6670-0200";
	String sphone 		= StringUtils.defaultString(request.getParameter("sphone"), "");
	
	String authNum = Utils.authNumber(5);
	
	params.put("msg",String.format(msg , authNum));
	params.put("rphone","");
	params.put("sphone","");
	
	SMSDao sDao = new SMSDao();
	boolean isSend = sDao.send(params);
	
%>
