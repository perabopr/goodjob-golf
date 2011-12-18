<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.util.*"%>
<%@ page import="com.goodjob.common.*"%>
<%@ page import="com.goodjob.board.*"%>
<%@ page import="com.goodjob.conf.Config"%><%

	request.setCharacterEncoding("utf-8");
	
	String join_no = StringUtils.trimToEmpty(request.getParameter("join_no"));
	
	BoardDao dao = new BoardDao();
	
	boolean isUpdate = dao.setJoinStatus(NumberUtils.toInt(join_no));
	
	if(isUpdate)
		out.println("0");
	else
		out.println("1");
%>
