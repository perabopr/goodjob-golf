<%@page import="com.goodjob.util.Utils"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%

try{
	
	session.invalidate();

	//response.sendRedirect("/_admin/");
%>
<script language="javascript" type="text/javascript">
top.document.location.href="/_admin/";
</script>
<%
	return;
	
} catch(Exception e){}
%>
