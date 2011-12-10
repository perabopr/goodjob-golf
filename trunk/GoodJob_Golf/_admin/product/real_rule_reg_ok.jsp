<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.goodjob.reserve.GolfLinkDao"%>
<%@ page import="com.goodjob.reserve.dto.GolfLinkPromiseDto"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%
String menuSeq = StringUtils.trimToEmpty(request.getParameter("menuSeq"));
String glSeq = StringUtils.trimToEmpty(request.getParameter("glSeq"));
String p1 = StringUtils.trimToEmpty(request.getParameter("promise1"));
String p1t = StringUtils.trimToEmpty(request.getParameter("promise1_type"));
String p2 = StringUtils.trimToEmpty(request.getParameter("promise2"));
String p2t = StringUtils.trimToEmpty(request.getParameter("promise2_type"));
String p3 = StringUtils.trimToEmpty(request.getParameter("promise3"));
String p3t = StringUtils.trimToEmpty(request.getParameter("promise3_type"));
String p4 = StringUtils.trimToEmpty(request.getParameter("promise4"));
String p4t = StringUtils.trimToEmpty(request.getParameter("promise4_type"));
String p5 = StringUtils.trimToEmpty(request.getParameter("promise5"));
String p5t = StringUtils.trimToEmpty(request.getParameter("promise5_type"));
String cancelrule = StringUtils.trimToEmpty(request.getParameter("cancelrule"));

GolfLinkPromiseDto glpDto = new GolfLinkPromiseDto();
glpDto.setGolflink_seq(Integer.parseInt(glSeq));
glpDto.setPromise1_type(p1t);
glpDto.setPromise1(p1);
glpDto.setPromise2_type(p2t);
glpDto.setPromise2(p2);
glpDto.setPromise3_type(p3t);
glpDto.setPromise3(p3);
glpDto.setPromise4_type(p4t);
glpDto.setPromise4(p4);
glpDto.setPromise5_type(p5t);
glpDto.setPromise5(p5);
glpDto.setCancelrule(cancelrule);

GolfLinkDao glDao = new GolfLinkDao();
glDao.setGolfLinkPromiseDelete(Integer.parseInt(glSeq));
glDao.setGolfLinkPromiseInsert(glpDto);

out.print("<script type='text/javascript'>");
out.print("alert('수정되었습니다.');");
out.print("location.href='real_rule_reg.jsp?menuseq=" + menuSeq + "&glseq=" + glSeq + "'");
out.print("</script>");
%>