<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ include file="header.jsp" %>
<%int menuName = NumberUtils.toInt(request.getParameter("menu"),1);%>
					<table border="0" cellpadding="0" cellspacing="0" width="751">
						<tr>
						<td>
						<% if(menuName == 1){ %>
						<%@ include file="billReal.jsp" %>
						<% }else if(menuName == 2){ %>
						<%@ include file="billPre.jsp" %>
						<% }else if(menuName == 3){ %>
						<%@ include file="billPackage.jsp" %>
						<% }else if(menuName == 4){ %>
						<%//@ include file="billPackageForeign.jsp" %>
						<% }else if(menuName == 5){ %>
						<%//@ include file="billCondo.jsp" %>
						<% } %>
						</td>
						</tr>
					</table>										
<%@ include file="tail.jsp" %>