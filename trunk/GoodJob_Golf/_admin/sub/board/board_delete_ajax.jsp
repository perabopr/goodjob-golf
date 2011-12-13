<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="com.goodjob.board.*"%><%

	request.setCharacterEncoding("UTF-8");


	String seq = StringUtils.trimToEmpty(request.getParameter("seq"));
	String tname = StringUtils.trimToEmpty(request.getParameter("tname"));
	
	if("notice".equals(tname))
		tname = "TB_NOTICE_BBS";
	else if("faq".equals(tname))
		tname = "TB_FAQ_BBS";
	else if("join".equals(tname))
		tname = "TB_FAQ_BBS";
	
	BoardDao dao = new BoardDao();
	
	boolean isDel = dao.setDelete(tname , NumberUtils.toInt(seq));
	
	if(isDel)
		out.println("0");
	else
		out.println("1");
%>
