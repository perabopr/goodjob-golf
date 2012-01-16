<%@page import="com.goodjob.product.productDao"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%
String CouponUseYn = StringUtils.trimToEmpty(request.getParameter("cpUseYn"));
int menu = NumberUtils.toInt(request.getParameter("menu"));
int glseq = NumberUtils.toInt(request.getParameter("glseq"));
String prdtYear = StringUtils.trimToEmpty(request.getParameter("year"));
String prdtMonth = StringUtils.trimToEmpty(request.getParameter("month"));
prdtMonth = prdtMonth.length() == 1 ? "0" + prdtMonth : prdtMonth;
productDao prdtDao = new productDao();
prdtDao.setProductSubCouponUpdate(CouponUseYn, menu, glseq ,prdtYear ,prdtMonth);
%>