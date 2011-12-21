<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%@page import="com.goodjob.util.Utils"%>
<%@page import="com.goodjob.member.MemberDao"%>
<%

	Map<String,String> params = new HashMap<String,String>();
	
	String sphone 		= "02-6670-0200";
	String rphone 		= StringUtils.defaultString(request.getParameter("mobile"), "");
	String type 		= StringUtils.defaultString(request.getParameter("type"), "");
	String mem_name 		= StringUtils.defaultString(request.getParameter("mem_name"), "");
	String mem_id 		= StringUtils.defaultString(request.getParameter("mem_id"), "");
	
	MemberDao mDao = new MemberDao();
	String result = "";
	if("id".equals(type)){
		result = StringUtils.trimToEmpty(mDao.idFind(mem_name , rphone));
		params.put("msg",String.format("[굳잡골프]고객님의 아이디는 %s 입니다." , result));
		
	}
	else{
		result = StringUtils.trimToEmpty(mDao.idFind(mem_name , rphone));
		params.put("msg",String.format("[굳잡골프]고객님의 비밀번호는 %s 입니다." , result));
	}
	
	if(result.length() > 0){
		params.put("rphone",rphone);
		params.put("sphone",sphone);
		
		SMSDao sDao = new SMSDao();
		
		boolean isSend = sDao.send(params);
		//boolean isSend = sDao.auth(params);
		
		if(isSend) out.println("0");
		else  out.println("2");
	}
	else{
		out.println("1");
	}
%>
