<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.common.*"%>
<%@page import="com.goodjob.board.*"%>
<%@page import="com.goodjob.conf.Config"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String up_dir = Config.get("bbs_dir");
	
	
	FileUpload fileUpload = new FileUpload(request, up_dir, 1024*1024*5);

	//Map<String,String> paramMap = fileUpload.getParamMap();
	Map<String,String> fileMap = fileUpload.getParamAfterUpload();
	
	String idx = fileUpload.getParameter("idx");
	String email = fileUpload.getParameter("email");
	String subject = fileUpload.getParameter("subject");
	
	String[] name = fileUpload.getParameterValues("name");
	
	String content = fileUpload.getParameter("content");
	String password = fileUpload.getParameter("password");
	String upfile = (String)fileMap.get("upfile");
	
	BoardDto dto = new BoardDto();
	dto.setEmail(email);
	dto.setName(name[0]);
	dto.setMem_id("");
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPassword(password);
	dto.setFilename(upfile);
	dto.setWriteip(request.getRemoteAddr());
	dto.setIshtml("N");
	
	BoardDao dao = new BoardDao();
	dao.setInsert("TB_NOTICE_BBS" , dto);
	
	try{
		response.sendRedirect("./list.jsp");
	}catch(Exception e){}
%>
