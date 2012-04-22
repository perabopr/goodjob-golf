<%@page import="com.goodjob.product.CondoDao"%>
<%@page import="com.goodjob.product.dto.CondoDto"%>
<%@page import="com.goodjob.product.PackageDao"%>
<%@page import="com.goodjob.product.dto.PackageDto"%>
<%@page import="com.goodjob.product.dto.GolfLinkDto"%>
<%@page import="com.goodjob.product.GolfLinkDao"%>
<%@page import="com.goodjob.product.MenuViewSiteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%
String menuseq = request.getParameter("menuseq");
String serviceseq = request.getParameter("serviceseq");
String order_num = request.getParameter("onum");

if(menuseq.equals("1") || menuseq.equals("2")){
	GolfLinkDto gldto = new GolfLinkDto();
	gldto.setOrder_num(Integer.parseInt(order_num));
	gldto.setGolflink_seq(Integer.parseInt(serviceseq));
	
	GolfLinkDao glDao = new GolfLinkDao();
	glDao.setGolfLinkOrderUpdate(gldto);
}
if(menuseq.equals("3") || menuseq.equals("4")){
	PackageDto pkdto = new PackageDto();
	pkdto.setOrder_num(Integer.parseInt(order_num));
	pkdto.setPackage_seq(Integer.parseInt(serviceseq));
	
	PackageDao pkDao = new PackageDao();
	pkDao .setPackageOrderUpdate(pkdto);	
}
if(menuseq.equals("5")){
	CondoDto cddto = new CondoDto();
	cddto.setOrder_num(Integer.parseInt(order_num));
	cddto.setCondo_seq(Integer.parseInt(serviceseq));
	
	CondoDao cdDao = new CondoDao();
	cdDao .setCondoOrderUpdate(cddto);		
}
%>