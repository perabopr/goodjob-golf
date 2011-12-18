<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.member.MemberDao"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%

	Map<String,String> params = new HashMap<String,String>();
	
	String mem_id 		= StringUtils.defaultString(request.getParameter("mem_id"), "");
	String mem_type 		= StringUtils.defaultString(request.getParameter("mem_type"), "");
	
	MemberDao mDao = new MemberDao();
	
	boolean isUpdate = mDao.memberTypeUpdate(mem_id , mem_type);
	
	if(isUpdate) out.println("0");
	else  out.println("1");
%>
