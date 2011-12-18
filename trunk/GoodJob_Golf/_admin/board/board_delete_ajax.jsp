<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="com.goodjob.board.*"%><%

	request.setCharacterEncoding("UTF-8");


	String seq = StringUtils.trimToEmpty(request.getParameter("seq"));
	String join_no = StringUtils.trimToEmpty(request.getParameter("join_no"));
	String tname = StringUtils.trimToEmpty(request.getParameter("tname"));
	
	BoardDao dao = new BoardDao();
	
	boolean isDel = false;
	
	if("notice".equals(tname)){
		tname = "TB_NOTICE_BBS";
		isDel = dao.setDelete(tname , NumberUtils.toInt(seq));
	}
	else if("faq".equals(tname)){
		tname = "TB_FAQ_BBS";
		isDel = dao.setDelete(tname , NumberUtils.toInt(seq));
	}
	else if("join".equals(tname)){
		isDel = dao.setJoinDelete(NumberUtils.toInt(join_no));
	}
	
	if(isDel)
		out.println("0");
	else
		out.println("1");
%>
