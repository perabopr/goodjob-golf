<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ include file="/include/header_nhcard.jsp" %>
<%String menuName = StringUtils.defaultIfEmpty(request.getParameter("menu"),"1");%>
<table border="0" cellpadding="0" cellspacing="0" width="751">
<tr>
	<td>
		<% if(menuName.equals("1")){ %>
			<%@ include file="resultReal.jsp" %>
		<% }else if(menuName.equals("2")){ %>
			<%@ include file="resultPre.jsp" %>
		<% }else if(menuName.equals("3")){ %>
			<%//@ include file="resultPackage.jsp" %>
		<% }else if(menuName.equals("4")){ %>
			<%//@ include file="resultPackageForeign.jsp" %>
		<% }else if(menuName.equals("5")){ %>
			<%//@ include file="resultCondo.jsp" %>
		<% }%>
	</td>
</tr>
</table>
<%@ include file="/include/footer_nhcard.jsp" %>