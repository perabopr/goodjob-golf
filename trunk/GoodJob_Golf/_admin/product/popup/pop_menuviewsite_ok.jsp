<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.product.dto.MenuViewSiteDto"%>
<%@page import="com.goodjob.product.MenuViewSiteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String actmode = request.getParameter("actmode");
int menuseq = NumberUtils.toInt(request.getParameter("menuseq"), 0);
int serviceseq = NumberUtils.toInt(request.getParameter("serviceseq"), 0);
int siteseq = NumberUtils.toInt(request.getParameter("siteseq"), 0);

MenuViewSiteDto mvsDto = new MenuViewSiteDto();
mvsDto.setMenu_seq(menuseq);
mvsDto.setService_seq(serviceseq);
mvsDto.setSite_seq(siteseq);

MenuViewSiteDao mvsDao = new MenuViewSiteDao();

if(actmode.equals("ins")){
	mvsDao.setMenuViewSiteDelete(mvsDto);
	mvsDao.setMenuViewSiteInsert(mvsDto);
}else{
	mvsDao.setMenuViewSiteDelete(mvsDto);
}


try{
	response.sendRedirect("pop_menuviewsite.jsp?menuseq=" + menuseq + "&serviceseq=" + serviceseq);
}catch(Exception e){}
%>