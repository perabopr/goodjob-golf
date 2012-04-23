<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.product.SiteDao"%>
<%@page import="com.goodjob.product.dto.SiteDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String mode =  request.getParameter("mode");
int siteseq =  NumberUtils.toInt(request.getParameter("siteseq"),0);
String txtSitename = request.getParameter("txtSitename");
String txtPhonenum = request.getParameter("txtPhonenum");
String ddlUseyn = request.getParameter("ddlUseyn");

SiteDto sDto = new SiteDto();
sDto.setSite_seq(siteseq);
sDto.setSite_name(txtSitename);
sDto.setPhone_num(txtPhonenum);
sDto.setUse_yn(ddlUseyn);


SiteDao sDao = new SiteDao();
if(mode.equals("add")){
	sDao.setSiteInsert(sDto);
}
else if(mode.equals("mod")){
	sDao.setSiteUpdate(sDto);
}

try{
	response.sendRedirect("./site_list.jsp");
}catch(Exception e){}
%>