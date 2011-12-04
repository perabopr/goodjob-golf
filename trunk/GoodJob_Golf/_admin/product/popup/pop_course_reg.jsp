<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@page import="com.goodjob.reserve.dto.GolfLinkCourseDto"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String glSeq = request.getParameter("glSeq1");
String courseName = request.getParameter("course");

GolfLinkCourseDto glcdto = new GolfLinkCourseDto();
glcdto.setGolflink_seq(Integer.parseInt(glSeq));
glcdto.setCourse_name(courseName);

GolfLinkDao gfdao = new GolfLinkDao();
gfdao.setGolfLinkCourseInsert(glcdto);

try{
	response.sendRedirect("pop_course.jsp?glseq=" + glSeq);
}catch(Exception e){}
%>
</body>
</html>