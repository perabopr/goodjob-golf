<%@page import="org.apache.commons.lang.math.NumberUtils"%><%@page import="com.goodjob.reserve.GolfLinkDao"%><%@
page import="java.util.List"%><%@
page import="com.goodjob.coupon.dto.CouponDto"%><%@
page import="com.goodjob.coupon.CouponDao"%><%@
page import="com.goodjob.member.MemberDto"%><%@
page import="com.goodjob.member.MemberDao"%><%@
page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%
int product_seq = NumberUtils.toInt(request.getParameter("product_seq"),0);
GolfLinkDao gfDao = new GolfLinkDao();
int save_price = gfDao.getSiteSavePrice(product_seq,3);
out.println(save_price);
%>