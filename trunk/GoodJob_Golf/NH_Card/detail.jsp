<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.dbutils.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ include file="/include/header_nhcard.jsp" %>
<%int menuName = NumberUtils.toInt(request.getParameter("menu"),1);%>
					<table border="0" cellpadding="0" cellspacing="0" width="751">
						<tr>
						<td>
						<% if(menuName == 1){ %>
						<%@ include file="detail_real.jsp" %>
						<% }else if(menuName == 2){ %>
						<%@ include file="detail_pre.jsp" %>
						<% }else if(menuName == 3){ %>
						<% } %>
						</td>
						</tr>
						<tr>
                            <td>&nbsp;</td>
                          </tr>
					</table>
<%@ include file="/include/footer_nhcard.jsp" %>