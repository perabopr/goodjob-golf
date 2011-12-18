<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="org.apache.commons.dbutils.*" %><%@ page import="org.apache.commons.lang.StringUtils"%><%@ page import="org.apache.commons.lang.math.NumberUtils"%><%@ include file="/include/header.jsp" %>
<%String menuName = request.getParameter("menu");%>
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
					<table border="0" cellpadding="0" cellspacing="0" width="751">
						<tr>
						<td>
						<% if(menuName == null || menuName == ""){ %>
						<%  response.sendRedirect("detail.jsp?menu=1"); %>
						<% }else if(menuName.equals("1")){ %>
						<%@ include file="ruleReal.jsp" %>
						<% }else if(menuName.equals("2")){ %>
						<%@ include file="rulePre.jsp" %>
						<% }else if(menuName.equals("3")){ %>
						<%@ include file="rulePackage.jsp" %>
						<% }else if(menuName.equals("5")){ %>
						<%@ include file="ruleCondo.jsp" %>
						<% }else{ %>
						<%  response.sendRedirect("detail.jsp?menu=1"); %>
						<% } %>
						</td>
						</tr>
					</table>					
                    <%@ include file="/include/copyright.jsp" %>					
<%@ include file="/include/footer.jsp" %>
