<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.member.*"%>
<%@ page import="com.goodjob.sms.*" %>
<%@ page import="com.goodjob.mail.*"%>
<%@ page import="com.goodjob.util.Utils"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="com.goodjob.conf.Config"%>
<%
	request.setCharacterEncoding("utf-8");

	String mem_name 	= StringUtils.trimToEmpty(request.getParameter("mem_name"));
	String mem_id 		= StringUtils.trimToEmpty(request.getParameter("mem_id"));
	
	String mobile 	= StringUtils.trimToEmpty(request.getParameter("mobile"));
	
	String type 	= StringUtils.trimToEmpty(request.getParameter("type"));
	
	Map<String,String> params = new HashMap<String,String>();
	
	MemberDao mDao = new MemberDao();
	
	if("id".equals(type)){
		
		String result = mDao.idFind(mem_name,mobile);
		
		if(result != null && result.length() > 0){
			
			String msg = "[굳잡골프] 회원님의 아이디는  %s 입니다.";
			
			SMSDao sDao = new SMSDao();
			
			params.put("mem_id",result);
			params.put("msg",String.format(msg , result));
			params.put("rphone","02-6670-0200");
			params.put("sphone",mobile);
			sDao.send(params);
			
			sout.println("0");
		}
		else if(result == null){
			out.println("1");
		}
	}
	else if("pwd".equals(type)){
		
		String result = mDao.pwdFind(mem_id,mobile);
		
		if(result != null && result.length() > 0){
			
			String msg = "[굳잡골프] 회원님의 비밀번호는  %s 입니다.";
			
			SMSDao sDao = new SMSDao();
			
			params.put("mem_id",mem_id);
			params.put("msg",String.format(msg , result));
			params.put("rphone","02-6670-0200");
			params.put("sphone",mobile);
			
			sDao.send(params);
			
			out.println("0");
		}
		else if(result == null){
			out.println("1");
		}
	}
%>