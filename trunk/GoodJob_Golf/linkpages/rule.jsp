<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ 
page import="org.apache.commons.dbutils.*" %><%@ 
page import="org.apache.commons.lang.StringUtils"%><%@ 
page import="org.apache.commons.lang.math.NumberUtils"%>
<%//@ include file="/include/loginCheck.jsp" %>
<%@ include file="header.jsp" %>
<%int menuName = NumberUtils.toInt(request.getParameter("menu"),1);%>
					<table border="0" cellpadding="0" cellspacing="0" width="751">
						<tr>
						<td>
						<% if(menuName == 1){ %>
						<%@ include file="ruleReal.jsp" %>
						<% }else if(menuName == 2){ %>
						<%@ include file="rulePre.jsp" %>
						<% }else if(menuName == 3){ %>
						<%@ include file="rulePackage.jsp" %>
						<% }else if(menuName == 4){ %>
						<%//@ include file="rulePackageForeign.jsp" %>
						<% }else if(menuName == 5){ %>
						<%//@ include file="ruleCondo.jsp" %>
						<% } %>
						</td>
						</tr>
						<tr>
                            <td>&nbsp;</td>
                          </tr>
					</table>					
<%@ include file="tail.jsp" %>
