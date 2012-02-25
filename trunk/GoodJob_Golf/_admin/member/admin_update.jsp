<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.member.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%

	Map<String,String> params = new HashMap<String,String>();

	String id 	= StringUtils.defaultString(request.getParameter("id"), "");
	String pwd = StringUtils.defaultString(request.getParameter("pwd"), "");
	String name = StringUtils.defaultString(request.getParameter("name"), "");
	String type 	= StringUtils.defaultString(request.getParameter("type"), "");
	String mode 	= StringUtils.defaultString(request.getParameter("mode"), "update");
	
	AdminDao adminDao = new AdminDao();
	AdminDto aDto = new AdminDto();
	aDto.setAdmin_id(id);
	aDto.setAdmin_pwd(pwd);
	aDto.setAdmin_name(name);
	aDto.setType(type);
	
	if("insert".equals(mode)){
		
		adminDao.setInsert(aDto);
		out.println("0");
	}
	else if("update".equals(mode)){
		
		adminDao.setUpdate(aDto);
		
		out.println("0");
	}
	else if("del".equals(mode)){
		
		adminDao.setDelete(id);
		out.println("0");
	}
%>
