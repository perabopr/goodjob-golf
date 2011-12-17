<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="org.apache.commons.dbutils.*" %><%@ page import="org.apache.commons.lang.StringUtils"%><%@ page import="org.apache.commons.lang.math.NumberUtils"%><%@ include file="/include/header.jsp" %>
<%String menuName = request.getParameter("menu");%>
					<table border="0" cellpadding="0" cellspacing="0" width="751">
						<tr>
						<td>
						<% if(menuName == null || menuName == ""){ %>
						<%  response.sendRedirect("reserve.jsp?menu=REAL"); %>
						<% }else if(menuName.equals("1")){ %>
						<%@ include file="reserveReal.jsp" %>
						<% }else if(menuName.equals("2")){ %>
						<%@ include file="reservePre.jsp" %>
						<% }else if(menuName.equals("3")){ %>
						<%@ include file="reservePackage.jsp" %>
						<% }else if(menuName.equals("5")){ %>
						<%@ include file="reserveCondo.jsp" %>
						<% }else{ %>
						<%  response.sendRedirect("reserve.jsp?menu=1"); %>
						<% } %>
						</td>
						</tr>
					</table>					
                    <%@ include file="/include/copyright.jsp" %>					
<%@ include file="/include/footer.jsp" %>