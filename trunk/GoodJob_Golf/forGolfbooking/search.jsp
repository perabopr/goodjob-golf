<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="org.apache.commons.dbutils.*" %><%@ page import="org.apache.commons.lang.StringUtils"%><%@ page import="org.apache.commons.lang.math.NumberUtils"%><%@ include file="/include/header.jsp" %>
<%String menuName = StringUtils.defaultIfEmpty(request.getParameter("menu"),"1");%>
					<table border="0" cellpadding="0" cellspacing="0" width="751">
						<tr>
						<td>
						<%@ include file="searchList.jsp" %>
						</td>
						</tr>
					</table>					
                    <%@ include file="/include/copyright.jsp" %>					
<%@ include file="/include/footer.jsp" %>
