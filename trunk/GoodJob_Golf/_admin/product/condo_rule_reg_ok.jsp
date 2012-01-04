<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.product.CondoDao"%>
<%@ page import="com.goodjob.product.dto.CondoPromiseDto"%>
<%
String cdSeq = StringUtils.trimToEmpty(request.getParameter("cdSeq"));
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

CondoPromiseDto cdpDto = new CondoPromiseDto();
cdpDto.setCondo_seq(Integer.parseInt(cdSeq));
cdpDto.setPromise1_type(p1t);
cdpDto.setPromise1(p1);
cdpDto.setPromise2_type(p2t);
cdpDto.setPromise2(p2);
cdpDto.setPromise3_type(p3t);
cdpDto.setPromise3(p3);
cdpDto.setPromise4_type(p4t);
cdpDto.setPromise4(p4);
cdpDto.setPromise5_type(p5t);
cdpDto.setPromise5(p5);
cdpDto.setCancelrule(cancelrule);

CondoDao cdDao = new CondoDao();
cdDao.setCondoPromiseDelete(Integer.parseInt(cdSeq));
cdDao.setCondoPromiseInsert(cdpDto);

out.print("<script type='text/javascript'>");
out.print("alert('수정되었습니다.');");
out.print("location.href='condo_rule_reg.jsp?condoSeq=" + cdSeq + "'");
out.print("</script>");
%>