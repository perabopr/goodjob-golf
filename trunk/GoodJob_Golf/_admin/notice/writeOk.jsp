<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.common.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	FileUpload fileUpload = new FileUpload(request, "/home/hosting_users/savekorea2400/www/tmp/", 1024*1024*5);

	Map<String,String> paramMap = fileUpload.getParamMap();
	Map<String,String> fileMap = fileUpload.getParamAfterUpload();

	String paramValue = (String)paramMap.get("age");
	String newFileName = (String)fileMap.get("upFile");
	
%>