<%@page import="com.goodjob.util.Utils"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%

	Map<String,String> params = new HashMap<String,String>();
	
	String msg 			= "대한민국 No.1 골프부킹 할인서비스\n[goodjobgolf]인증번호는 %s 입니다.";
	String sphone 		= "02-6670-0202";
	String rphone 		= StringUtils.defaultString(request.getParameter("rphone"), "");
	
	String authNum = Utils.smsAuthNumber(5);
	
	params.put("msg",String.format(msg , authNum));
	params.put("authNum",authNum);
	params.put("rphone",rphone);
	params.put("sphone",sphone);
	
	SMSDao sDao = new SMSDao();
	
	boolean isSend = sDao.auth(params);
	
	if(isSend) out.println("0");
	else  out.println("1");
%>
